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