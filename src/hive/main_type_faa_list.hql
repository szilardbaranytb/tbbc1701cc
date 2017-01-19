-- Top list of FAA registered aircraft main types
-- There is no consistency for sub type naming even for the same manufacture so
-- currently the main type is determined by stripping any dashed ending which works
-- for common Boeing and Airbus models 
SELECT count(*) cnt, main_type
FROM (
  SELECT regexp_replace(trim(model), "-[^-&&\\S]+$", "") AS main_type -- Remove any dashed model ending
  FROM aircraft_master
  JOIN aircraft_reference ON aircraft_master.mfr_mdl_code=aircraft_reference.code
  WHERE type_acft = 5 -- Only fixed wing, multiple engine
) t2
GROUP BY main_type ORDER BY cnt DESC;
