select 
	spid, 
	kpid, 
	waittime, 
	lastwaittype, 
	db_name(dbid), 
	hostname, 
	program_name, 
	loginame 
from 
	sysprocesses 
where 
	status = 'runnable'