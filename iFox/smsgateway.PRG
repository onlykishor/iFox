SET DATE BRITISH
LOCAL oHttp
LOCAL sUser
LOCAL sPass
LOCAL sFromDate && in MM/DD/YYYY format
LOCAL sToDate && in MM/DD/YYYY format
LOCAL sKeywordSMSC
LOCAL SKeywordResult
sUser = "onlykishor"
sPass = "kishor2000"
sFromDate = DTOC(DATE())
sToDate = DTOC(DATE())
sKeywordSMSC = "http://www.smscountry.com/apigetinbox.asp?user=" + sUser + "&passwd=" + sPass + "&FromDate=" + sFromDate + "&todate=" + sToDate
oHTTP = CREATEOBJECT('WinHttp.WinHttpRequest.5.1')
WITH
oHttp
.Open("GET", sKeywordSMSC)
.Send()
? .Status, .StatusText
? .GetAllResponseHeaders()
STRTOFILE(.ResponseText, "response.txt") 
MODI FILE response.txt NOWAIT
ENDWITH
