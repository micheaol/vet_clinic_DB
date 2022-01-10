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
