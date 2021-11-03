SELECT
           s.spid, BlockingSPID = s.blocked, DatabaseName = DB_NAME(s.dbid),
           s.program_name, s.loginame, ObjectName = OBJECT_NAME(objectid), 
		Definition = CAST(text AS VARCHAR(MAX))
 INTO        #Processes
 FROM      sys.sysprocesses s
 CROSS APPLY sys.dm_exec_sql_text (sql_handle)
 WHERE
            s.spid > 50


WITH Blocking(SPID, BlockingSPID, BlockingStatement, RowNo, LevelRow)
 AS
 (
      SELECT
       s.SPID, s.BlockingSPID, s.Definition,
       ROW_NUMBER() OVER(ORDER BY s.SPID),
       0 AS LevelRow
     FROM
       #Processes s
       JOIN #Processes s1 ON s.SPID = s1.BlockingSPID
     WHERE
       s.BlockingSPID = 0
     UNION ALL
     SELECT
       r.SPID,  r.BlockingSPID, r.Definition,
       d.RowNo,
       d.LevelRow + 1
     FROM
       #Processes r
      JOIN Blocking d ON r.BlockingSPID = d.SPID
     WHERE
       r.BlockingSPID > 0
 )
 SELECT * FROM Blocking
 ORDER BY RowNo, LevelRow