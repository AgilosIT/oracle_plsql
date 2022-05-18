-- select count from multiple tables in schema

SELECT 
  table_name,
  TO_NUMBER(extractvalue(xmltype(dbms_xmlgen.getxml('select count(*) cnt from '||table_name)),'/ROWSET/ROW/CNT')) as count
  --TO_NUMBER(extractvalue(xmltype(dbms_xmlgen.getxml('select count(*) cnt from '||owner||'.'||table_name)),'/ROWSET/ROW/CNT')) as count
FROM user_tables
--WHERE owner = 'Schema'
order by table_name
;
