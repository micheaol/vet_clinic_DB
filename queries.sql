/*Queries that provide answers to the questions from all projects.*/

SELECT *
FROM animals
WHERE name LIKE '%mon%';
SELECT name
FROM animals
WHERE neutered
IS true AND escape_attempt < 3;
SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempt
FROM animals
WHERE weight_kg > 10.5;
SELECT *
FROM animals
WHERE neutered
IS true;
SELECT *
FROM animals
WHERE name NOT IN ('Gabumon');
SELECT *
FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
SELECT *
FROM animals
WHERE date_of_birth >= '12/05/2016'
::date
AND date_of_birth < '07/01/2019'::date;
SELECT COUNT(name)
FROM animals;
SELECT COUNT(escape_attempt)
FROM animals
WHERE escape_attempt <= 0;
SELECT AVG(weight_kg)
FROM animals;
SELECT id, name, MAX(escape_attempt)
FROM animals
GROUP BY id, name;
SELECT id, name
FROM animals
WHERE neutered
IS false GROUP BY id, name;
SELECT id, name
FROM animals
WHERE neutered
IS true GROUP BY id, name;
SELECT MIN(weight_kg)
FROM animals
WHERE species IN ('digimon');
SELECT MAX(weight_kg)
FROM animals
WHERE species IN ('digimon');
SELECT MIN(weight_kg)
FROM animals
WHERE species IN ('pokemon');
SELECT MAX(weight_kg)
FROM animals
WHERE species IN ('pokemon');

UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE animal_name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species is NULL;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '01-01-2022';
SELECT * FROM animals;
SAVEPOINT ROWS9;
UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO ROWS9;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT id, name, date_of_birth, SUM(escape_attempt), COUNT(escape_attempt), SUM(escape_attempt) / COUNT(escape_attempt) as average
FROM animals
WHERE species IN ('pokemon') AND date_of_birth >= '12/05/1990'
::date AND date_of_birth <= '01/01/2021'::date GROUP BY id, name, date_of_birth;
SELECT id, name, date_of_birth, SUM(escape_attempt), COUNT(escape_attempt), SUM(escape_attempt) / COUNT(escape_attempt) as average
FROM animals
WHERE species IN ('digimon') AND date_of_birth >= '12/05/1990'
::date AND date_of_birth <= '01/01/2021'::date GROUP BY id, name, date_of_birth;


SELECT animal_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animal_name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT animal_name, full_name FROM animals FULL OUTER JOIN owners ON animals.owner_id = owners.id;
SELECT name, COUNT(species_id) FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name;
SELECT animal_name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT full_name, animal_name, escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT (full_name) AS number_of_animals from owners JOIN animals ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY number_of_animals DESC LIMIT 1;
© 2022 GitHub, Inc.
Terms