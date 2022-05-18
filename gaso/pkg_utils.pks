create or replace PACKAGE PKG_UTILS AS 

  -------------------------
  -- interval_to_seconds --
  -------------------------
  -- FUNKCIJA VRAĆA TRAJANJE U SEKUNDAMA A PRIMA DVA interval
  function interval_to_seconds (p_interval in INTERVAL DAY TO SECOND) return number;
  
  ----------------------------
  -- timestamp_diff_seconds --
  ----------------------------
  -- FUNKCIJA VRAĆA TRAJANJE U SEKUNDAMA A PRIMA DVA TIMESTAMPA (Pocetka i kraja preocesa)
  FUNCTION timestamp_diff_seconds (END_TIME timestamp, BEGIN_TIME timestamp) return number;

END PKG_UTILS;
