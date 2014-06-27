LOCAL loHTTP, lcUserName, lcPass, lcMobile, lcMessageText
LOCAL lcServiceURL

loHTTP = CREATEOBJECT('WinHttp.WinHttpRequest.5.1')

IF VARTYPE(loHTTP) = 'O'
	lcUserName = 'your-username'
	lcPass = 'your-password'
	lcMessageText = 'test message from iFox sms gateway'
	lcMessageText = EncodeMessage(lcMessageText)
	
	* make sure the mobile number is not in NDNC registry
	* check here: http://164.100.9.238/ndncregistry/search.misc

	lcMobile = '91XXXXXXXXXX'		&& prefix 91 to mobile number

	lcServiceURL = "http://sms.ifox.in/WebserviceSMS.aspx?" + ;
				   "user=" + lcUserName + ;
				   "&passwd=" + lcPass + ;
				   "&mobilenumber=" + lcMobile + ;
				   "&message=" + lcMessageText + ;
				   "&sid=Demo"			&& if there are multiple SIDs

	loHTTP.Open("GET", lcServiceURL)
	loHTTP.Send()
ENDIF


FUNCTION EncodeMessage
	LPARAMETERS pcMessage

	* Due to restrictions in the HTTP protocol, the following special characters must be
	* encoded, as shown below, to avoid collision with reserved HTTP characters-
	*
	* S.Num.    Character    Hexa-Decimal Encoded String
	*   1           %            %25
	*   2           &            %26
	*   3           +            %2B
	*   4           #            %23
	*   5           =            %3D
	*   6           ^            %5E
	*   7           ~            %7E
	*

	pcMessage = STRTRAN(pcMessage, '%', '%25')
	pcMessage = STRTRAN(pcMessage, '&', '%26')
	pcMessage = STRTRAN(pcMessage, '+', '%2B')
	pcMessage = STRTRAN(pcMessage, '#', '%23')
	pcMessage = STRTRAN(pcMessage, '=', '%3D')
	pcMessage = STRTRAN(pcMessage, '^', '%5E')
	pcMessage = STRTRAN(pcMessage, '~', '%7E')

RETURN pcMessage
