************************************************
* Purpose - demonstrates the function CODE128b.
* CALLS - CODE128b
* There are three barcode formats A, B and C. Function CODE128b returns format "B" only.
* Barcode 128 requires a start code, string (barcode value), checksum value and stop code.
* Acceptable string values are between ascii 32 - 126
* Function CODE128b will strip out any other values.
* Your program will require a Barcode 128 truetype font
*
LOCAL lcTeststring
DIMENSION a_code( 2 )

*************************************
* test values, good, illegal chars and empty
* rem unrem as needed
lcteststring = '123456789'
* lcTestString = 'This is a ' + CHR(133) + CHR(155) + 'tes' + CHR( 116 ) + CHR(32) + 'string.'
* lcteststring = ''

a_code( 1 ) = lcteststring
code128b( @a_code )
_cliptext = a_code

***************************************
* do case to demonstrate result
DO case
CASE a_code( 2 ) > 0
	lcmessage = ALLTRIM( STR( a_code( 2 ) ) ) + ' characters were removed.' + CHR(13) + ;
		'String conversion - ' + a_code( 1 )
CASE a_code( 2 ) = -1
	lcmessage = 'Empty value passed'
OTHERWISE
	lcmessage = 'String conversion - ' + a_code( 1 )
ENDCASE

MESSAGEBOX( lcmessage, 48 )

*********************************
* call your report or label

RETURN

PROCEDURE code128b
*****************************************************
* Purpose  - convert a string to barcode 128 b
* REQUIRES - one dimenson array with two elements. Passed by reference
* PARAMETERS - a_result
* a_result( 1 ) - string, value to convert.
* a_result( 2 ) - init as logical, stores numeric.
* lnError - number of characters outside of ascii 32-126
* lnChksum - barcode128 checksum value
* lnX - pointer, character position for checksum calculation.
* lcString - a_resul( 1 ), initial string value
* lcCode - resulting barcode string
* RETURNS array a_result
* a_result( 1 ) - convertd string
* a_result( 2 ) - error status, -1 = empty, 0 = no error, 0 > number of characters removed

LPARAMETERS a_Result
LOCAL lnError, lnChksum, lnX, lcString, lcCode
STORE 0 TO lnChksum, lnError, lnX
STORE '' TO lcCode, lcString

lcString = IIF( VARTYPE( a_Result( 1 ) ) <> 'C', '', ALLTRIM( a_Result( 1 ) ) )
a_Result( 2 ) = IIF( EMPTY( lcString), -1, 0 )

FOR i = 1 TO LEN( lcString )

	IF !BETWEEN( ASC( SUBSTR( lcString, i, 1 )  ), 32, 126 )	&& illegal char
		lnError = lnError + 1	&& increment error counter
		LOOP
	ENDIF
	lnx = lnx + 1 	&& increment char pointer
	*************************************
	* calculate checksum, ( ASCII value - 32 ) times the char position
	* minus 32 is the offset between the ASCII value and the char value from TABLE B of BARCODE 128
	lnChksum = lnChksum + ( ( ASC( SUBSTR( lcString, i, 1 ) ) - 32 )* lnX )
	*************************************
	* build the correct string without illegal chars
	lcCode = lcCode + SUBSTR( lcString, i, 1 )
	
ENDFOR

****************************
* set error result if errors
a_Result( 2 ) = IIF( a_Result( 2 ) = -1, -1, lnError )

****************************
* Checksum is the Modulus from
* wieghted chars values ( barcode128b value * char position )
* Plus startcode value ( 104 )
* devided by 103
lnChksum = lnChksum + 104
lnChksum = MOD( lnChksum, 103 )

*****************************
* final string is startcode + string + cheksum + stopcode
a_Result( 1 ) = CHR( 204 ) + lcCode + CHR( lnChksum + 32 ) + CHR( 206 )

RETURN