* Replace addresses with real ones before running the code

WAIT WINDOW 'Sending mail...' NOWAIT

loMail = NEWOBJECT("Cdo2000", "Cdo2000.fxp")
ldStart = DATETIME() 
 
WITH loMail
	.cServer = "smtp.gmail.com"
	.nServerPort = 465
	.lUseSSL = .T.
 
	.nAuthenticate = 1 	&& cdoBasic
	.cUserName = "onlykishor@gmail.com"
	.cPassword = "K1sh@r2012"
 
	* If From address doesn't match any of the registered identities, 
	*	Gmail will replace it with your default Gmail address
	.cFrom = "onlykishor@gmail.com"
 ASSERT .f.
	.cTo = "kishore@ifox.in"
 
	.cSubject = "Test mail"
 
	* Uncomment next lines to send HTML body
	.cHtmlBody = "<html><body><b>This is an HTML body<br>" + ;
			"It'll be displayed by most email clients</b></body></html>" 	
 
	*.cTextBody = "This is a text body." + CHR(13) + CHR(10) + ;
			"It'll be displayed if HTML body is not present or by text only email clients"
 
	* Attachments are optional
	 .cAttachment = "Ben10.jpg"
ENDWITH
IF loMail.Send() > 0
	FOR i=1 TO loMail.GetErrorCount()
		? i, loMail.Geterror(i)
	ENDFOR
	* Clear errors
	loMail.ClearErrors()
ELSE
	? "Email sent."
ENDIF
ldEnd = DATETIME() 
?
?'Total Time: '
??ldEnd - ldStart
WAIT WINDOW 'Email sent.' NOWAIT

*!*	* Replace addresses with real ones before running the code
*!*	 
*!*	loMail = NEWOBJECT("Cdo2000", "Cdo2000.fxp")
*!*	ldStart = DATETIME() 
*!*	WITH loMail
*!*		.cServer = "smtp.gmail.com"
*!*	 
*!*		* Uncomment following lines and fill your credentials 
*!*		*	if your SMTP server requires basic authentication
*!*		.nAuthenticate = 1 	&& cdoBasic
*!*		.lUseSSL = .t.
*!*		.cUserName = "onlykishor@gmail.com"
*!*		.cPassword = "K1sh@r2014"
*!*	 
*!*		.cFrom = "onlykishor@gmail.com"
*!*		.cTo = "kishore@ifox.in"
*!*	 
*!*		.cSubject = "CDO 2000 email"
*!*	 
*!*		* Uncomment next lines to send HTML body
*!*		*.cHtmlBody = "<html><body><b>This is an HTML body<br>" + ;
*!*				"It'll be displayed by most email clients</b></body></html>" 	
*!*	 
*!*		.cTextBody = "This is a text body." + CHR(13) + CHR(10) + ;
*!*				"It'll be displayed if HTML body is not present or by text only email clients"
*!*	 
*!*		* Attachments are optional
*!*		* .cAttachment = "ben10.jpg"
*!*	ENDWITH
*!*	 
*!*	ldEnd = DATETIME()

*!*	IF loMail.Send() > 0
*!*		FOR i=1 TO loMail.GetErrorCount()
*!*			? i, loMail.Geterror(i)
*!*		ENDFOR
*!*		* Clear errors
*!*		loMail.ClearErrors()
*!*	ELSE
*!*		? "Email sent."
*!*	ENDIF
*!*	?ldEnd - ldStart