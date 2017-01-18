-- Most common aircraft models.

-- TODO : Base on master table that doesn't have transponders

-- TODO : Figure out how to parse out "main" model part, e.g. for BOEING 747-123 , only "747"

select r.mfr, r.model, count(*) cnt
from aircraft_master m 
join aircraft_reference r 
on r.code = m.mfr_mdl_code 
where type_aircraft = 5 -- only fixed wing, multiple engine
group by mfr, model
order by cnt desc;