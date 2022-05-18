-- split csv
with rws as (
  select 'split,into,rows' str from dual
)
select 
  regexp_substr (str,'[^,]+',1,level) value
from   rws
--connect by level <= length ( str ) - length ( replace ( str, ',' ) ) + 1;
connect by level <= regexp_count(str, ',' ) + 1;

/
-- https://blogs.oracle.com/sql/post/split-comma-separated-values-into-rows-in-oracle-database
select 
  level,
  regexp_substr('String1,string2,string3', '[^,]+',1,level,'i')
from dual 
connect by level <= regexp_count('String1,string2,string3', ',',1)+1
;
/
-- https://stackoverflow.com/questions/14328621/splitting-string-into-multiple-rows-in-oracle
/
select level, length (regexp_replace('Err1, Err2, Err3', '[^,]+'))  + 1 as max 
from dual connect by level <= length (regexp_replace('Err1, Err2, Err3', '[^,]+'))  + 1
