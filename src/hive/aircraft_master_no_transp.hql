-- assumes a table aircraft_transp, which has all aircraft we've seen with transponders.
-- To get the aircraft *without* transponders, "subtract" the ones with transponders from all aircraft.  

CREATE TABLE aircraft_master_no_transp AS 
SELECT t1.str
FROM aircraft_master am 
LEFT OUTER JOIN aircraft_transp am ON am.str = at.str
WHERE at.str IS NULL;


