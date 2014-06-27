LOCAL llFileNotFound, lnError

fp = FOPEN('ATT.txt')
IF fp > 0
	=MESSAGEBOX('File exists')
ELSE
	=MESSAGEBOX('File does not exists')
ENDIF
