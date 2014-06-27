	LPARAM lxDateTime

	LOCAL x,Y,lxWorking

	*  First check, if passed an empty value, convert
	*  to 1-Jan-1900, to be compatible with MS SQL Server
	*
	LOCAL lcRetVal
	lxWorking = IIF(EMPTY(NVL(lxDateTime,{//})),{1/1/1900},lxDateTime)
	lcRetVal = IIF(.t.,;
		"{ts '" + TRANSFORM(TTOC(lxWorking,1),"@R 9999-99-99 99:99:99") + "' }",;
		"TimeStamp('" + TTOC(lxWorking,1) + "') ")


	*	lcRetVal = "{ts '" + TRANSFORM(TTOC(lxWorking,1),"@R 9999-99-99 99:99:99") + "'}"
	RETURN lcRetVal
