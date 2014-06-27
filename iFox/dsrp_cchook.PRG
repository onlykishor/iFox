LPARAMETERS nType
*nType = 1 - Conduct Certificate
*nType = 2 - Study Certificate

LOCAL lcText, lcStudy
lcStudy = ''

IF sc_admregister.studyyear < 3
	lcStudy = TRANSFORM(YEAR(DATE())) + '-' + TRANSFORM(YEAR(DATE())+1)
ELSE
	lcStudy = TRANSFORM(YEAR(sc_admregister.doa)) +'-'+ TRANSFORM(YEAR(sc_admregister.doa)+3)
ENDIF

DO CASE
CASE nType = 1		&& conduct certificate
*!*				This to certify that <<ALLTRIM(sc_admregister.name)>> S/o <<ALLTRIM(sc_admregister.father)>> is/was a student of our college during years <<lcStudy>> in the course <<ALLTRIM(sc_admregister.class)>>.
	TEXT TO lcText NOSHOW TEXTMERGE
			This to certify that <<sc_admregister.name>> S/o <<ALLTRIM(sc_admregister.father)>> is/was a student of our college during years <<lcStudy>> in the course <<ALLTRIM(sc_admregister.class)>>.

	<<IIF(sc_admregister.sex = 'F','Her','His')>> conduct during the period is/was ____________________
	ENDTEXT
CASE nType = 2		&& study certificate
	TEXT TO lcText NOSHOW TEXTMERGE &&PRETEXT 5
			This to certify that <<ALLTRIM(sc_admregister.name)>> S/o <<ALLTRIM(sc_admregister.father)>> has studied Three Year Diploma course in <<ALLTRIM(sc_admregister.class)>> Engineering in this institution during the academic years <<lcStudy>>.
	ENDTEXT
ENDCASE

RETURN lcText
