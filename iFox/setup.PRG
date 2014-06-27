CD c:\ifox
SET PROCEDURE TO eschool
_screen.AddProperty('nConnID')
_SCREEN.nConnID = SQLCONNECT('RemoteData', 'sa', '')
?SQLEXEC(_SCREEN.nConnID, 'USE ifox')
