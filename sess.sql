set lines 160 pages 1000
column inst_id format 999 heading "Inst"
column sid format A10 heading "SID|Serial"
column howlong format A13 heading  "How Long"
column last_call_et format 999,999 heading "Secs"
column module format A30 heading "Module"
column username format A14 heading "User Name"
column osusr format A10 heading "OS User"
column machine format A20 heading "Machine"
column program format a20 heading "Program"
column module format a20 heading "Module"
column terminal format A15 heading "Terminal"
column sql_address format A16 heading "SQL|Address"
column PREV_SQL_ADDR format A16 heading "Previous|Address"
column TADDR format A16 heading "Trans|Address"
column process format A16 heading "Process"
column status format A8 heading "Status"
column spid format A5 heading "SPID"
select
A.inst_id,
A.SID||','||A.SERIAL# sid,
substr(to_char(to_timestamp(to_char(sysdate,'DD.MM.YYYY:HH24:MI:SS'),'DD.MM.YYYY:HH24:MI:SS')-
to_timestamp(to_char(A.logon_time,'DD.MM.YYYY:HH24:MI:SS'),'DD.MM.YYYY:HH24:MI:SS')),7,13) howlong,
A.last_call_et,
A.PROGRAM,
A.module,
substr(A.USERNAME,1,15) USERNAME,
substr(A.OSUSER,1,15) OSUSR,
A.STATUS,
B.SPID,
A.MACHINE
from gv$session A, gv$process B
where
A.paddr = B.addr AND
A.inst_id = B.inst_id AND
A.sid = nvl('&sess_sid',A.sid) AND
B.spid = nvl('&sess_process_id',B.spid) AND
A.status = nvl('&sess_status',A.status) AND
A.program like nvl(upper('%&programname%'),A.program) AND
A.username like nvl(upper('%&usrname%'),A.username)
order by 1,5;
clear columns;
