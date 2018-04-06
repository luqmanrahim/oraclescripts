select a.data_size+b.temp_size+c.redo_size "total_size (GB)"
from ( select sum(bytes/1024/1024/1024) data_size
         from dba_data_files ) a,
     ( select nvl(sum(bytes/1024/1024/1024),0) temp_size
         from dba_temp_files ) b,
     ( select sum(bytes/1024/1024/1024) redo_size
         from sys.v_$log ) c
/
