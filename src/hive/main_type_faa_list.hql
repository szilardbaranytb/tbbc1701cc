-- Top list of FAA registered aircraft main types
-- There is no consistency for sub type naming even for the same manufacture so
-- currently the main type is determined by stripping any dashed ending which works
-- for common Boeing and Airbus models 
SELECT count(*) cnt, main_type, mfr
FROM (
  SELECT mfr, regexp_replace(trim(model), "-[^-&&\\S]+$", "") AS main_type -- Remove any dashed model ending
  FROM aircraft_master_no_transp
  JOIN aircraft_reference ON aircraft_master_no_transp.mfr_mdl_code=aircraft_reference.code
  WHERE type_acft = 5 -- Only fixed wing, multiple engine
  AND no_seats > 30
) dummy
GROUP BY main_type, mfr ORDER BY cnt DESC;

-- Find airlines to target
SELECT count(*) cnt, main_type, mfr, reg_name
FROM (
  SELECT reg_name, mfr, regexp_replace(trim(model), "-[^-&&\\S]+$", "") AS main_type -- Remove any dashed model ending
  FROM aircraft_master_no_transp
  JOIN aircraft_reference ON aircraft_master_no_transp.mfr_mdl_code=aircraft_reference.code
  WHERE type_acft = 5 -- Only fixed wing, multiple engine
  AND no_seats > 30
  AND reg_name NOT like 'WELLS%'
) dummy
GROUP BY main_type, mfr, reg_name ORDER BY cnt DESC limit 10;
