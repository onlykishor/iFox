*!*	cTabla = GETFILE("dbf") 
*!*	oExcel = Createobject("Excel.Application") 
*!*	oExcel.WorkBooks.Add

*!*	*!*	sele &cTabla
*!*	Set Talk Off 
*!*	nNumRegExp = Reccount() && Total records

*!*	For i = 1 To nNumRegExp 
*!*	        WAIT WINDOW "Exporting data: "+STR(i) nowait 
*!*	        IF i =1 && fields' titles
*!*	           FOR J = 1 To Fcount() 
*!*	               oExcel.ActiveSheet.cells(i,J).Value= Field(J) 
*!*	           NEXT 
*!*	        ENDIF 
*!*	   For J = 1 To Fcount()   && Content
*!*	       oExcel.ActiveSheet.cells(i+1,J).Value = IIF(TYPE(Field(J))=="G",CHR(34)+FIELD(J)+CHR(34),IIF( EMPTY(Eval(Field(J))) ,"", EVALUATE(FIELD(J)) ) ) 
*!*	   Next 
*!*	   Skip 
*!*	Next 
*!*	lnombre = "Result.xls"
*!*	ERASE (lnombre) 
*!*	oExcel.ActiveWorkBook.SaveAs(lnombre) 
*!*	oExcel.ActiveWorkBook.Close 
*!*	oExcel.Quit


#Define xlTop -4160
Local oExcel
oExcel = Createobject("Excel.Application")
With oExcel
  .WorkBooks.Add
  .Visible = .T.
  VFP2Excel(_samples+'data\testdata.dbc',;
    'select emp_id,first_name,last_name,'+;
    'cast(EVL(birth_date,null) as d) as birth_date,'+;
    'CAST(CHRTRAN(notes,CHR(13),"") as M) as Notes from employee',;
    .ActiveWorkBook.ActiveSheet.Range('A1'))
    
  * This part is cosmetic  
  With .ActiveWorkBook.ActiveSheet
    .UsedRange.VerticalAlignment = xlTop && set all to top
    With .Columns(5)
      .ColumnWidth = 80 && 80 chars width
      .WrapText = .T.
    Endwith
    .UsedRange.Columns.AutoFit
    .UsedRange.Rows.AutoFit
  Endwith
Endwith

Function VFP2Excel
  Lparameters tcDataSource, tcSQL, toRange
  Local loConn As AdoDB.Connection, ;
    loRS As AdoDB.Recordset,;
    ix
  loConn = Createobject("Adodb.connection")
  loConn.ConnectionString = "Provider=VFPOLEDB;Data Source="+m.tcDataSource
  loConn.Open()
  loRS = loConn.Execute(m.tcSQL)

  For ix=1 To loRS.Fields.Count
    toRange.Offset(0,m.ix-1).Value = Proper(loRS.Fields(m.ix-1).Name)
    toRange.Offset(0,m.ix-1).Font.Bold = .T.
  Endfor
  toRange.Offset(1,0).CopyFromRecordSet( loRS )
  loRS.Close
  loConn.Close
Endfunc