-- cross join lateral
-- version >= Oracle 12c 

with stg as (
  select 'prvi;drugi;treci' as col1 from dual union all
  select '4;pet;VI' as col1 from dual union all
  select 'sieben;acht;neun' as col1 from dual
)
select stg.*, cjl_a.* from stg
cross join lateral (
  select
    level lvl,
    to_char(regexp_substr(stg.col1, '[^;]+',1,level)) id
  from dual
  connect by level <= regexp_count(stg.col1, '[^;]+',1)
) cjl_a
/
select * from v$version;

/

-- https://oracle-base.com/articles/12c/lateral-inline-views-cross-apply-and-outer-apply-joins-12cr1
