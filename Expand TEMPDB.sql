USE [master]
GO
ALTER DATABASE [tempdb] MODIFY FILE ( NAME = N'tempdev', SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev2', FILENAME = N'J:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdev2.ndf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev3', FILENAME = N'I:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdev3.ndf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev4', FILENAME = N'J:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdev4.ndf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev5', FILENAME = N'I:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdev5.ndf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev6', FILENAME = N'J:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdev6.ndf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev7', FILENAME = N'I:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdev7.ndf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev8', FILENAME = N'J:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\tempdev8.ndf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] MODIFY FILE ( NAME = N'templog', SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD LOG FILE ( NAME = N'templog2', FILENAME = N'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog2.ldf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD LOG FILE ( NAME = N'templog3', FILENAME = N'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog3.ldf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD LOG FILE ( NAME = N'templog4', FILENAME = N'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog4.ldf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD LOG FILE ( NAME = N'templog5', FILENAME = N'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog5.ldf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD LOG FILE ( NAME = N'templog6', FILENAME = N'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog6.ldf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD LOG FILE ( NAME = N'templog7', FILENAME = N'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog7.ldf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [tempdb] ADD LOG FILE ( NAME = N'templog8', FILENAME = N'L:\Microsoft SQL Server\MSSQL.2\MSSQL\Data\templog8.ldf' , SIZE = 10240KB , FILEGROWTH = 10240KB )
GO
