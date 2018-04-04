11g: 
=== 
set feedback off timing off 
alter session set nls_date_format = 'DD-MON-YY HH24:MI:SS'; 
define dbid="" 
set termout off 
col dbid new_value p_dbid 
select dbid dbid from v$database; 
col max_sample_time for a30 
col time_taken for a30 
set termout on feedback on 
set colsep "|" 
set lin 300 pages 9999 
spool 11g_apprun_sql_ashtimes.out 
select sql_id,sql_exec_id,sql_exec_start,max(sample_time) max_sample_time , max(sample_time)-sql_exec_start time_taken 
from 
dba_hist_active_sess_history where 
sql_id='&sqlid' and ---- <<<<<<<<<<<here you need to pass the relevant sql_id 
dbid=&&p_dbid 
and instance_number=1 
group by sql_id,sql_exec_id ,sql_exec_start order by 2 asc; 
spool off 


12c: 
=== 
set feedback off timing off 
alter session set nls_date_format = 'DD-MON-YY HH24:MI:SS'; 
define dbid="" 
set termout off 
col dbid new_value p_dbid 
select dbid dbid from v$database; 
col max_sample_time for a30 
col time_taken for a30 
set termout on feedback on 
set colsep "|" 
set lin 300 pages 9999 
spool 12c_apprun_sql_ashtimes.out 
select sql_id,sql_exec_id,sql_exec_start,max(sample_time) max_sample_time , max(sample_time)-sql_exec_start time_taken 
from 
dba_hist_active_sess_history where 
sql_id='&sqlid' and ---- <<<<<<<<<<<here you need to pass the relevant sql_id 
dbid=&&p_dbid 
and instance_number=1 
group by sql_id,sql_exec_id ,sql_exec_start order by 2 asc; 
spool off 
