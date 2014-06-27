

LOCAL lcAlias     AS STRING   ,;
      lcMessage   AS STRING   ,;
      lcSetSafety AS STRING   ,;
      llReturn    AS BOOLEAN  ,;
      lcURL       AS STRING   ,;
      lcFile      AS String   ,;
      loXmlHttp   AS Microsoft.XMLHTTP

lcAlias = ALIAS()
lcSetSafety = SET( "safety" )

TRY
  loXmlHttp = NEWOBJECT( "Microsoft.XMLHTTP" )

  lcURL = "http://finance.yahoo.com/d/quotes.csv"
  loXmlHttp.open( "POST" , lcURL, .F. )
  loXmlHttp.send( "s=MSFT,^DJI&f=sl1d1t1c1ohgv&e=.csv" )

  IF loXmlHttp.STATUS != 200
    lcMessage = TEXTMERGE( ;
      "An error occurred - status = <<loXmlHttp.STATUS>><<loXmlHttp.statustext>>" )

    MESSAGEBOX( lcMessage, 16, PROGRAM() )
    EXIT
  ENDIF

  lcFile = SYS( 2015 )
  STRTOFILE( loXmlHttp.responsetext, lcFile )

  IF !USED( "stockquotes" )
   CREATE CURSOR stockquotes ( ;
    Symbol c( 8 ), ;
    LAST Y, ;
    DATE D, ;
    TIME c( 8 ), ;
    CHANGE Y, ;
    OPEN Y, ;
    HIGH Y, ;
    Low Y, ;
    VOLUME B( 0 ))
  ENDIF

  SELECT stockquotes
  APPEND FROM ( lcFile ) DELIMITED
  SET SAFETY OFF
  ERASE ( lcFile )
  BROWSE
  llReturn = .T.

CATCH TO oException
            
  TEXT TO lcMessage TEXTMERGE NOSHOW PRETEXT 3
    Error # <<oException.ErrorNo>> occured on line: <<oException.LINENO>> of <<oException.PROCEDURE>>.

    Offending line of code:
    <<oException.LineContents>>

    Error Message:
    <<oException.Details>>
  ENDTEXT
  MESSAGEBOX( lcMessage, 16, PROGRAM())

FINALLY
  SET SAFETY &lcSetSafety
  SELECT ( SELECT( lcAlias ))
ENDTRY

RETURN m.llReturn

PUBLIC xadmno 
xadmno = 0
USE data\eschool!studentfee
BROWSE NORMAL 
RETURN


SCAN
	WAIT TRANSFORM((RECNO()*RECCOUNT())/100) WINDOW NOWAIT
	
	lnTotal = 0
	lcField = ''
	FOR i = 1 TO 9		&& 9 hours total
		lcField = 'hr' + TRANSFORM(i)
		IF EVALUATE(lcField) = .F.
			lnTotal = lnTotal + 1
		ENDIF
	ENDFOR

	IF ptotal # lnTotal AND lnTotal > 0
		REPLACE ptotal WITH lnTotal, ;
				userid WITH xUserID
		=TABLEUPDATE(.T.)
	ENDIF
ENDSCAN

RETURN



lcdb = 'ifox.'
lctable = 'register'
lcSQL = ;
	"select " + lcDB + "syscolumns.colid as No" + ;
	"     , Upper(Left(" + lcDB + "syscolumns.name, 32)) AS Name" + ;
	"  from " + lcDB + "syscolumns " + ;
	"  join " + lcDB + "systypes " + ;
	"    on " + lcDB + "syscolumns.xtype = " + lcDB + "systypes.xtype " + ;
	"   and " + lcDB + "syscolumns.xUserType = " + lcDB + "systypes.xUserType " + ;
	"  join " + lcDB + "sysobjects " + ;
	"    on " + lcDB + "syscolumns.id = " + lcDB + "sysobjects.id " + ;
	" where " + lcDB + "sysobjects.name = '" + AllTrim(lcTable)+"' "
_cliptext = lcsql
return

DEFINE Class Customer as custom
    Function VerifyData(MyData )
        If MyData = "Howdy!" 
            Return True
        Else
            Return False
        EndIf
    EndFunc
ENDDEFINE 


*!*	SELECT a.receipt, a.date, a.admno, b.name, b.class, TRANSFORM(a.netamount,'999,999.99') AS netamount, ;
*!*	       a.descri, NVL(u.name,'') AS username ;
*!*	  FROM fee a ;
*!*	  JOIN register b ;
*!*	    ON a.admno=b.admno ;
*!*	   AND a.bookid=fbooks.bookid ;
*!*	   AND TTOD(a.date) = DATE() ;
*!*	   LEFT JOIN users u ;
*!*	    ON u.userid = a.userid ;
*!*	 WHERE a.bookid = fbooks.bookid ;
*!*	  INTO CURSOR feelist ;
*!*	 ORDER BY a.receipt 

*!*			SELECT 1 AS tag_, b.name, b.shortname, b.class, b.father, b.mobile, rm.name as routename, rs.name as stopname, a.* ;
*!*			  FROM duetable a ;
*!*			  JOIN register b ;
*!*			    ON a.admno = b.admno ;
*!*			  LEFT JOIN routes rs ON rs.stopid = b.stopid ;
*!*			  LEFT JOIN routemaster rm ON rm.routeid = rs.routeid ;
*!*			 WHERE a.total_due > 0 ;
*!*			   AND NOT EMPTY(b.mobile) ;
*!*			  ORDER BY B.NAME ;
*!*			  INTO CURSOR smslist READWRITE 


*!*	oWeb=CREATEOBJECT("InternetExplorer.Application")

*!*	oWeb.visible=0
*!*	*oWSH=CREATEOBJECT("Wscript.Shell")

*!*	oMSG = Createobject("CDO.Message") && use CDO instead of WSH

*!*	CURL = 'http://www.google.com'
*!*	oweb.navigate2(cUrl)

*!*	oMSG.CreateMHTMLBody('http://www.google.com',31) 

*!*	lcStr = oMSG.getstream

*!*	lcStr2=lcStr.ReadText(lcStr.Size)
*!*	lcStr.close
*!*	?lcStr2
*!*	RETURN


*!*	LOCAL loObject
*!*	loObject = CreateObject("TestClass")
*!*	? loObject.GetCurrentDate()

*!*	DEFINE CLASS TestClass AS Custom
*!*	   FUNCTION GetCurrentDate()
*!*	      RETURN "The date is: " + Transform(Date())
*!*	   ENDFUNC
*!*	ENDDEFINE
*!*	RETURN

*!*	lcMessage = 'Dear Parent, T:<<T>>/10, H:<<H>>/10, E:<<E>>/10, M:<<M>>/10, TA:<<T>>'
*!*	*!*	?STRTRAN(lcMessage, '<<T>>', '<<ALLTRIM(T)>>',1,1)

*!*	lnFields = 4
*!*	T='55 '
*!*	E='66 '
*!*	H='77 '
*!*	M='88 '

*!*	ASSERT .f.

*!*	* enclose all fields in alltrim() to eliminate spaces and save length
*!*	FOR i = 1 TO lnFields
*!*		lcField = STREXTRACT(lcMessage, '<<','>>', i)
*!*		IF NOT EMPTY(lcField)
*!*			lcMessage = STRTRAN(lcMessage, '<<'+lcField+'>>', '<<ALLTRIM(&lcField)>>',1,1,1)
*!*		ENDIF
*!*	ENDFOR
*!*	?TEXTMERGE(lcMessage)