LOCAL lnDaysOld, lnYears, lnMonths
lnDaysOld = DATE() - {^1979-11-20} 
lnYears = INT( lnDaysOld / 365.25 ) 
lnMonths = INT((MOD( lnDaysOld, 365.25 )/ 365 )*12)
? TRANSFORM( lnYears ) + ' Yrs, ' + TRANSFORM( lnMonths ) + ' Mths'
