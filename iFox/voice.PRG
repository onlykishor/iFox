SET DATE BRITISH
LOCAL oHttp, sUser, sPass
sUser = "s_sweety"
sPass = "1234"

lcFromMobile = '9849344644'
lcToMobile   = '8985797628'

lcApi_key    = "xAIiMyiDVfO8sX0u8SZ8"
lcAccess_key = "DjrRU4hUZJLmQdLLwhnB8zDDwxZ6EpdYD9lt77rQ"

lcPost       = "api_key=" + lcApi_key + "&access_key=" + lcAccess_key
*!*	lcPost       = lcPost + "&xml=" + lcFromMobile +""+ lcToMobile + "" + lcVoiceClip +""

lcVoiceClip  = "http://www.smscountry.com/voice_clips/indian.wav"
lcPost       = lcPost + "&xml=" + lcToMobile + "" + lcVoiceClip +""

lcUrl        = "https://voiceapi.smscountry.com/api"

*!*	oHTTP = CREATEOBJECT('WinHttp.WinHttpRequest.5.1')
oHTTP = CREATEOBJECT('Microsoft.XMLHTTP')
IF VARTYPE(oHTTP) = 'O'
	oHTTP.Open("POST", lcUrl)
	oHTTP.Send(lcPost)
	oHTTP.Status
	oHTTP.StatusText
	oHTTP.GetAllResponseHeaders()
	STRTOFILE(oHTTP.ResponseText, "response.txt") 
	MODI FILE response.txt NOWAIT
	oHTTP = NULL
ELSE
	=MESSAGEBOX('Unable to connect to internet.',16,'Message')
ENDIF
