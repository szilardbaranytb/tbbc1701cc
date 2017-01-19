-- Find top 10 list of most common larger aircrafts without ADS-B
SELECT count(*) cnt, main_type, mfr
FROM (
  SELECT mfr, 
    CASE WHEN mfr LIKE 'MCDONNELL%' OR mfr LIKE 'EMB%' THEN
      regexp_extract(trim(model), '([\\w]+[\\s|-]*[\\d]+)', 1) -- Extract first part of model name
    ELSE
      regexp_replace(trim(model), "-[^-&&\\S]+$", "") -- Remove any dashed model ending
    END AS main_type
  FROM aircraft_master_no_transp
  JOIN aircraft_reference ON aircraft_master_no_transp.mfr_mdl_code=aircraft_reference.code
  WHERE type_acft = 5 -- Only fixed wing, multiple engine
  AND no_seats > 25 -- Target regional jets and above
) dummy
GROUP BY main_type, mfr ORDER BY cnt DESC limit 10;

-- Find airlines to target
SELECT count(*) cnt, main_type,  reg_name
FROM (
  SELECT reg_name, 
    CASE WHEN mfr LIKE 'MCDONNELL%' OR mfr LIKE 'EMB%' THEN
      regexp_extract(trim(model), '([\\w]+[\\s|-]*[\\d]+)', 1) -- Extract first part of model name
    ELSE
      regexp_replace(trim(model), "-[^-&&\\S]+$", "") -- Remove any dashed model ending
    END AS main_type
  FROM aircraft_master_no_transp
  JOIN aircraft_reference ON aircraft_master_no_transp.mfr_mdl_code=aircraft_reference.code
  WHERE type_acft = 5 -- Only fixed wing, multiple engine
  AND no_seats > 25 -- Target regional jets and above
  AND reg_name NOT like '%TRUSTEE%'
  AND reg_name NOT like '%LEAS%'
) dummy
GROUP BY main_type, reg_name ORDER BY cnt DESC limit 10;

-- Find all the 737's without ADS-B
SELECT count(*) cnt, main_type,  reg_name
FROM (
  SELECT reg_name,
      regexp_replace(trim(model), "-[^-&&\\S]+$", "") AS main_type-- Remove any dashed model ending
  FROM aircraft_master_no_transp
  JOIN aircraft_reference ON aircraft_master_no_transp.mfr_mdl_code=aircraft_reference.code
  WHERE model like '737%'
) dummy
GROUP BY main_type, reg_name ORDER BY cnt DESC;
