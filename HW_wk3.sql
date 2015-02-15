-- IS607 | Data ACQUISITION AND MANAGEMENT | ASSIGNMENT No. 3
-- James Hamski | james.hamski@spsmail.cuny.edu

-- Create a table of net generation in thousands of megawatt hours for 2013 by INSERT entry
DROP TABLE IF EXISTS NetGen_2013;

CREATE TABLE NetGen_2013
(Source varchar,  NetGen integer);

INSERT INTO NetGen_2013
VALUES
('coal', 1584194),
('petroleum_liquids', 13645),
('petroleum_coke', 13425),
('natural_gas', 1125691),
('other_gases', 12876),
('nuclear', 789016),
('conventional_hydroelectric', 268548),
('wind', 167992),
('solar', 9022),
('geothermal', 15775),
('biomass', 61885),
('wood', 40922),
('other_biomass', 20964),
('hydro_pumped_storage', -4681),
('other', 13639);

-- Create a table of net generation in thousands of megawatt hours for 2012 by .csv entry
DROP TABLE IF EXISTS NetGen_2012;

CREATE TABLE NetGen_2012
(Source varchar,  NetGen integer);

COPY NetGen_2012 FROM '/Users/Shared/net_gen_2012.csv' DELIMITERS ',' CSV;

-- Create table of carbon emissions from 2012 and 2013
DROP TABLE IF EXISTS CarbonEmissions;

CREATE TABLE CarbonEmissions
(Source varchar,  Emissions_2012 integer, Emissions_2013 integer);

COPY CarbonEmissions FROM '/Users/Shared/carbon_emissions.csv' DELIMITERS ',' CSV;

-- Review dataset
SELECT * FROM CarbonEmissions;
SELECT * FROM NetGen_2013; 
SELECT * FROM NetGen_2012;

-- Create a table to translate different categories between NetGen_yyyy and CarbonEmissions tables
-- GenNames has a one to one relationship with CarbonEmissions and a one to many relationship with NetGen_yyyy
DROP TABLE IF EXISTS GenNames;

CREATE TABLE GenNames
(NetGenName varchar,  CarbonEmissionsName varchar);

INSERT INTO GenNames
VALUES
('coal', 'Coal'),
('petroleum_liquids', 'Petroleum'),
('petroleum_coke', 'Petroleum'),
('natural_gas', 'Natural Gas');

-- What is the carbon intensity (tons of CO2 produced per thousands of megawatt hours generated) for coal, gas, and petroleum in 2013?

SELECT 
NetGen_2013.Source, NetGen, Emissions_2013, Emissions_2013 / NetGen AS Carbon_Intensity
FROM NetGen_2013
JOIN GenNames
ON NetGen_2013.Source = GenNames.NetGenName
JOIN CarbonEmissions
ON GenNames.CarbonEmissionsName = CarbonEmissions.Source;




