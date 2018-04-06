set lines 160 pages 1000
col ESTD_PHYSICAL_READS for 999,999,999,999,999
col ESTD_DB_TIME_FACTOR for 9.9999 heading "DB Time fctr"
col SGA_SIZE_FACTOR for 9.9999 heading "SGA fctr"
select * from gv$sga_target_advice order by inst_id, SGA_SIZE asc;
