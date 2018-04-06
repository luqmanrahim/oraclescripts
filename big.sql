select * from
(select sum(bytes/1024/1024/1024) GB, segment_name, segment_type, owner
from dba_segments
group by segment_name, segment_type, owner
order by GB desc)
where rownum < 30;
