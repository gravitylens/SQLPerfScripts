SET NOCOUNT ON

Print 'Memory Pressure Test'
Print ''

DECLARE @snapshot TABLE(object_name nchar(128), counter_name nchar(128), instance_name nchar(128), cntr_value bigint)
DECLARE @ratio TABLE(object_name nchar(128), counter_name nchar(128), instance_name nchar(128), cntr_value bigint)
DECLARE @base TABLE(object_name nchar(128), counter_name nchar(128), instance_name nchar(128), cntr_value bigint)

INSERT INTO @snapshot 
SELECT
	object_name,
	counter_name,
	instance_name,
	cntr_value 
FROM 
	sys.dm_os_performance_counters

INSERT INTO @ratio
SELECT 
	object_name,
	counter_name,
	instance_name,
	cntr_value 
FROM 
	@snapshot
WHERE
	counter_name like '%cache hit ratio  %'

INSERT INTO @base
SELECT 
	object_name,
	counter_name,
	instance_name,
	cntr_value 
FROM 
	@snapshot
WHERE
	counter_name like '%cache hit ratio base%'
and cntr_value <> 0
/*
SELECT
	cntr_value as "Transactions per Second"
FROM 
	sys.dm_os_performance_counters
WHERE
	counter_name = 'Transactions/sec'
and instance_name = '_Total'
*/
SELECT 
	cntr_value as "Page Life Expectancy"
FROM 
	@snapshot
WHERE
	counter_name = 'Page life expectancy'
and object_name like '%:Buffer Manager%'

SELECT 
	cntr_value as "Memory Grants Pending"
FROM 
	@snapshot
WHERE
	counter_name = 'Memory Grants Pending'

SELECT
	cast(ratio.object_name as nvarchar(40)) AS object_name,
	cast(ratio.counter_name as nvarchar(30)) AS counter_name,
	cast(ratio.instance_name as nvarchar(35)) as instance_name,
	--cast(ratio.cntr_value as float)/cast(base.cntr_value as float) * 100.0 as cntr_value
	((ratio.cntr_value * 100) / base.cntr_value) as "Cache Hit Ratio"
FROM
	@ratio ratio
	INNER JOIN @base base on (ratio.object_name = base.object_name and ratio.instance_name = base.instance_name)

                                                                                                          