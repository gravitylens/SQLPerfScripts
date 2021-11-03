select 
	session_id, 
	program_name, 
	host_name,
	client_interface_name,
	login_name,
	cast(cpu_time as real)/(cast(getdate() as real)-cast(login_time as real)+.01) as [CPU Load],
	cast(cpu_time as real)/cast(total_elapsed_time + .01 as real) as [% CPU Time]
from 
	sys.dm_exec_sessions 
order by 
	cast(cpu_time as real)/(cast(getdate() as real)-cast(login_time as real)+.01) desc