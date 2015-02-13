-- IS607 | Data ACQUISITION AND MANAGEMENT | ASSIGNMENT No. 3
-- James Hamski | james.hamski@spsmail.cuny.edu

-- Create a table of net generation in thousands of megawatt hours for 2013 by INSERT entry
DROP TABLE IF EXISTS net_gen_2013;

CREATE TABLE net_gen_2013
(SOURCE varchar,  NETGEN double precision);

INSERT INTO net_gen_2013
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


-- Create a table of classificaitons

CREATE TABLE gen_type
(SOURCE varchar,  NETGEN double precision);


