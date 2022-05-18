/
--Query V$SESSION supplying the username for the session you want to terminate:
SELECT SID, SERIAL#, STATUS, SERVER
FROM V$SESSION
WHERE USERNAME = '<username>';
/
--Execute the ALTER SYSTEM command to terminate the session:
ALTER SYSTEM KILL SESSION '<sid, serial#>';
/

SELECT 
  USERNAME, SID, SERIAL#, STATUS, SERVER,SCHEMANAME, OSUSER, MACHINE, TERMINAL, PROGRAM, MODULE,
  'ALTER SYSTEM KILL SESSION ''' || sid || ', ' || serial# || '''' KILL_COMMAND
FROM V$SESSION
where 1=1
  and osuser = 'osuser'
  --and USERNAME = 'USERNAME'
;
/
ALTER SYSTEM KILL SESSION '80, 16975'
/

https://www.oracle.com/ocom/groups/public/@otn/documents/webcontent/283689.htm

https://oracle-base.com/articles/misc/killing-oracle-sessions
