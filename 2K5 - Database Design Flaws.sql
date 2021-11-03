print 'Database Design'
print 'Top 20 Percent Most Used Query Plans (look for more than 4 JOINS)'
select top 20 PERCENT
	s1.usecounts, 
	s1.cacheobjtype,
	s1.objtype,
	db_name(s2.dbid) as [Database],
	s2.objectid,
	s2.text
from 
	sys.dm_exec_cached_plans s1
	CROSS APPLY sys.dm_exec_sql_text(plan_handle) as s2
--where s2.dbid = DB_ID()
order by 
	usecounts desc

Print 'Frequencty Updated Tables'
SELECT TOP 20 PERCENT
	OBJECT_NAME(a.object_id) as [Table],
	row_lock_count,
	count(b.name) as indexes
FROM 
	sys.dm_db_index_operational_stats(DB_ID(), NULL, NULL, NULL) a
	INNER JOIN sys.indexes b ON (a.object_id = b.object_id)
group by
	OBJECT_NAME(a.object_id),
	row_lock_count
ORDER BY 
	row_lock_count DESC

Print 'Most Time Consuming Queries'
select top 20 PERCENT
	s2.text as [Query],
	total_elapsed_time as [Total Time (ms)],	
	execution_count as [Execution Count],
	total_elapsed_time/execution_count as [Average Time (ms)]
FROM 
	sys.dm_exec_query_stats 
	CROSS APPLY sys.dm_exec_sql_text(plan_handle) as s2
ORDER BY 
	total_elapsed_time DESC

Print 'Unused Indexes'
SELECT
	OBJECT_NAME(object_id) as [Table],
	name as [Index],
	type_desc
FROM
	sys.indexes
WHERE
	object_id not in (select object_id from sys.dm_db_index_usage_stats where database_id = DB_ID())
