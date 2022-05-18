create or replace PACKAGE BODY PKG_UTILS AS

  -------------------------
  -- interval_to_seconds --
  -------------------------
  -- FUNKCIJA VRAĆA TRAJANJE U SEKUNDAMA A PRIMA DVA interval
  function interval_to_seconds (p_interval in INTERVAL DAY TO SECOND) return number is
  begin
    return extract (day    from (p_interval))*24*60*60 +
           extract (hour   from (p_interval))*60*60+
           extract (minute from (p_interval))*60+
           extract (second from (p_interval));
  end;
  
  ----------------------------
  -- timestamp_diff_seconds --
  ----------------------------
  -- FUNKCIJA VRAĆA TRAJANJE U SEKUNDAMA A PRIMA DVA TIMESTAMPA (Pocetka i kraja preocesa)
  function timestamp_diff_seconds (END_TIME timestamp, BEGIN_TIME timestamp) return number is 
  begin
    return extract (day    from (END_TIME-BEGIN_TIME))*24*60*60 +
           extract (hour   from (END_TIME-BEGIN_TIME))*60*60+
           extract (minute from (END_TIME-BEGIN_TIME))*60+
           extract (second from (END_TIME-BEGIN_TIME));
  end;

END PKG_UTILS;
