BACKUP DATABASE [iFox] TO  
	DISK = N'd:\ifox.bak' 
	WITH NOFORMAT, NOINIT,  NAME = N'iFox-Full Database Backup', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10

RESTORE DATABASE [iFox] 
	FROM  DISK = N'd:\ifox.bak' 
	WITH  FILE = 1,  
	MOVE N'iFox_Data' TO N'd:\iFox_data.mdf',  
	MOVE N'iFox_Log' TO N'd:\iFox_log.ldf',  
	NOUNLOAD,  STATS = 10

RESTORE FILELISTONLY
FROM DISK = 'D:\iFox.bak'

RESTORE DATABASE [iFox] 
	FROM  DISK = 'd:\ifox.bak' WITH
	MOVE 'iFox' TO 'd:\iFox_data.mdf',  
	MOVE 'iFox_Log' TO 'd:\iFox_log.ldf'
