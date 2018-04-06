set lines 160 pages 1000
col PGA_TARGET_FOR_ESTIMATE for 999,999,999,999,999 heading "PGA Size"
col PGA_TARGET_FACTOR for 999.99 heading "Size|Factor"
col BYTES_PROCESSED for 999,999,999,999,999 heading "Bytes|Processed"
col ESTD_TIME for 999,999,999,999 heading "Estimated|Time"
col ESTD_PGA_CACHE_HIT_PERCENTAGE for 999 heading "PGA|Cache|Hit (%)"
select PGA_TARGET_FOR_ESTIMATE, PGA_TARGET_FACTOR, BYTES_PROCESSED, ESTD_TIME, ESTD_PGA_CACHE_HIT_PERCENTAGE from gv$pga_target_advice order by inst_id, pga_target_for_estimate;
