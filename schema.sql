/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id INT NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	escape_attempt INT,
	neutered BOOLEAN NOT NULL,
	weight_kg NUMERIC NOT NULL
);

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50),
	age INT NOT NULL
);
CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	age INT,
	date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
	species_id INT,
	vets_id INT,
	speciality VARCHAR(50),
	PRIMARY KEY (species_id, vets_id),
	FOREIGN KEY (species_id) REFERENCES species(id) ON UPDATE CASCADE,
	FOREIGN KEY (vets_id) REFERENCES vets(id) ON UPDATE CASCADE
);

ALTER TABLE animals DROP COLUMN species;

CREATE SEQUENCE animal_id
OWNED BY animals.id;

ALTER TABLE animals
ALTER COLUMN id SET DEFAULT nextval('animal_id');

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES owners (id);

ALTER TABLE animals
ADD species_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_species_id FOREIGN KEY (species_id) REFERENCES species (id);