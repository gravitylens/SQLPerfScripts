USE [master]
GO
declare @MAXSIZE bigint
select @MAXSIZE = size * 8 from newmerix_change..sysfiles where fileid=1
declare @sql nvarchar(MAX)
select @sql = N'ALTER DATABASE [newmerix_change] MODIFY FILE ( NAME = N''newmerix_change'', MAXSIZE = ' + convert(nvarchar(100), @MAXSIZE) + N'KB' + ')'
EXEC(@sql)
GO
