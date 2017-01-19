
-- Create and use separate database for Skynet
-- Should really drop database first, but seems complicated to do if it's non empty..
CREATE DATABASE IF NOT EXISTS skynet;

USE skynet;

-- FAA Releasable Aircraft Dataset

DROP TABLE aircraft_master;

CREATE EXTERNAL TABLE aircraft_master (
    n_number             STRING  COMMENT "Identification number assigned to aircraft"
  , serial_number        STRING  COMMENT "The complete aircraft serial number assigned to the aircraft by the manufacturer"
  , mfr_mdl_code         STRING  COMMENT "A code assigned to the aircraft manufacturer, model and series"
                                   -- Positions (1-3) - Manufacturer Code
                                   -- Positions (4-5) - Model Code
                                   -- Positions (6-7) - Series Code
  , eng_mfr_mdl          STRING  COMMENT "A code assigned to the engine manufacturer and model"
                                   -- Positions (1-3) - Manufacturer Code
                                   -- Positions (4-5) - Model Code
  , year_mfr             INT     COMMENT "Year manufactured"
  , type_registrant      INT     COMMENT "Registrant type"
                                   --  1 - Individual
                                   --  2 - Partnership
                                   --  3 - Corporation
                                   --  4 - Co-Owned
                                   --  5 - Government
                                   --  8 - Non Citizen Corporation
                                   --  9 - Non Citizen Co-Owned
  , reg_name             STRING  COMMENT "Registrant’s Name"
  , street               STRING  COMMENT "Street address 1"
  , street2              STRING  COMMENT "Street address 2"
  , city                 STRING  COMMENT "Registrant’s City"
  , state                STRING  COMMENT "Registrant’s State"
  , zip_code             STRING  COMMENT "Registrant’s Zip Code"
  , region               STRING  COMMENT "Registrant’s Region"
                                   --  1 - Eastern
                                   --  2 - Southwestern
                                   --  3 - Central
                                   --  4 - Western-Pacific
                                   --  5 - Alaskan
                                   --  7 - Southern
                                   --  8 - European
                                   --  C- Great Lakes
                                   --  E - New England
                                   --  S - Northwest Mountain
  , county               STRING  COMMENT "A code representing the county"
  , country              STRING  COMMENT "A code representing the country"
  , last_action_date     STRING  COMMENT "Last Activity Date (YYYYMMDD)"
  , cert_issue_date      STRING  COMMENT "Certificate Issue Date (YYYYMMDD)"
  , certification        STRING  COMMENT "Certification requested and uses"
  , type_aircraft        INT     COMMENT "Aircraft type"
                                   --  1 - Glider
                                   --  2 - Balloon
                                   --  3 - Blimp/Dirigible
                                   --  4 - Fixed wing single engine
                                   --  5 - Fixed wing multi engine
                                   --  6 - Rotorcraft
                                   --  7 - Weight-shift-control
                                   --  8 - Powered Parachute
                                   --  9 - Gyroplane
  , type_engine          STRING  COMMENT "Engine type"
                                   --  0 - None
                                   --  1 - Reciprocating
                                   --  2 - Turbo-prop
                                   --  3 - Turbo-shaft
                                   --  4 - Turbo-jet
                                   --  5 - Turbo-fan
                                   --  6 - Ramjet
                                   --  7 - 2 Cycle
                                   --  8 - 4 Cycle
                                   --  9 – Unknown
                                   -- 10 – Electric
                                   -- 11 - Rotary
  , status_code          STRING  COMMENT "Registration status code"
                                   --  A - The Triennial Aircraft Registration form was mailed and has not been returned by the Post Office
                                   --  D - Expired Dealer
                                   --  E - The Certificate of Aircraft Registration was revoked by enforcement action
                                   --  M - Aircraft registered to the manufacturer under their Dealer Certificate
                                   --  N - Non-citizen Corporations which have not returned their flight hour reports
                                   --  R - Registration pending
                                   --  S - Second Triennial Aircraft Registration Form has been mailed and has not been returned by the Post Office
                                   --  T - Valid Registration from a Trainee
                                   --  V - Valid Registration
                                   --  W- Certificate of Registration has been deemed Ineffective or Invalid
                                   --  X - Enforcement Letter
                                   --  Z - Permanent Reserved
                                   --  1 - Triennial Aircraft Registration form was returned by the Post Office as undeliverable
                                   --  2 - N-Number Assigned – but has not yet been registered
                                   --  3 - N-Number assigned as a Non Type Certificated aircraft - but has not yet been registered
                                   --  4 - N-Number assigned as import - but has not yet been registered
                                   --  5 - Reserved N-Number
                                   --  6 - Administratively canceled
                                   --  7 - Sale reported
                                   --  8 - A second attempt has been made at mailing a Triennial Aircraft Registration form to the owner with no response
                                   --  9 - Certificate of Registration has been revoked
                                   -- 10 - N-Number assigned, has not been registered and is pending cancellation
                                   -- 11 - N-Number assigned as a Non Type Certificated (Amateur) but has not been registered that is pending cancellation
                                   -- 12 - N-Number assigned as import but has not been registered that is pending cancellation
                                   -- 13 - Registration Expired
                                   -- 14 - First Notice for Re-Registration/Renewal
                                   -- 15 - Second Notice for Re-Registration/Renewal
                                   -- 16 - Registration Expired – Pending Cancellation
                                   -- 17 - Sale Reported – Pending Cancellation
                                   -- 18 - Sale Reported – Canceled
                                   -- 19 - Registration Pending – Pending Cancellation
                                   -- 20 - Registration Pending – Canceled
                                   -- 21 - Revoked – Pending Cancellation
                                   -- 22 - Revoked – Canceled
                                   -- 23 - Expired Dealer (Pending Cancellation)
                                   -- 24 - Third Notice for Re-Registration/Renewal
                                   -- 25 - First Notice for Registration Renewal
                                   -- 26 - Second Notice for Registration Renewal
                                   -- 27 - Registration Expired
                                   -- 28 - Third Notice for Registration Renewal
                                   -- 29 - Registration Expired – Pending Cancellation
  , mode_s_code          INT     COMMENT "Aircraft Transponder Code"
  , fract_owner          STRING  COMMENT "Fractional Ownership (Y or blank)"
  , air_worth_date       STRING  COMMENT "Airworthiness Date (YYYYMMDD)"
  , other_names_1        STRING  COMMENT "1st co-owner or partnership name"
  , other_names_2        STRING  COMMENT "2ns co-owner or partnership name"
  , other_names_3        STRING  COMMENT "3rd co-owner or partnership name"
  , other_names_4        STRING  COMMENT "4th co-owner or partnership name"
  , other_names_5        STRING  COMMENT "4th co-owner or partnership name"
  , expiration_date      STRING  COMMENT "Certification expiration date (YYYYMMDD)"
  , unique_id            STRING  COMMENT "Unique Identification Number"
  , kit_mfr              STRING  COMMENT "Kit Manufacturer Name"
  , kit_model            STRING  COMMENT "Kit Model Name"
  , mode_s_code_hex      STRING  COMMENT "Mode S Code in Hexidecimal Format"
  , dummy                STRING  COMMENT "Trailing empty column"
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/data/skynet/MASTER'
tblproperties ("skip.header.line.count"="1");

DROP TABLE aircraft_reference;

CREATE EXTERNAL TABLE aircraft_reference (
    code                 STRING  COMMENT "Aircraft Manufacturer, Model and Series Code"
  , mfr                  STRING  COMMENT "Aircraft Manufacturer Name"
  , model                STRING  COMMENT "Model name"
  , type_acft            INT     COMMENT "Type of aircraft"
                                    --  1 - Glider
                                    --  2 - Balloon
                                    --  3 - Blimp/Dirigible
                                    --  4 - Fixed wing single engine
                                    --  5 - Fixed wing multi engine
                                    --  6 - Rotorcraft
                                    --  7 - Weight-shift-control
                                    --  8 - Powered Parachute
                                    --  9 - Gyroplane
  , type_eng             STRING  COMMENT "Type of engine"
                                    --  0 - None
                                    --  1 - Reciprocating
                                    --  2 - Turbo-prop
                                    --  3 - Turbo-shaft
                                    --  4 - Turbo-jet
                                    --  5 - Turbo-fan
                                    --  6 - Ramjet
                                    --  7 - 2 Cycle
                                    --  8 - 4 Cycle
                                    --  9 - Unknown
                                    -- 10 - Electric
                                    -- 11 - Rotary
  , ac_cat               INT     COMMENT "Aircraft Category Code"
                                    --  1 - Land
                                    --  2 - Sea
                                    --  3 - Amphibian
  , build_cert_ind       INT     COMMENT "Builder Certification Code"
                                    --  0 - Type Certificated
                                    --  1 - Not Type Certificated
                                    --  2 - Light Sport
  , no_eng               INT     COMMENT "Number of engines on the air"
  , no_seats             INT     COMMENT "Maximum number of seats in the aircraft"
  , ac_weight            STRING  COMMENT "Aircraft maximum gross take off weight in pounds"
                                    --  1 - Up to 12,499
                                    --  2 - 12,500 - 19,999
                                    --  3 - 20,000 and over.
                                    --  4 - UAV up to 55
  , speed                INT     COMMENT "Aircraft average cruising speed in miles per hour"
  , dummy                STRING  COMMENT "Trailing empty column"
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/data/skynet/ACFTREF'
tblproperties ("skip.header.line.count"="1");

-- ADS-B Exchange data

-- Raw data table
DROP TABLE adsb_data_raw;

CREATE EXTERNAL TABLE adsb_data_raw (
    broadcast            STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\n' LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/data/skynet/adsb'
tblproperties ("skip.header.line.count"="1");

-- Extracted details table
DROP TABLE adsb_data;

CREATE TABLE adsb_data (
    icao                 STRING  COMMENT "The transponder's permanent ICAO 24-bit address in the form of a hex code"
  , n_number             STRING  COMMENT "Registration number"
)
ROW FORMAT DELIMITED
STORED AS ORC;

-- Extracting details and populating second table
-- Make sure that the ADS-B files are uploded to HDFS before executing this (or else you will end up with an empty table)
INSERT OVERWRITE TABLE adsb_data
SELECT DISTINCT
       get_json_object( adsb_data_raw.broadcast, '$.Icao' )
     , get_json_object( adsb_data_raw.broadcast, '$.Reg' )
FROM   adsb_data_raw;


DROP TABLE adsb_data_us;

CREATE TABLE adsb_data_us (
    icao                 STRING  COMMENT "The transponder's permanent ICAO 24-bit address in the form of a hex code"
  , n_number_us          STRING  COMMENT "Registration number - without leading US specific 'N'"
)
ROW FORMAT DELIMITED
STORED AS ORC;

INSERT OVERWRITE TABLE adsb_data_us
SELECT icao, SUBSTR(n_number, 2) n_number_us 
from adsb_data
where n_number like 'N%';


-- EOF
