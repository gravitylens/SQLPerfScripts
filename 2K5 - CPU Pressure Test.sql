SET NOCOUNT ON

Print 'CPU Pressure Test'
Print ''

SELECT
	cntr_value as "Transactions per Second"
FROM 
	sys.dm_os_performance_counters
WHERE
	counter_name = 'Transactions/sec'
and instance_name = '_Total'

SELECT scheduler_id, current_tasks_count, runnable_tasks_count
FROM sys.dm_os_schedulers
WHERE scheduler_id < 255