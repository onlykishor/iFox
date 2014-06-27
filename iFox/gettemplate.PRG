lcReturn = ''

obj = newobject('templates','messaging')
obj.ccontext = 'test'
obj.Show(1)

IF VARTYPE(obj) = 'O'
	lcReturn = obj.cRetVal
	RELEASE obj
ENDIF

RETURN lcReturn
