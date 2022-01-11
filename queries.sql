/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE neutered IS true AND escape_attempt < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempt FROM animals WHERE weight_kg > 10.5;
SELECT *FROM animals WHERE neutered IS true;
SELECT *FROM animals WHERE name NOT IN ('Gabumon');
SELECT *FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
SELECT *FROM animals WHERE date_of_birth >= '12/05/2016'::date
AND date_of_birth < '07/01/2019'::date;
SELECT COUNT(name) FROM animals;
SELECT COUNT(escape_attempt) FROM animals WHERE escape_attempt <= 0;
SELECT AVG(weight_kg) FROM animals;
SELECT id, name, MAX(escape_attempt) FROM animals GROUP BY id, name;
SELECT id, name FROM animals WHERE neutered IS false GROUP BY id, name;
SELECT id, name FROM animals WHERE neutered IS true GROUP BY id, name;
SELECT MIN(weight_kg) FROM animals WHERE species IN ('digimon');
SELECT MAX(weight_kg) FROM animals WHERE species IN ('digimon');
SELECT MIN(weight_kg) FROM animals WHERE species IN ('pokemon');
SELECT MAX(weight_kg) FROM animals WHERE species IN ('pokemon');
SELECT id, name, date_of_birth, SUM(escape_attempt), COUNT(escape_attempt), SUM(escape_attempt) / COUNT(escape_attempt) as average FROM animals WHERE species IN ('pokemon') AND date_of_birth >= '12/05/1990'::date AND date_of_birth <= '01/01/2021'::date GROUP BY id, name, date_of_birth;
SELECT id, name, date_of_birth, SUM(escape_attempt), COUNT(escape_attempt), SUM(escape_attempt) / COUNT(escape_attempt) as average FROM animals WHERE species IN ('digimon') AND date_of_birth >= '12/05/1990'::date AND date_of_birth <= '01/01/2021'::date GROUP BY id, name, date_of_birth;