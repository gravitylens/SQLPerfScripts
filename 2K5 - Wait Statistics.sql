SET NOCOUNT ON
Print 'Wait Statistics'
Print ''

--Uncomment the following line to reset statistics counters.
--DBCC SQLPERF('sys.dm_os_wait_stats',CLEAR)

DECLARE @sum float
SELECT @sum = sum(wait_time_ms) FROM sys.dm_os_wait_stats

SELECT
	wait_type, 
	wait_time_ms/@sum*100.0 as [% Wait Time] 
INTO
	#waits
FROM 
	sys.dm_os_wait_stats 
ORDER BY
	wait_time_ms desc

SELECT
	* 
FROM
	#waits

DROP TABLE #waits



