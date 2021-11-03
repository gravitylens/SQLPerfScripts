# SQLPerfScripts
Scripts for diagnosing performance problems on Microsoft SQL Server.  I created these scripts a looooong time ago, but they are still handy.  Most scripts where written for SQL2005 and should still work today, some will also work on older versions.  A few are specifically for SQL2000 because the 2005 version would not work.  Like a said, a looooong time ago.

The most useful of these is the Wait Statistics script.  Microsoft used to have a white paper, which I've now lost, but the definitions of the different waits should still be findable with Google.  Interpreting the results of that query can determine whether CPU, RAM, DISK or some other resource is the bottleneck on a server. Spoiler:  It's almost always RAM.
