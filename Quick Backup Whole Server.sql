declare @sql varchar(8000)
declare @db varchar(8000)
declare @bufolder varchar(8000)

--Insert the name of the Backup Folder
SELECT @bufolder = 'F:\'

DECLARE dbs CURSOR FOR
SELECT [name] FROM sysdatabases WHERE [name] <> 'tempdb'

OPEN dbs
FETCH NEXT FROM dbs INTO @db

WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @sql = 
'BACKUP DATABASE [' + @db + '] TO  
	DISK = N''' + @bufolder + @db + '_1.bak'',  
	DISK = N''' + @bufolder + @db + '_2.bak'',  
	DISK = N''' + @bufolder + @db + '_3.bak'',  
	DISK = N''' + @bufolder + @db + '_4.bak'' 
	WITH NOFORMAT, INIT,  
	NAME = ''' + @db + '-Full Database Backup'', 
	SKIP, NOREWIND, NOUNLOAD,  STATS = 10'

--select @sql
exec(@sql)

FETCH NEXT FROM dbs INTO @db
END

CLOSE dbs
DEALLOCATE dbs

