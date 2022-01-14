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
SELECT *
FROM animals;
ROLLBACK;
BEGIN;
    UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
    UPDATE animals
SET species = 'pokemon'
WHERE species is NULL;
    COMMIT;
    SELECT *
    FROM animals;
    BEGIN;
        DELETE FROM animals;
        ROLLBACK;
        SELECT *
        FROM animals;
        BEGIN;
            DELETE FROM animals
WHERE date_of_birth > '01-01-2022';
            SELECT *
            FROM animals;
            SAVEPOINT ROWS9;
        UPDATE animals
SET weight_kg = weight_kg * -1;
        SELECT *
        FROM animals;
        ROLLBACK
        TO ROWS9;
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


SELECT name
FROM animals JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';
SELECT name
FROM animals JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';
SELECT name, full_name
FROM animals FULL OUTER JOIN owners ON animals.owner_id = owners.id;
SELECT name, COUNT(species_id)
FROM species JOIN animals ON animals.species_id = species.id
GROUP BY species.name;
SELECT name
FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';
SELECT full_name, name, escape_attempts
FROM animals JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT (full_name) AS number_of_animals
from owners JOIN animals ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY number_of_animals DESC LIMIT 1;

SELECT animals
.name, visits.date_visited FROM animals JOIN visits ON animals.id = animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id =
(SELECT id
FROM vets
WHERE name = 'William Tatcher')
ORDER BY visits.date_visited DESC LIMIT 1;

SELECT COUNT
(animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id =
(SELECT id
FROM vets
WHERE name = 'Stephanie Mendez');

SELECT vets.name, species.name
FROM vets FULL OUTER JOIN specializations ON vets.id = specializations.vets_id FULL OUTER JOIN species ON species.id = specializations.species_id;

SELECT animals.name, visits.date_visited
FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND (visits.date_visited > '03-31-2020'
::date AND visits.date_visited < '08-31-2020'::date);

SELECT animals.name, COUNT (*) AS visits
FROM animals JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
HAVING COUNT (*) = (SELECT MAX (visits)
FROM (SELECT name, COUNT (*) AS visits
    FROM animals JOIN visits ON animals.id = visits.animals_id
    GROUP BY animals.name) animals);

SELECT animals.name, visits.date_visited
FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_visited LIMIT 1;

SELECT animals.name, animals.date_of_birth, animals.escape_attempt, animals.neutered, animals.weight_kg, vets.name
, age, date_of_graduation, date_visited FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date_visited DESC LIMIT 1;

SELECT vets.name, COUNT (*) AS atendance
FROM vets JOIN visits ON vets.id = visits.vets_id JOIN specializations ON vets.id = specializations.vets_id
WHERE specializations.species_id is NULL
GROUP BY vets.name;

SELECT COUNT (*), species.name
FROM animals JOIN species ON animals.species_id = species.id JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
LIMIT 1;