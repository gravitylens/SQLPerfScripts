use master
go
alter database tempdb modify file (name = tempdev, filename = 'I:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdb.mdf')
go
alter database tempdb modify file (name = templog, filename = 'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog.ldf')
go