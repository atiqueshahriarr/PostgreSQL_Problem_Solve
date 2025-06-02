CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(100)
);



CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(70),
    sighting_time TIMESTAMP,
    notes VARCHAR(100)
);