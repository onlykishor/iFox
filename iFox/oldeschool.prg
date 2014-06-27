* ESchool Master Program

* environment
SET TALK OFF
SET CENTURY ON
SET DATE BRITISH
SET MARK TO '-'
SET DELETED ON
SET NULLDISPLAY TO ''
*-- 19-Apr-2012
*SET MEMOWIDTH TO 80
SET MEMOWIDTH TO 300
*== 19-Apr-2012
*!*	SET STATUS BAR OFF
SET SAFETY OFF
SET SECONDS OFF 
SET ESCAPE OFF
*SET DEVELOPMENT OFF 
SET ASSERTS OFF 
SET RESOURCE ON

*-- just for time being
* once the sql resolved in marks3.update.click method
* this can be removed
SET ENGINEBEHAVIOR 70
*--

*-- Report engine vars
SET REPORTBEHAVIOR 90
_ReportOutput = 'ReportOutput.app'
_ReportPreview = 'ReportPreview.app'
_ReportBuilder = 'ReportBuilder.app'

*!*	IF FILE('ReportOutput.app')
*!*		_REPORTOUTPUT = 'ReportOutput.app'
*!*	ENDIF

SET CLASSLIB TO library

#DEFINE True    .T.
#DEFINE False   .F.
#DEFINE LF      CHR(13)

*-- SMTP email proc
SET PROCEDURE TO smtp ADDITIVE 

PUBLIC xRegisterID, xUserID, xUserName, xMessage, xHost, xDataSource, xDBUserID, xPassword, xDatabase

STORE 0 TO xRegisterID, xUserID
STORE '' TO xUserName, xMessage

xHost = '(local)'

* Quit if any instance is already running
*CheckAppInstance()
*!*	IF IsWindExist('iFox')
*!*		QUIT
*!*	ENDIF

ON SHUTDOWN ShutDown()

ZOOM WINDOW screen MAX

_SCREEN.Caption = 'iFox'

IF FILE('info.ico')
	_SCREEN.Icon = 'INFO.ICO'
ENDIF

* add custom properties to _SCREEN object
_SCREEN.AddProperty('nConnID',0)
_SCREEN.AddProperty('cStatusMsg',0)

ON ERROR DO errhand WITH ;
   ERROR(), MESSAGE(), MESSAGE(1), PROGRAM(), LINENO()

IF NOT DBUSED('eschool')
	OPEN DATABASE data\eschool
	llOpenDB = True
ENDIF

xDataSource = DBGETPROP("RemoteData", "CONNECTION", "DataSource")
xDBUserID   = DBGETPROP("RemoteData", "CONNECTION", "UserId" )
xPassword   = DBGETPROP("RemoteData", "CONNECTION", "PassWord" )
xDatabase   = DBGETPROP("RemoteData", "CONNECTION", "Database" )

* set connection to synchronous mode
IF DBGETPROP(xDataSource, "CONNECTION" ,"Asynchronous")
	DBSETPROP(xDataSource, "CONNECTION" ,"Asynchronous", .F.)
ENDIF

IF llOpenDB
	CLOSE DATABASES 
ENDIF

* start up checks on database
IF NOT iFoxDBExist()
	IF MESSAGEBOX('iFox Database does not exits. Create now?',36,'Message') = 6
		IF CreateDatabase()
			=UpdateDatabase()
		ELSE
			=MESSAGEBOX('Unable to setup iFox Database. Please try again.', 16, 'Message')
			QUIT
		ENDIF
	ELSE
		QUIT
	ENDIF
ELSE
	IF FILE('updatedb.txt')
		IF UpgradeDB()
			ERASE updatedb.txt
		ELSE
			=MESSAGEBOX('Unable to update iFox database.', 16, 'Message')
		ENDIF
	ENDIF
ENDIF 

IF FILE('runupdate.txt')
	=UpdateDatabase()
	ERASE runupdate.txt
ENDIF

* get sql server name
IF RunSQL("select convert(sysname, serverproperty(N'servername')) AS host",'_host') AND RECCOUNT('_host') > 0
	xHost = ALLTRIM(_host.host)
	* if localhost
	IF xHost $ SYS(0)
		xHost = xHost + ' (local)'
	ENDIF
	USE IN _host
*!*		RUNSQL('SET QUOTED_IDENTIFIER OFF')
ENDIF

DO FORM login
IF FILE('foxypreviewer.app')
	DO foxypreviewer.app
ENDIF

*-- show status bar
ShowStatusBar()

*-- activate and show toolbar
iTools = CREATEOBJECT('iToolBar')
iTools.Dock(0)
iTools.Visible = True
iTools.Enabled = False

READ EVENTS

*!*********************************************************
*!
*!        Function: IsWindExist
*!
*!*********************************************************
* Description
* Quits if an instance is already running
FUNCTION IsWindExist
PARAMETERS WindowName

     IsWindExist = .F.

     SET LIBRARY TO foxtools.fll

     * Register the Windows API functions that will be called

     mGetWinTxt = RegFn("GetWindowText", "I@CI", "I")
     mGetWindow = RegFn("GetWindow", "II", "I")
     mIsWinVis =  RegFn("IsWindowVisible", "I", "I")

     * Get the HWND (handle) to the main FoxPro window

     foxhwnd = MAINHWND()

     * Produce a list of all windows

        hwndNext = CallFn(mGetWindow,foxhwnd,0)

     DO WHILE hwndNext <> 0

          IF (hwndnext <> foxhwnd) .AND. ;
               CallFn(mGetWindow,hwndnext,4) = 0 .AND. ;
               CallFn(mIsWinVis,hwndnext) <> 0

               Stuffer = SPACE(64)
               x = CallFn(mGetWinTxt,hwndnext,@Stuffer,64)

               * If a window name was specified, check to
               * see if this is the specified window. If a
               * window name was not specified, display the
               * name of the window.

                IF WindowName $ Stuffer

                     IsWindExist = .T.
                     EXIT

                ENDIF

          ENDIF

         hwndNext = CallFn(mGetWindow,hwndnext,2)

        ENDDO

     SET LIBRARY TO

     IF LEN(TRIM(WindowName)) = 0
          IsWindExist = .T.
     ENDIF

RETURN IsWindExist

*!*********************************************************
*!
*!        Function: CheckAppInstance
*!
*!*********************************************************
* Description
* Quits if an instance is already running
PROCEDURE CheckAppInstance

	#DEFINE SW_NORMAL   1
	#DEFINE SW_MAXIMIZE 3
	#DEFINE SW_MINIMIZE  6

	DECLARE LONG FindWindow IN user32 STRING, STRING
	DECLARE LONG BringWindowToTop IN user32 LONG
	DECLARE LONG ShowWindow IN user32 LONG, LONG

	LOCAL lnHWND, lcTitle

	lcTitle = _SCREEN.Caption
	_SCREEN.Caption = SYS(3)
	
	lnHWND = FindWindow(NULL, 'iFox')
	_SCREEN.Caption = lcTitle

	IF lnHWND > 0
		BringWindowToTop(lnHWND)
		ShowWindow(lnHWND, SW_MAXIMIZE)
		QUIT
	ENDIF

ENDPROC

*!*********************************************************
*!
*!        Function: ISMONTH
*!
*!*********************************************************
* Description
* Returns .T. if a given string is a month name
PROCEDURE IsMonth
PARAMETER mName

RETURN INLIST(UPPER(ALLTRIM(mName)),'JANUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY', ;
'AUGUST','SEPTEMBER','OCTOBER','NOVEMBER','DECEMBER')


*!*********************************************************
*!
*!        Function: StripDots
*!
*!*********************************************************
* Description
* removes dots(".") and apostropes("'") from given string
FUNCTION StripDots
PARAMETER cTxt

lcTemp = ''

cTxt = STRTRAN(cTxt, '.', ' ')
cTxt = STRTRAN(cTxt, "'", ' ')

RETURN cTxt

*!*********************************************************
*!
*!        Function: CanAccess
*!
*!*********************************************************
* Description
*-- checks whether selected can be accessed by current user
FUNCTION CanAccess(item)

lRet = .F.
lOpenModule = .F.
lcAlias = ALIAS()
lcSQL = ''

IF xUserID = 1		&& userid-1 will always have full previliges
	lRet = .T.
ELSE

	lcSQL = 'SELECT * ' + ;
			'  FROM modules '

	RUNSQL(lcSQL,'modules')

	IF NOT USED('modules')
		USE data\eschool!modules IN 0
		lOpenModule = .T.
	ENDIF

	SELECT modules
	GO TOP
	LOCATE FOR userid = xUserID AND UPPER(ALLT(modname)) == UPPER(ALLT(item))
	IF FOUND()
		IF canopen
			lRet = .T.
		ENDIF
	ENDIF
	USE
ENDIF

IF lRet = .F.
	=MESSAGEBOX('You do not have access for this item!',16,'Security')
ENDIF

IF NOT EMPTY(lcAlias)
	SELECT (lcAlias)
ENDIF

RETURN lRet

*!*********************************************************
*!
*!        Function: g_Address
*!
*!*********************************************************
* Description
*-- returns a line-formatted comma separated style address
FUNCTION g_Address(xAddress)

mAddress = ''
lnLines  = MEMLINES(xAddress)

FOR i = 1 TO lnLines

*!*		IF LEN(mAddress) >= 60
*!*			mAddress = mAddress + CHR(13)
*!*		ENDIF

	mAddress = IIF(EMPTY(mAddress),'',mAddress ) + ALLTRIM(MLINE(xAddress,i))
	
	IF i < lnLines
		mAddress = mAddress + ', '
	ENDIF

ENDFOR

RETURN mAddress


*!*********************************************************
*!
*!        Function: ShutDown
*!
*!*********************************************************
* Description
*-- quits the application with logging
FUNCTION ShutDown()

WAIT 'Closing iFox...' WINDOW NOWAIT

IF FILE('running.txt')
	ERASE running.txt
ENDIF

=STRTOFILE('Logout: ' + xUserName +'  '+TTOC(DATETIME())+CHR(13)+CHR(10),'UserLog.txt',1)

QUIT

RETURN .T.

*!*********************************************************
*!
*!        Function: ERRHAND
*!
*!*********************************************************
* Description
* Handles program generated errors
PROCEDURE ErrHand
PARAMETER merror, mess, mess1, mprog, mlineno
LOCAL lcMessage

lcMessage = ''

*!*	CLEAR
*!*	=AERROR(laErrorArray)  && Data from most recent error

*!*	FOR n = 1 TO 7  && Display all elements of the array
*!*		lcMessage = lcMessage + IIF(ISNULL(laErrorArray(n)),'',TRANSFORM(laErrorArray(n)) + CHR(13))
*!*	ENDFOR

lcMessage = 'Error number : ' + LTRIM(STR(merror))+CHR(13)+ ;
			'Error Message : ' + mess + CHR(13) + CHR(13)+ ;
			'Source Code  : ' + mess1 + CHR(13) + ;
			'Line number : ' + LTRIM(STR(mlineno)) + CHR(13) +;
			'Source Program : ' + mprog + CHR(13)

*ret = SQLEXEC(cn,"sp_oledb_database","dbs1")

IF merror = 2005
	=MESSAGEBOX('Login error - Possible reason is connectivity failure.' + CHR(13) + ;
				CHR(13) + lcMessage, 16,'Message')
	QUIT
ELSE
	=MESSAGEBOX(lcMessage, 16, 'ERROR')
ENDIF

RETURN

*!*********************************************************
*!
*!        Function: SHOWERROR
*!
*!*********************************************************
* Description
* Displays error message
PROCEDURE ShowError
PARAMETER cErrorMessage

*

RETURN

*!*********************************************************
*!
*!        Function: GETSETTING
*!
*!*********************************************************
* Description
* Gets a software setting
FUNCTION GetSetting
PARAMETERS cSetting
LOCAL cValue, lcSQLString, lnSelect

cValue = 'N'
cSetting = ALLTRIM(cSetting)
lnSelect = SELECT()

lcSQLString = "SELECT * " + ;
			  "  FROM settings " + ;
			  " WHERE settingname = '" + cSetting + "'"

IF RunSQL(lcSQLString,'_settings') AND RECCOUNT('_settings') > 0
	SELECT _settings
	cValue = settingvalue
	USE
ENDIF

SELECT (lnSelect)
RETURN cValue

ENDFUNC

*!*********************************************************
*!
*!        Function: RUNSQL
*!
*!*********************************************************
* Description
* Runs SQL on backend and returns results cursor
FUNCTION RunSQL
PARAMETERS pcSQL, pcResultCursor
LOCAL lnHandle, lReturn, lnSelect

	lReturn = .T.
	lnSelect = SELECT()

	lnHandle = GetSQLHandle()
	IF lnHandle > 0

		&& pcResultCursor not provided
		IF PCOUNT() = 1
			pcResultCursor = GetUniqueFileName()
		ENDIF

		SELECT 0
		lnResult = SQLEXEC(lnHandle, pcSQL, pcResultCursor)

		IF lnResult < 0		&& failed to execute sql
			lcError = ''
			AERROR(arrCheck)
			FOR ix=3 TO 3	&& 1 TO 7
				lcError = m.lcError + TRANSFORM(arrCheck [ix])+ CHR(13)
			ENDFOR
			*=MESSAGEBOX("Unable to execute command." + CHR(13) + ;
				pcSQL,16,"Message")
			=MESSAGEBOX("Unable to execute command." + CHR(13) + ;
				pcSQL + CHR(13) + lcError, 16, "Message")
			lReturn = .F.
		ELSE
			IF PCOUNT() = 1 AND USED(pcResultCursor)
				USE IN SELECT(pcResultCursor)
			ENDIF
		ENDIF

		*SQLDISCONNECT(lnHandle)
	ENDIF

	* restore old alias if failed to run
	IF NOT lReturn AND lnSelect > 0
		SELECT (lnSelect)
	ENDIF
	
RETURN lReturn


*!*********************************************************
*!
*!        Function: GetUniqueFileName
*!
*!*********************************************************
* Description
* Returns unique file name
FUNCTION GetUniqueFileName

RETURN SYS(2015)

*!*********************************************************
*!
*!        Function: CreateDatabase
*!
*!*********************************************************
* Description
* Create backend database
FUNCTION CreateDatabase
LOCAL llRetVal, llBackup

	llRetVal = True

	IF !FILE('sqlupdate.dbf') OR !FILE('sqlupdate.fpt')
		=MESSAGEBOX('Update command file(s) missing!',16,'Error')
		RETURN False
	ENDIF

	IF NOT FILE('tables.sql')
		=MESSAGEBOX('Database script missing - tables.sql',16,'Error')
		RETURN False
	ENDIF
	*=== 3-Mar-2011 run script file instead of executing commands from table

	WAIT WINDOW 'Creating iFox Database. Please wait...' NOWAIT

	IF EMPTY(DBC())
		OPEN DATABASE data\eschool NOUPDATE
	ENDIF

	lcDataBase = 'iFox'

	xds = DBGETPROP("remotedata","CONNECTION" ,"DataSource" )
	xpwd = DBGETPROP("remotedata","CONNECTION" ,"PassWord" )
	xuser = DBGETPROP("remotedata","CONNECTION" ,"UserId" )

	CLOSE DATABASES

	* setting to suppress login dialog if failed to connect
	SQLSETPROP(0,"DispLogin",3)
	SQLSETPROP(0,"DispWarnings",.F.)
	
	cn = SQLCONNECT(xds,xuser,xpwd)

	IF cn < 0
		=MESSAGEBOX('Connection failed to database server!',16,'Error')
		RETURN False
	ENDIF

	dbcmd = "CREATE DATABASE &lcDataBase "
	
*!*		ON (NAME = N'&lcDataBase'," + ;
*!*				"FILENAME=N'c:\Program Files\Microsoft SQL Server\MSSQL\DATA\&lcDataBase .mdf' ,SIZE = 10,FILEGROWTH = 10%) " + ;
*!*				"LOG ON (NAME=N'&lcDataBase',FILENAME=N'C:\Program Files\Microsoft SQL Server\MSSQL\DATA\&lcDataBase .LDF' , " + ;
*!*				"SIZE=2, FILEGROWTH=10%)"

	ret = SQLEXEC(cn, dbcmd)

	IF ret < 0
		=MESSAGEBOX('Unable to create the database - ' + lcDataBase,16,'Message')
		llRetVal = False
	ELSE

		=SQLEXEC(cn,'use '+lcDataBase)

		*--- 3-Mar-2011 run script file instead of executing commands from table
		USE sqlupdate IN 0
		SELECT sqlupdate
		SCAN
			ret = SQLEXEC(cn,sqlcmd)
			IF ret < 0
				=MESSAGEBOX(sqlcmd,16,'Update command failed!')
				llRetVal = False
				EXIT
			ENDIF
		ENDSCAN

		RUN sqlcmd -E -S localhost -i script.sql
		*=== 3-Mar-2011 run script file instead of executing commands from table

		*SQLDISCONNECT(cn)

		OPEN DATABASE data\eschool EXCLUSIVE 
		DBSETPROP("remotedata","CONNECTION" ,"Database",lcDataBase)
		CLOSE DATABASE
	ENDIF 

	WAIT CLEAR

RETURN llRetVal

*!*********************************************************
*!
*!        Function: iFoxDBExist
*!
*!*********************************************************
* Description
* Checks for iFox DB existance on SQL backend
FUNCTION iFoxDBExist
LOCAL llRetVal, lcConnStr, lcDataSource, lcUserID, lcPassword, lcConnStr, lcConnHandle

	llRetVal = False

*!*		IF EMPTY(DBC())
*!*			OPEN DATABASE \ifox\data\eschool
*!*		ENDIF

*!*		lcDataSource = DBGETPROP("RemoteData", "CONNECTION", "DataSource")
*!*		lcUserID = DBGETPROP("RemoteData", "CONNECTION", "UserId" )
*!*		lcPassword = DBGETPROP("RemoteData", "CONNECTION", "PassWord" )

*!*		CLOSE DATABASES

*!*		lcConnStr = 'dsn=' + lcDataSource + ;
*!*					';uid=' + lcUserID + ;
*!*					';pwd=' + lcPassword

*!*		lnConnHandle = SQLSTRINGCONNECT(lcConnStr)

	lnConnHandle = GetSQLHandle()

	IF lnConnHandle < 0
	   xMessage = 'Connection to dataserver failed!'
	ELSE
		IF SQLEXEC(lnConnHandle,"sp_oledb_database","_dbs") > 0 AND USED('_dbs')
			SELECT _dbs
			LOCATE FOR UPPER(ALLTRIM(name)) == UPPER(ALLTRIM(xDatabase)) &&LEFT(UPPER(name),4) == 'IFOX'
			llRetVal = FOUND()
			USE IN _dbs
		ELSE
			xMessage = 'Unable to retrieve database info!'
			llRetVal = False
		ENDIF
		*SQLDISCONNECT(lnConnHandle)
	ENDIF

	RETURN llRetVal
ENDFUNC

*!*********************************************************
*!
*!        Function: BackupData
*!
*!*********************************************************
* Description
* DB Backup
FUNCTION BackupData
	LOCAL nHandle, llReturn, lcSQL, lcBackupDir
	
	nHandle = GetSQLHandle()
	IF nHandle > 0
		llReturn = (SQLEXEC(nHandle, "USE IFOX")>0)		&& set iFox DB to default

*!*			lcSQL = "SELECT * " + ;
*!*					"  FROM sysobjects " + ;
*!*					" WHERE xtype = 'U' " + ;
*!*					"   AND name <> 'dtproperties' "

*!*			llReturn = llReturn AND (SQLEXEC(nHandle, lcSQL, "tableslist")>0)
*!*			llReturn = llReturn AND USED('tableslist') AND RECCOUNT('tableslist') > 0
		
		llReturn = llReturn AND (SQLTABLES(nHandle, 'TABLE', 'tableslist')>0)

		IF llReturn
		
			lcBackupDir = 'd:\backup\'
			IF NOT DIRECTORY('d:\backup')
				MKDIR c:\backup
			ENDIF

			CREATE DATABASE (lcBackupDir + 'eschool')
			
			SELECT tableslist
			SCAN
				
				WAIT WINDOW 'Backup - ' + ALLTRIM(table_name) NOWAIT

				*backup each individual table
				lcSQL = "SELECT * " + ;
						"  FROM " + table_name
				=SQLEXEC(nHandle, lcSQL, 'temptable')
				
				SELECT temptable
				COPY ALL TO (lcBackupDir + tableslist.table_name) DATABASE (lcBackupDir + 'eschool')
				USE IN temptable
				
			ENDSCAN
			USE IN tableslist
			WAIT CLEAR
			CLOSE DATABASE
		ENDIF
		
		*SQLDISCONNECT(nHandle)	
	ENDIF

RETURN llReturn

*!*********************************************************
*!
*!        Function: RestoreData
*!
*!*********************************************************
* Description
* DB Restore
FUNCTION RestoreData
	LOCAL nHandle, llReturn, lcSQL, lcBackupDir

	nHandle = GetSQLHandle()
	IF nHandle > 0
		llReturn = (SQLEXEC(nHandle, "USE IFOX")>0)		&& set iFox DB to default

		llReturn = llReturn AND (SQLTABLES(nHandle, 'TABLE', 'tableslist')>0)
		
		IF llReturn
			lcBackupDir = 'c:\backup\'
			
			OPEN DATABASE data\eschool EXCLUSIVE

			SELECT tableslist
			SCAN

				WAIT 'Restore - ' + ALLTRIM(table_name) WINDOW NOWAIT

				lcTable = lcBackupDir + table_name
				IF NOT FILE(lcTable + '.DBF')
					LOOP
				ENDIF

				lcAlias = ALLTRIM(table_name)
				
				USE (lcTable) ALIAS (lcAlias) IN 0
				SELECT (lcAlias)
				lcKeyField = lcAlias + '.' + ALLTRIM(FIELD(1))
				lcView = lcAlias + '_remote'

				CREATE SQL VIEW (lcView) CONNECTION RemoteData AS SELECT * FROM &lcAlias
				
				DBSETPROP(lcKeyField,"Field","KeyField",.T.)
				DBSETPROP(lcView,"View","SendUpdates",.T.)
				
				USE IN (lcAlias)
				USE (lcView)
				APPEND FROM (lcTable)
				
				USE IN (lcView)
				DELETE VIEW (lcView)

			ENDSCAN
			USE IN tableslist
			WAIT CLEAR

			*SQLDISCONNECT(nHandle)	
		ENDIF
	ENDIF

RETURN True

*!*********************************************************
*!
*!        Function: Viewer
*!
*!*********************************************************
* Description
* Launch viewer
FUNCTION Viewer
PARAMETERS pcFileName, pcTitle
	LOCAL oViewer, llReturn

	IF PCOUNT() > 0 
		IF NOT FILE(pcFileName)
			=MESSAGEBOX('File does not exist - ' + pcFileName, 64, 'Message')
		ELSE
			IF TYPE('oViewer') # 'O'
				oViewer = CREATEOBJECT('viewer') &&, 'library')
			ENDIF 
			IF TYPE('oViewer') = 'O'
				oViewer.cFile = pcFileName
				oViewer.Caption = pcTitle
				oViewer.Show(1)
				llReturn = True
			ENDIF
		ENDIF
	ELSE
		WAIT WINDOW 'File not specified'
	ENDIF

	RETURN llReturn
ENDFUNC

*!*********************************************************
*!
*!        Function: UpgradeDB
*!
*!*********************************************************
* Description
* Upgrade iFox DataBase
PROCEDURE UpgradeDB
	LOCAL nHandle, llReturn

	llReturn = BackupData()
	
	IF llReturn
		nHandle = GetSQLHandle()
		llReturn = ( nHandle > 0 )
	ENDIF
	
	IF llReturn
		WAIT 'Deleting Database - iFox...' WINDOW NOWAIT
		IF (SQLEXEC(nHandle, 'DROP DATABASE ifox')>0)
			llReturn = True
		ELSE
			llReturn = False
		ENDIF
		WAIT CLEAR
		*SQLDISCONNECT(nHandle)
	ENDIF
	
	IF llReturn
		llReturn = CreateDatabase()
	ENDIF
	
	IF llReturn
		llReturn = RestoreData()
	ENDIF

	RETURN llReturn
ENDPROC

*!*********************************************************
*!
*!        Function: GetSQLHandle
*!
*!*********************************************************
* Description
* Connects to SQL Server and returns a connection handle
FUNCTION GetSQLHandle
	LOCAL llOpenDB, lnHandle

	IF TYPE('_SCREEN.nConnID') = 'U' 
		* add custom properties to _SCREEN object
		_SCREEN.AddProperty('nConnID',0)
	ENDIF 

	IF _SCREEN.nConnID = 0 
		IF TYPE('xDataSource') = 'U'
			IF EMPTY(DBC())
				OPEN DATABASE data\eschool
				llOpenDB = True
			ENDIF

			xDataSource = DBGETPROP("RemoteData", "CONNECTION", "DataSource")
			xDBUserID   = DBGETPROP("RemoteData", "CONNECTION", "UserId" )
			xPassword   = DBGETPROP("RemoteData", "CONNECTION", "PassWord" )
			xDatabase   = DBGETPROP("RemoteData", "CONNECTION", "Database" )

			* set connection to synchronous mode
			IF DBGETPROP(xDataSource, "CONNECTION" ,"Asynchronous")
				DBSETPROP(xDataSource, "CONNECTION" ,"Asynchronous", .F.)
			ENDIF

			IF llOpenDB
				CLOSE DATABASES 
			ENDIF
		ENDIF

		_SCREEN.nConnID = SQLCONNECT(xDataSource, xDBUserID, xPassword)
		SQLEXEC(_SCREEN.nConnID, 'USE ' + xDatabase)

	ENDIF

	RETURN _SCREEN.nConnID
ENDFUNC

*!*********************************************************
*!
*!        Function: GetCode128b
*!
*!*********************************************************
* Description
* Returns a string to barcode 128b
FUNCTION GetCode128b
	PARAMETERS lnValue
	DIMENSION a_code( 2 )
	LOCAL lcValue

	lcValue = TRANSFORM(lnValue)
	
	a_code( 1 ) = lcValue
	Code128b( @a_code )
	
*!*		IF a_code( 2 ) > 0
		lcValue = a_code( 1 )
*!*		ENDIF

RETURN lcValue

*!*********************************************************
*!
*!        Function: Code128b
*!
*!*********************************************************
* Description
* Converts a string to barcode 128 b (Thanks to Ron Olson - fox.wikis.com)
PROCEDURE Code128b
*****************************************************
* REQUIRES - one dimenson array with two elements. Passed by reference
* PARAMETERS - aResult
* aResult( 1 ) - string, value to convert.
* aResult( 2 ) - init as logical, stores numeric.
* lnError - number of characters outside of ascii 32-126
* lnChksum - barcode128 checksum value
* lnX - pointer, character position for checksum calculation.
* lcString - a_resul( 1 ), initial string value
* lcCode - resulting barcode string
* RETURNS array aResult
* aResult( 1 ) - convertd string
* aResult( 2 ) - error status, -1 = empty, 0 = no error, 0 > number of characters removed

LPARAMETERS aResult[2]
LOCAL lnError, lnChksum, lnX, lcString, lcCode
STORE 0 TO lnChksum, lnError, lnX
STORE '' TO lcCode, lcString

lcString = IIF( VARTYPE( aResult[1] ) <> 'C', '', ALLTRIM( aResult[1] ) )
aResult[2] = IIF( EMPTY( lcString), -1, 0 )

FOR i = 1 TO LEN( lcString )

	IF !BETWEEN( ASC( SUBSTR( lcString, i, 1 )  ), 32, 126 )	&& illegal char
		lnError = lnError + 1	&& increment error counter
		LOOP
	ENDIF
	lnx = lnx + 1 	&& increment char pointer
	*************************************
	* calculate checksum, ( ASCII value - 32 ) times the char position
	* minus 32 is the offset between the ASCII value and the char value from TABLE B of BARCODE 128
	lnChksum = lnChksum + ( ( ASC( SUBSTR( lcString, i, 1 ) ) - 32 )* lnX )
	*************************************
	* build the correct string without illegal chars
	lcCode = lcCode + SUBSTR( lcString, i, 1 )
	
ENDFOR

****************************
* set error result if errors
aResult[2] = IIF( aResult[2] = -1, -1, lnError )

****************************
* Checksum is the Modulus from
* wieghted chars values ( barcode128b value * char position )
* Plus startcode value ( 104 )
* devided by 103
lnChksum = lnChksum + 104
lnChksum = MOD( lnChksum, 103 )

*****************************
* final string is startcode + string + cheksum + stopcode
aResult[1] = CHR( 204 ) + lcCode + CHR( lnChksum + 32 ) + CHR( 206 )

RETURN


*!*********************************************************
*!
*!        Function: ShowStatusBar
*!
*!*********************************************************
* Description
* Displays a status bar
FUNCTION ShowStatusBar

	IF NOT PEMSTATUS(_SCREEN,"StatusBar", 5) THEN
		_SCREEN.NEWOBJECT("StatusBar","ctl32_statusbar", "ctl32_statusbar.vcx", null, 5)
*!*			_SCREEN.NEWOBJECT("StatusBar","ctl32_statusbar", "ctl32.vcx", null, 5)
	ENDIF

	WITH _SCREEN.StatusBar
	    *.PanelMessage.ctlIcon = [ICONS\info1.ico]
	    *.ctlPanels(1).ctlCaption = 'school name'
	    .ctlPanels(2).ctlCaption = 'User : ' + xUserName
	    .ctlPanels(3).ctlCaption = 'Host : ' + xHost
	    .ctlPanels(4).ctlCaption = []
	    .ctlPanels(5).ctlCaption = []
	    .ctlPanels(2).ctlIcon = [ICONS\user.ico]
	    .ctlPanels(3).ctlIcon = [ICONS\dbserver.ico]
	    *.ctlPanels(3).ctlIcon = [ICONS\printer.ico]
	    *.ctlPanels(4).ctlIcon = [ICONS\explorer.ico]
	    *.ctlPanels(5).ctlIcon = [ICONS\help.ico]
		
		*.ProgressBar.ctlVisible = 1
		.PanelDate.ctlFormat = 2
		*.PanelDate.ctlIcon = 'ICONS\cal16.ico'
	ENDWITH
RETURN
ENDFUNC

*!*********************************************************
*!
*!        Function: UpdateStatusBar
*!
*!*********************************************************
* Description
* Updates the status bar
FUNCTION UpdateStatusBar
PARAMETERS cMsg
	IF TYPE('_SCREEN.StatusBar') = 'O'
		IF PEMSTATUS(_SCREEN,'StatusBar',5)
			_SCREEN.cStatusMsg = cMsg
			WITH _SCREEN.StatusBar
			    *.PanelMessage.ctlIcon = [ICONS\info1.ico]
			    .ctlMessage = _SCREEN.cStatusMsg
			ENDWITH
		ENDIF
	ENDIF
RETURN
ENDFUNC

*!*********************************************************
*!
*!        Function: GetMaxID
*!
*!*********************************************************
* Description
* Gets max key from a given table
FUNCTION GetMaxID
PARAMETERS pcTable, pcKeyField, pcWhere
LOCAL lnReturn, lcSQL, lcTable, lnSelect, lcWhere

lnReturn = -1
lnSelect = SELECT()
lcWhere = IIF(EMPTY(pcWhere),'1=1',pcWhere)

IF NOT EMPTY(pcTable)

	pcKeyField = IIF(EMPTY(pcKeyField),'rowid',pcKeyField)

	lcTable = GetUniqueFileName()
*!*		lcSQL = "SELECT MAX(" + pcKeyField  + ") AS maxid " + ;
*!*				"  FROM " + pcTable 
	TEXT TO lcSQL NOSHOW TEXTMERGE
	SELECT MAX(<<pcKeyField>>) AS maxid
	  FROM <<pcTable>>
	 WHERE <<lcWhere>>
	ENDTEXT

	IF RunSQL(lcSQL, lcTable)
		lnReturn = EVALUATE(lcTable + '.maxid')
		lnReturn = IIF(lnReturn = 0 OR ISNULL(lnReturn), 0, lnReturn)
		USE IN (lcTable)
	ENDIF
ENDIF

SELECT (lnSelect)

RETURN lnReturn


*!*	*!*********************************************************
*!*	*!
*!*	*!        Function: NumWords
*!*	*!
*!*	*!*********************************************************
*!*	* Description
*!*	* Returns numbers to words
*!*	FUNCTION NumWords
*!*	PARAMETERS mamt

*!*	camt=" "
*!*	STORE "     ONE  TWO  THREEFOUR FIVE SIX  SEVENEIGHTNINE " TO ones
*!*	STORE "TEN      ELEVEN   TWELVE   THIRTEEN FOURTEEN FIFTEEN  SIXTEEN  "+;
*!*	      "SEVENTEENEIGHTEEN NINETEEN " TO teen
*!*	STORE "TWENTY THIRTY FORTY  FIFTY  SIXTY  SEVENTYEIGHTY NINETY" TO tens

*!*	* Store whole amount to a string
*!*	cnum=LEFT(STR(mamt,9,2),6)

*!*	* check hundreds of thousands
*!*	IF LEFT(cnum,1)>" "
*!*	        camt=RTRIM(SUBSTR(ones,VAL(LEFT(cnum,1))*5+1,5))+" HUNDRED "
*!*	ENDIF

*!*	* check tens of thousands and thousands
*!*	DO CASE
*!*	   CASE SUBSTR(cnum,2,1)>"1"
*!*	   		camt=camt+RTRIM(SUBSTR(tens,VAL(SUBSTR(cnum,2,1))*7-13,7))
*!*	   		IF SUBSTR(cnum,3,1)>"0"
*!*	   			camt=camt+"-"+RTRIM(SUBSTR(ones,VAL(SUBSTR(cnum,3,1))*5+1,5))
*!*	   		ENDIF
*!*	   		camt=camt+" THOUSAND "
*!*	   		
*!*	   	CASE SUBSTR(cnum,2,1)="1"
*!*	   		camt=camt+RTRIM(SUBSTR(teen,VAL(SUBSTR(cnum,3,1))*9+1,9))+" THOUSAND "
*!*	   	
*!*	   	CASE SUBSTR(cnum,2,2)="00"
*!*	   		camt=camt+"THOUSAND "
*!*	   	
*!*	   	CASE SUBSTR(cnum,3,1)>" "
*!*	   		camt=camt+RTRIM(SUBSTR(ones,VAL(SUBSTR(cnum,3,1))*5+1,5))+" THOUSAND "
*!*	ENDCASE

*!*	* check hundreds
*!*	IF SUBSTR(cnum,4,1)>"0"
*!*		camt=camt+RTRIM(SUBSTR(ones,VAL(SUBSTR(cnum,4,1))*5+1,5))+" HUNDRED "
*!*	ENDIF

*!*	* check tens and ones
*!*	DO CASE
*!*		CASE SUBSTR(cnum,5,1)>"1"
*!*			camt=camt+RTRIM(SUBSTR(tens,VAL(SUBSTR(cnum,5,1))*7-13,7))
*!*			IF RIGHT(cnum,1)>"0"
*!*				camt=camt+"-"+RTRIM(SUBSTR(ones,VAL(RIGHT(cnum,1))*5+1,5))
*!*			ENDIF
*!*		
*!*		CASE SUBSTR(cnum,5,1)="1"
*!*			camt=camt+RTRIM(SUBSTR(teen,VAL(RIGHT(cnum,1))*9+1,9))
*!*		
*!*		CASE RIGHT(cnum,2)=" 0"
*!*			camt="ZERO"
*!*		
*!*		OTHERWISE
*!*			camt=camt+RTRIM(SUBSTR(ones,VAL(RIGHT(cnum,1))*5+1,5))
*!*	ENDCASE

*!*	* convert decimal places to a string containing paise amount
*!*	paise=RIGHT(STR(mamt,9,2),2)
*!*	IF paise != '00'
*!*		camt=RTRIM(camt)+" AND "+paise+" PAISE"
*!*	ENDIF

*!*	RETURN camt

*!*********************************************************
*!
*!        Function: LocalHostName
*!
*!*********************************************************
* Description
* Returns name of the local host
FUNCTION LocalHostName

RETURN LEFT(SYS(0), AT('#',SYS(0))-1)

*!*********************************************************
*!
*!        Function: BMP2JPG
*!
*!*********************************************************
* Description
* Convert BMP to JPG
FUNCTION BMP2JPG
LPARAMETERS pcBMPFile, pcJPGFile

IF NOT FILE(pcBMPFile)
	RETURN .F.
ENDIF

IF VARTYPE(_SCREEN.System) = 'U'		&& gdi plus not loaded ?
	DO LOCFILE("System.app")
ENDIF

WITH _SCREEN.System.Drawing

LOCAL myBitmap AS xfcBitmap
LOCAL myEncoderParameter AS xfcEncoderParameter
LOCAL myEncoderParameters AS xfcEncoderParameters

&& Create a Bitmap object based on a BMP file.
myBitmap = .Bitmap.New(pcBMPFile)

&& Create an EncoderParameters object.
&& An EncoderParameters object has an array of EncoderParameter objects
&& In this case, there is only one EncoderParameter object in the array.
myEncoderParameters = .Imaging.EncoderParameters.New(1)

&& Save the bitmap as a JPEG file with quality level 25.
&& Using an Encoder object based on the GUID
&& for the Quality parameter category.
myEncoderParameter = .Imaging.EncoderParameter.New(.Imaging.Encoder.Quality, 75)
myEncoderParameters.Param.Add(myEncoderParameter)
myBitmap.Save(pcJPGFile, .Imaging.ImageFormat.Jpeg, myEncoderParameters)

ENDWITH

RETURN .T.

*!*********************************************************
*!
*!        Function: UPDATEDATABASE
*!
*!*********************************************************
* Description
* Updates the database with update program
FUNCTION UpdateDatabase

LOCAL lcUpdateFile
lcUpdateFile = 'update'

*!*	IF FILE(FORCEEXT(lcUpdateFile,'PRG'))
*!*		COMPILE (lcUpdateFile)

*!*		IF FILE(FORCEEXT(lcUpdateFile,'ERR'))
*!*			MODIFY FILE (FORCEEXT(lcUpdateFile,'ERR'))
*!*		ENDIF
*!*	ENDIF

IF FILE(FORCEEXT(lcUpdateFile,'FXP'))
	DO (lcUpdateFile)
ENDIF

RETURN

*!*********************************************************
*!
*!        Function: NUMWORDS
*!
*!*********************************************************
* Description
* Converts numeric amount to words
FUNCTION NumWords
PARAMETERS mamt

camt=" "
STORE "     ONE  TWO  THREEFOUR FIVE SIX  SEVENEIGHTNINE " TO ones
STORE "TEN      ELEVEN   TWELVE   THIRTEEN FOURTEEN FIFTEEN  SIXTEEN  "+;
      "SEVENTEENEIGHTEEN NINETEEN " TO teen
STORE "TWENTY THIRTY FORTY  FIFTY  SIXTY  SEVENTYEIGHTY NINETY" TO tens

* Store whole amount to a string
cnum=''
cnum=LEFT(STR(mamt,9,2),6)

* check hundreds of thousands
IF LEFT(cnum,1)>" "
        camt=RTRIM(SUBSTR(ones,VAL(LEFT(cnum,1))*5+1,5))+" HUNDRED "
ENDIF

* check tens of thousands and thousands
DO CASE
   CASE SUBSTR(cnum,2,1)>"1"
   		camt=camt+RTRIM(SUBSTR(tens,VAL(SUBSTR(cnum,2,1))*7-13,7))
   		IF SUBSTR(cnum,3,1)>"0"
   			camt=camt+"-"+RTRIM(SUBSTR(ones,VAL(SUBSTR(cnum,3,1))*5+1,5))
   		ENDIF
   		camt=camt+" THOUSAND "
   		
   	CASE SUBSTR(cnum,2,1)="1"
   		camt=camt+RTRIM(SUBSTR(teen,VAL(SUBSTR(cnum,3,1))*9+1,9))+" THOUSAND "
   	
   	CASE SUBSTR(cnum,2,2)="00"
   		camt=camt+"THOUSAND "
   	
   	CASE SUBSTR(cnum,3,1)>" "
   		camt=camt+RTRIM(SUBSTR(ones,VAL(SUBSTR(cnum,3,1))*5+1,5))+" THOUSAND "
ENDCASE

* check hundreds
IF SUBSTR(cnum,4,1)>"0"
	camt=camt+RTRIM(SUBSTR(ones,VAL(SUBSTR(cnum,4,1))*5+1,5))+" HUNDRED "
ENDIF

* check tens and ones
DO CASE
	CASE SUBSTR(cnum,5,1)>"1"
		camt=camt+RTRIM(SUBSTR(tens,VAL(SUBSTR(cnum,5,1))*7-13,7))
		IF RIGHT(cnum,1)>"0"
			camt=camt+"-"+RTRIM(SUBSTR(ones,VAL(RIGHT(cnum,1))*5+1,5))
		ENDIF
	
	CASE SUBSTR(cnum,5,1)="1"
		camt=camt+RTRIM(SUBSTR(teen,VAL(RIGHT(cnum,1))*9+1,9))
	
	CASE RIGHT(cnum,2)=" 0"
		camt="ZERO"
	
	OTHERWISE
		camt=camt+RTRIM(SUBSTR(ones,VAL(RIGHT(cnum,1))*5+1,5))
ENDCASE

* convert decimal places to a string containing paise amount
paise = ''
paise=RIGHT(STR(mamt,9,2),2)
IF paise != '00'
	camt=RTRIM(camt)+" AND "+paise+" PAISE"
ENDIF

RETURN "      "+camt

*!*********************************************************
*!
*!        Function: EnableDesktop
*!
*!*********************************************************
* Description
* Enables desktop
FUNCTION EnableDesktop

* enable start window
FOR i = 1 TO _SCREEN.FormCount
	IF UPPER(_SCREEN.Forms(i).Name) = 'FRMSTART'
		_SCREEN.Forms(i).Enabled = .T.
		EXIT
	ENDIF
ENDFOR

* enable main menu
SET SKIP OF MENU _MSYSMENU .F.

RETURN


*!*********************************************************
*!
*!        Function: DisableDesktop
*!
*!*********************************************************
* Description
* Disable desktop
FUNCTION DisableDesktop

SET SKIP OF MENU _MSYSMENU .T.
_SCREEN.ActiveForm.Enabled = .F.

RETURN

*!*********************************************************
*!
*!        Function: SQLFormTT
*!
*!*********************************************************
* Description
* Returns formatted datetime string which can be used for SQL Server
FUNCTION SQLFormTT
PARAMETERS ltDateTime
LOCAL lcReturn

lcReturn = TRANSFORM(TTOC(ltDateTime,1),"@R 9999-99-99 99:99:99")

RETURN lcReturn


*!*********************************************************
*!
*!        Function: FormatSMS
*!
*!*********************************************************
* Description
* Removes extra spaces in SMS Text
FUNCTION FormatSMS
PARAMETERS pcSMS

llSpace = .F.
lnLen = LEN(pcSMS)
lcOut = ''
FOR i=1 TO lnLen
	
	IF SUBSTR(pcSMS,i,1) = ' '
		IF NOT llSpace
			lcOut = lcOut + SUBSTR(pcSMS,i,1)
			llSpace = .T.
		ENDIF 
	ELSE
		IF INLIST(SUBSTR(pcSMS,i,1),',',';')
			lcOut = ALLTRIM(lcOut)
		ENDIF
		lcOut = lcOut + SUBSTR(pcSMS,i,1)
		llSpace = .F.
	ENDIF

ENDFOR

* replace any single quotes with double quotes
lcOut = STRTRAN(lcOut,['],["])

RETURN lcOut

*!*********************************************************
*!
*!        Function: SendSMS
*!
*!*********************************************************
* Description
* Removes extra spaces in between the SMS Text
FUNCTION SendSMS
PARAMETERS pcMobileNum, pcSMSText
LOCAL lcSQL, llReturn, lnMsgID, lnSMSCount, lcSMSText, lnCount

llReturn = .T.
lcSMSText = STRTRAN(pcSMSText, "'",'')

* calculate number of sms in the text
lnSMSCount = CEILING(LEN(lcSMSText)/160)

* split the sms text if the message length is more than 160
FOR lnCount = 1 TO lnSMSCount

	IF lnCount = 1
		lcSplit = SUBSTR(lcSMSText,lnCount,160)
	ELSE 
		lcSplit = SUBSTR(lcSMSText,(lnCount-1)*160,160)
	ENDIF 

*!*		TEXT TO lcSQL TEXTMERGE NOSHOW
*!*		SELECT MAX(msgid) AS msgid
*!*		  FROM msgoutbox
*!*		ENDTEXT

*!*		RUNSQL(lcSQL,'temp')

*!*		lnMsgID = IIF(ISNULL(temp.msgid), 1, temp.msgid+1)
*!*		USE	
	lnMsgID = GetMaxID('msgoutbox', 'msgid')
	lnMsgID = lnMsgID + 1
			
	TEXT TO lcSQL TEXTMERGE NOSHOW
		INSERT INTO msgoutbox (msgid, msgdate, recipient, message, status) 
		VALUES (<<lnMsgID>>, '<<SQLFormTT(DATETIME())>>', '<<ALLTRIM(pcMobileNum)>>', '<<lcSplit>>', 'WAITING')
	ENDTEXT

	llReturn = RUNSQL(lcSQL)

ENDFOR

RETURN llReturn

*!*********************************************************
*!
*!        Function: DateinWords
*!
*!*********************************************************
* Returns given date words
FUNCTION DateInWords(xDate)

xTmp = 0

*-- split date
xTmp = LEFT(DTOC(xDate),1)

g_dateinwords = NumWords(INT(VAL(xTmp)))

xTmp = SUBSTR(DTOC(xDate),2,1)
g_dateinwords = g_dateinwords + ' ' + NumWords(INT(VAL(xTmp)))

xTmp = SUBSTR(DTOC(xDate),4,1)
g_dateinwords = g_dateinwords + ' ' + NumWords(INT(VAL(xTmp)))

xTmp = SUBSTR(DTOC(xDate),5,1)
g_dateinwords = g_dateinwords + ' ' + NumWords(INT(VAL(xTmp)))

xTmp = SUBSTR(DTOC(xDate),7,1)
g_dateinwords = g_dateinwords + ' ' + NumWords(INT(VAL(xTmp)))

xTmp = SUBSTR(DTOC(xDate),8,1)
g_dateinwords = g_dateinwords + ' ' + NumWords(INT(VAL(xTmp)))

xTmp = SUBSTR(DTOC(xDate),9,1)
g_dateinwords = g_dateinwords + ' ' + NumWords(INT(VAL(xTmp)))

xTmp = SUBSTR(DTOC(xDate),10,1)
g_dateinwords = g_dateinwords + ' ' + NumWords(INT(VAL(xTmp)))

g_dateinwords = STRTRAN(g_dateinwords,'   ',' ')
g_dateinwords = STRTRAN(g_dateinwords,'  ',' ')

RETURN g_dateinwords

*!*********************************************************
*!
*!        Function: GetFileSize
*!
*!*********************************************************
* Returns file size in bytes
FUNCTION GetFileSize
PARAMETERS pcFileName

LOCAL lcFile, lnSize
DIMENSION laFile[1]

lcFile = pcFileName
lnSize = 0

IF NOT (EMPTY(lcFile) OR ISNULL(lcFile))
	=ADIR(laFile,lcFile)
	IF ALEN(laFile,1) > 0
		lnSize = laFile(1,2)
	ENDIF 
ENDIF

RETURN lnSize

*!*********************************************************
*!
*!        Function: FormatFileSize
*!
*!*********************************************************
* Returns size of KB/MB/GB of given bytes
FUNCTION FormatFileSize
PARAMETERS pnSize
LOCAL lcReturn
lcReturn = ''

IF (pnSize < 1024)
	lcReturn = TRANSFORM(pnSize,'999,999') + ' bytes'
ELSE 
	IF ((pnSize > 1024) and (pnSize < 1048576))
		lcReturn = STR(pnSize/1025,15,3) + ' KB'
	ELSE 
		IF (pnSize > 1048576)
			lcReturn = STR(pnSize/1048576,15,3) + ' MB '
		ENDIF
	ENDIF

	lcReturn = lcReturn + ' (' + ALLTRIM(TRANSFORM(pnSize,'999,999,999')) + ' bytes)'
ENDIF

RETURN lcReturn

*!*********************************************************
*!
*!        Function: FormatField
*!
*!*********************************************************
* Strip out certain characters from given fieldname
FUNCTION FormatField
PARAMETERS pcFieldName
LOCAL lcName

*!*	lcField = ALLTRIM(CHRTRAN(pcFieldName,'.- ',''))
lcName = ALLTRIM(UPPER(pcFieldName))

IF NOT EMPTY(lcName)
	FOR i = 1 TO LEN(lcName)
		* replace all special characters in shortname with an underscore ('_')
		IF NOT BETWEEN(ASC(SUBSTR(lcName,i,1)),65,95) AND ;
		   NOT BETWEEN(ASC(SUBSTR(lcName,i,1)),48,57)
			lcName = STRTRAN(lcName, SUBSTR(lcName,i,1), '_')
		ENDIF
	ENDFOR
ENDIF

RETURN lcName

*!*********************************************************
*!
*!        Function: ActivateToolBar
*!
*!*********************************************************
* Enable/Disable toolbar
FUNCTION ActivateToolBar
PARAMETERS plEnable

IF PCOUNT() = 0
	plEnabled = .T.
ENDIF

* enable the toolbar
IF VARTYPE(iTools) = 'O'
	iTools.Enabled = plEnable
ENDIF

RETURN


*!*********************************************************
*!
*!        Function: WriteEventLog
*!
*!*********************************************************
* Add record to eventlog table
FUNCTION WriteEventLog
LPARAMETERS pcModule, pcLogAction, pcLogDescr, pnRegisterID

LOCAL llReturn, lnSelect, lcSQL

lnSelect = SELECT()

TEXT TO lcSQL TEXTMERGE NOSHOW
INSERT INTO eventlog (logdate, userid, logaction, logdescr, module, registerid)
	 VALUES ('<<SQLFormTT(DATETIME())>>', <<xUserID>>, '<<pcLogAction>>', '<<pcLogDescr>>', 
	 		 '<<pcModule>>',<<pnRegisterID>>)
ENDTEXT

llReturn = RunSQL(lcSQL)

SELECT (lnSelect)

RETURN llReturn

*!*********************************************************
*!
*!        Function: ImageResize
*!
*!*********************************************************
* Resize image to given dimensions and saves it to JPEG output
FUNCTION ImageResize
LPARAMETERS pcOrigFile, pnWidth, pnHeight, pcResizedFile
** GDI+ gives you considerable control over the way your image is resampled, 
** so it makes sense to take advantage of this flexibility.
** This way, we can obtain the most satisfactory image quality 

WITH _SCREEN.System.Drawing 

* Variables to store the new Image size
LOCAL lnWidth, lnHeight
lnWidth = pnWidth
lnHeight = pnHeight

pcResizedFile = FORCEEXT(pcOrigFile, 'JPG')

* Load the original Image
LOCAL loSrcImage as xfcBitmap
loSrcImage = .Bitmap.New(pcImageFile) 

* Create a New Image with the desired size
LOCAL loResized as xfcBitmap
loResized = .Bitmap.New(lnWidth, lnHeight, ;
   .Imaging.PixelFormat.Format32bppARGB)


* Set the image resolution to be the same as the original
loResized.SetResolution(loSrcImage.HorizontalResolution, ;
   loSrcImage.VerticalResolution) 

* Obtain a Graphics object to get the rights to draw on it
LOCAL loGfx as xfcGraphics
loGfx = .Graphics.FromImage(loResized) 

* Set some properties, to ensure to have a better quality of image
loGfx.SmoothingMode = .Drawing2D.SmoothingMode.HighQuality
loGfx.InterpolationMode = .Drawing2D.InterpolationMode.HighQualityBicubic 

* Draw the source image on the new image at the desired dimensions
loGfx.DrawImage(loSrcImage, 0, 0, lnWIdth, lnHeight) 

* Save the resized image as Png
loResized.Save(pcResizedFile, .Imaging.ImageFormat.Jpeg)

ENDWITH 
RETURN 


*!*********************************************************
*!
*!        Function: GetSMSTemplate()
*!
*!*********************************************************
* Show SMS template selection window and return selected template
FUNCTION GetSMSTemplate
LPARAMETERS pcContext, plDefault
LOCAL lcReturn, objTemplate, lcSQL
lcReturn = ''

IF PCOUNT() = 2
	IF plDefault
		TEXT TO lcSQL TEXTMERGE NOSHOW
		SELECT TOP 1 *
		  FROM templates
		 WHERE context = '<<pcContext>>'
		   AND active = 1
		 ORDER BY lastmod DESC
		ENDTEXT 
		
		RunSQL(lcSQL,'template')
		IF USED('template')
			IF RECCOUNT('template') > 0
				lcReturn = ALLTRIM(template.message)
			ENDIF
			USE IN SELECT('template')
		ENDIF
	ENDIF
ELSE
	objTemplate = NEWOBJECT('templates','messaging')
	objTemplate.cContext = pcContext
	objTemplate.Show(1)

	IF VARTYPE(objTemplate) = 'O'
		lcReturn = ALLTRIM(objTemplate.cRetVal)
		RELEASE objTemplate
	ENDIF
ENDIF

RETURN lcReturn


*!*********************************************************
*!
*!        Function: GetSQLColumns()
*!
*!*********************************************************
* return field names retrieved from backend table
PROCEDURE GetSQLColumns
PARAMETERS pcTable, pcWhere

LOCAL llReturn
llReturn = .t.

IF VARTYPE(pcWhere) # 'C'
	pcWhere = ''
ENDIF

TEXT TO lcSQL TEXTMERGE NOSHOW
SELECT UPPER(LEFT(syscolumns.name, 32)) AS name  
  FROM syscolumns   
  JOIN systypes     
    ON syscolumns.xtype = systypes.xtype    
   AND syscolumns.xUserType = systypes.xUserType   
  JOIN sysobjects     
    ON syscolumns.id = sysobjects.id  
 WHERE sysobjects.name = <<pcTable>> <<pcWhere>>
ENDTEXT

llReturn = RunSQL(lcSQL,'sqlcols')

RETURN


*!*********************************************************
*!
*!        Function: FieldLen()
*!
*!*********************************************************
* returns length of the field
PROCEDURE FieldLen
PARAMETERS pcField, pcTable

LOCAL lnFieldPos, lnFieldLen, lcCompatible
lnFieldLen = 0

IF VARTYPE(pcTable) = 'L'
	pcTable = ALIAS()
ENDIF

*!*	=AFIELDS(laFields, pcTable)

*!*	* get field position in array
*!*	lnFieldPos = ASCAN(laFields, pcField, 1, ALEN(laFields,1), 1, 8)

*!*	* get length of the field in 3rd column
*!*	lnFieldLen = laFields[lnFieldPos,3]

lcCompatible = SET("Compatible")
SET COMPATIBLE OFF
lnFieldLen = FSIZE(pcField, pcTable)
SET COMPATIBLE &lcCompatible

RETURN lnFieldLen

*!*********************************************************
*!
*!        Function: PickList
*!
*!*********************************************************
* displays a pick list
PROCEDURE PickList
PARAMETERS pcSelect, pcReturnField

LOCAL loPick, lcReturn, lnSelect
lnSelect = SELECT()

loPick = CREATEOBJECT('picklist', pcSelect, pcReturnField)
loPick.AutoCenter = .T.
loPick.Show()
lcReturn = loPick.cReturnValue

RELEASE loPick

SELECT (lnSelect)
RETURN lcReturn


*!*********************************************************
*!
*!        Function: GetSysReport
*!
*!*********************************************************
* Return an available report name for given type
* or can select a report if same multiple reports exists
FUNCTION GetSysReport
	PARAMETERS pcType

	LOCAL lnSelect, lcSQL, lcTempCursor, lcReportFile
	lnSelect = SELECT()
	lcReportFile = ''
	lcTempCursor = GetUniqueFileName()

	TEXT TO lcSQL NOSHOW TEXTMERGE
	SELECT *
	  FROM sysreports
	 WHERE registerid = <<xRegisterID>>
	   AND reporttype = '<<pcType>>'
	   AND reportfile > ''
	ENDTEXT

	RunSQL(lcSQL, lcTempCursor)
	IF USED(lcTempCursor) AND RECCOUNT(lcTempCursor) > 0
		SELECT (lcTempCursor)
		IF RECCOUNT(lcTempCursor) = 1
			lcReportFile = ALLTRIM(reportfile)
		ELSE
			loReportSelect = CREATEOBJECT('reportselect', lcTempCursor)
			loReportSelect.AutoCenter = .T.
			loReportSelect.Show()
			lcReportFile = loReportSelect.cReturnValue
		ENDIF
	ENDIF
	USE IN SELECT(lcTempCursor)

	SELECT (lnSelect)
	RETURN lcReportFile
ENDFUNC


*!*********************************************************
*!
*!        Function: GetMyDocsPath
*!
*!*********************************************************
* Returns My Documents path
FUNCTION GetMyDocsPath
	#DEFINE CSIDL_PERSONAL 0x0005
	LOCAL lcFolderPath, lcDocumentsPath
	m.lcFolderPath = SPACE(255)

	DECLARE SHORT SHGetFolderPath IN SHFolder.dll ; 
	    INTEGER hwndOwner, INTEGER nFolder, INTEGER hToken, ; 
	    INTEGER dwFlags, STRING @pszPath 

	SHGetFolderPath(0, CSIDL_PERSONAL, 0, 0, @m.lcFolderPath)

	m.lcDocumentsPath = Alltrim(m.lcFolderPath)

	m.lcDocumentsPath = SubStr(m.lcDocumentsPath,1, Len(m.lcDocumentsPath) - 1)
	RETURN ADDBS(m.lcDocumentsPath)
ENDFUNC


*!*********************************************************
*!
*!        Function: OpenExcelFile
*!
*!*********************************************************
* Launch excel and open the given file
FUNCTION OpenExcelFile
	PARAMETERS pcExcelFile
	
	IF FILE(pcExcelFile)
		TRY
			m.loExcelApp = CREATEOBJECT("EXCEL.APPLICATION")
			m.loWorkBook = m.loExcelApp.Workbooks.Open(pcExcelFile)
			m.loExcelApp.Visible = .T.
		CATCH
			MESSAGEBOX("The system encountered a problem opening the Excel document.",64,"Problem Encountered")
		ENDTRY
	ENDIF

	RETURN
ENDFUNC
