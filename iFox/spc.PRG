lcText = 'dear parent kishore kumar      , your ward   testing    a'

llSpace = .F.
lnLen = LEN(lcText)
lcOut = ''
FOR i=1 TO lnLen
	
	IF SUBSTR(lcText,i,1) = ' '
		IF NOT llSpace
			lcOut = lcOut + SUBSTR(lcText,i,1)
			llSpace = .T.
		ENDIF 
	ELSE
		lcOut = lcOut + SUBSTR(lcText,i,1)
		llSpace = .F.
	ENDIF

ENDFOR

?lcOut
