*------------ START CODE
*
*-----------------------------------
* AUTHOR:    Trevor Hancock
* CREATED:   03/04/05 01:03:07 P.M.
* ABSTRACT: Code from Microsoft Knowledge Base
*                 article 895602. Visual FoxPro code that shows how
*                 to use pictures that are
*                 stored in a BLOB field in a report.
*                 This is accomplished by using an
*                 object reference to an instance of
*                 an IMAGE class as the control source for
*                 an OLE Bound control on the report. The IMAGE
*                 object has its PictureVal property set to a BLOB
*                 field in a cursor.
*-----------------------------------
LOCAL lcDataDIR AS STRING, ;
	lcThisDir AS STRING, ;
	loRL AS REPORTLISTENER

lcDataDIR = HOME( ) + 'Samples\Tastrade\'
lcThisDir = ADDBS( JUSTPATH( SYS( 16 ) ) )

CD ( lcThisDir )
CLOSE DATA ALL
*-- Create a temp cursor with a few fields, one of which is a
*-- BLOB. Store pictures in this field as raw binary data.
SELECT CAST( ALLTRIM( First_Name ) AS VARCHAR ( 10 ) ) AS 'FNAME', ;
	CAST( ALLTRIM( Last_Name ) AS VARCHAR (10 ) ) AS 'LNAME', ;
	CAST( FILETOSTR( lcDataDIR + Photo_File ) AS BLOB ) AS 'PIC' ;
	FROM ( lcDataDIR + 'data\Employee.dbf' ) ;
	INTO CURSOR ReportTemp

*-- Close the table that you selected from. It is not needed.
USE IN SELECT( 'EMPLOYEE' )

*-- This calls a function that makes a report programmatically.
*-- This is included here just to make sure that this sample can be run
*-- as-is, without asking the developer to manually create a report.
MakeReport()

*-- Create an instance of the PreviewListener
*-- class defined later in this code.
*-- Call its custom InitBLOBImage() method,
*-- which creates an instance of an IMAGE object.
*-- This IMAGE has its PictureVal property set to the BLOB
*-- field ( 'ReportTemp.PIC' ) and its reference ( loRL.oBlobImage )
*-- is used as the control source for the OLE Bound control 
*-- on the report.
loRL = NEWOBJECT( 'PreviewListener' )
loRL.InitBLOBImage( 'ReportTemp.PIC' )

*-- Make sure that the cursor is selected,
*-- and then run the report to preview using
*-- the instance of our Report Listener.
SELECT ReportTemp
REPORT FORM BlobReport OBJECT loRL
CLOSE DATA ALL
RETURN





*--------------------------------
*-- There has to be some way of redrawing the
*-- picture in the IMAGE class as the record pointer
*-- in the report's driving cursor changes; it does not occur
*-- automatically. This could be done by a UDF() in the PrintWhen
*-- of the OLE Bound control on the report, or as is illustrated here,
*-- by a Report Listener BEFOREBAND() Event.
DEFINE CLASS PreviewListener AS REPORTLISTENER
	oBlobImage = NULL
	PicBlobFld = ''
	LISTENERTYPE = 1  && Preview Listener

	PROCEDURE InitBLOBImage(lpcBlobField AS STRING)
		THIS.PicBlobFld = lpcBlobField
		THIS.oBlobImage = NEWOBJECT( 'IMAGE' )
		THIS.oBlobImage.PICTUREVAL = THIS.PicBlobFld
	ENDPROC

	PROCEDURE BEFOREBAND( nBandObjCode, nFRXRecNo )
		*-- Before the DETAIL band is rendered, ;
		*-- just redraw the IMAGE object so that it has
		*-- the correct picture from the BLOB field.
		IF nBandObjCode = 4 && Detail band
			THIS.oBlobImage.PICTUREVAL =;
				EVALUATE( THIS.PicBlobFld )
		ENDIF
	ENDPROC
ENDDEFINE




*--------------------------------
*-- This function programmatically creates a report
*-- with an OLE Bound control and other fields. This is included
*-- only for demonstration purposes so this article code can stand-alone.
*-- Typically, you would create your own report manually by using
*-- the report designer.
FUNCTION MakeReport
	CREATE REPORT BlobReport FROM ReportTemp

	*-- Open the report file (FRX) as a table.
	USE BlobReport.FRX IN 0 ALIAS TheReport EXCLUSIVE
	SELECT TheReport

	*-- Increase the height of the Detail band
	*-- (ObjType = 9 & ObjCode = 4) to fit the
	*-- Picture/OLE Bound control that is inserted later.
	UPDATE TheReport SET Vpos = 0, Hpos = 0, HEIGHT = 23542;
		WHERE ObjType = 9 AND ObjCode = 4

	*-- Since you increased the height of the Detail Band, you need to move
	*-- the items from the footer down so they are back in the footer again.
	UPDATE TheReport SET Vpos = 29479.167 ;
		WHERE ( ObjType = 8 OR ObjType = 5 ) AND ;
		INLIST( EXPR, 'DATE()', '"Page "', '_PAGENO' )

	*-- Add a Picture/OLE Bound control to the report by inserting a
	*-- record with appropriate values. Using an object that is based on the EMPTY
	*-- class here and the GATHER NAME class later to insert the record makes it easier to
	*-- see which values line up to which fields (when compared to a large
	*-- SQL-INSERT command).
	LOCAL loNewRecObj AS EMPTY
	loNewRecObj = NEWOBJECT( 'EMPTY' )
	ADDPROPERTY( loNewRecObj, 'PLATFORM', 'WINDOWS' )
	ADDPROPERTY( loNewRecObj, 'Uniqueid', SYS(2015) )
	ADDPROPERTY( loNewRecObj, 'ObjType', 17 ) && "Picture/OLE Bound Control"
	ADDPROPERTY( loNewRecObj, 'NAME', 'loRL.oBlobImage' ) && The object ref to the IMAGE object.
	ADDPROPERTY( loNewRecObj, 'Hpos', 27500.000) && Place it in DETAIL band.
	ADDPROPERTY( loNewRecObj, 'Vpos', 3854.167)
	ADDPROPERTY( loNewRecObj, 'HEIGHT', 21354.167)
	ADDPROPERTY( loNewRecObj, 'WIDTH', 25104.167)
	ADDPROPERTY( loNewRecObj, 'DOUBLE', .T. ) && Picture is centered in the "Picture/OLE Bound Control"
	ADDPROPERTY( loNewRecObj, 'Supalways', .T. )
	*-- For the Picture/OLE Bound control, the contents of the OFFSET field specify whether
	*-- Filename (0), General field name (1), or Expression (2) is the source.
	ADDPROPERTY( loNewRecObj, 'Offset', 2 )

	*-- Add the Picture/OLE Bound control record to the report.
	APPEND BLANK IN TheReport
	GATHER NAME loNewRecObj MEMO

	*-- Clean up and then close the report table.
	PACK MEMO
	USE IN SELECT( 'TheReport' )
ENDFUNC
*
*------------ END CODE