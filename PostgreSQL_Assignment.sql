CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(100)
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(30)
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes VARCHAR(200)
);


INSERT INTO rangers (name, region)
VALUES
  ('Alice Green', 'Northern Hills'),
  ('Bob White', 'River Delta'),
  ('Carol King', 'Mountain Range');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES
  ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
  ('Bengal Tiger', 'Panthera tigris', '1758-01-01', 'Endangered'),
  ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
  ('Asiatic Elephant', 'Elephas maximus', '1758-01-01', 'Endangered');


INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;





--1
INSERT INTO rangers (name, region)
  VALUES ('Derek Fox', 'Coastal Plains');
SELECT * FROM rangers;


--2
SELECT COUNT(DISTINCT species_id) AS unique_species  FROM sightings;


--3
SELECT * FROM sightings
WHERE location LIKE '%Pass%';


--4
SELECT rangers.name, count(*) as total_sightings FROM sightings
JOIN rangers USING(ranger_id)
GROUP BY rangers.name;


--5
SELECT common_name FROM species
WHERE species_id NOT IN (SELECT species_id FROM sightings)


--6
SELECT common_name, sighting_time, name FROM sightings
JOIN species USING(species_id)
JOIN rangers USING(ranger_id)
ORDER BY sighting_time DESC
LIMIT 2


--7
-- INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)

SELECT * FROM species
WHERE 

UPDATE species SET conservation_status = 'Historic' WHERE (SELECT *, EXTRACT(YEAR FROM discovery_date) AS discovery_year FROM species WHERE EXTRACT(YEAR FROM discovery_date) < 1800;)


--8






--9







--10