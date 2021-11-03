create table #waits

(
    [Wait Type]        nvarchar(32) not null,
    [Requests]         float not null,
    [Wait Time]        float not null,
    [Signal Wait Time] float not null
)

insert into #waits exec('dbcc sqlperf(waitstats) with tableresults, no_infomsgs')
delete from #waits where [Wait Type] = 'Total'
select 
	[Wait Type],
	[Wait Time] - [Signal Wait Time] as [Resource Wait Time]
from #waits order by [Wait Time] - [Signal Wait Time] desc

drop table #waits