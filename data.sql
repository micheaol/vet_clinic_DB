/* Populate database with sample data. */

INSERT INTO animals
	(id, name, date_of_birth, escape_attempt, neutered, weight_kg)
VALUES
	(1, 'Agumon', (to_date('03/02/2020','dd/mm/yyyy')), 0, true, 10.23),
	(2, 'Gabumon', (to_date('15/11/2018','dd/mm/yyyy')), 2, true, 8),
	(3, 'Pikachu', (to_date('07/01/2021','dd/mm/yyyy')), 1, false, 15.04),
	(4, 'Devimon', (to_date('12/05/2017','dd/mm/yyyy')), 5, true, 11),
    (5, 'Charmander', (to_date('08/02/2020','dd/mm/yyyy')), 0, false, 11),
    (6, 'Plantmon', (to_date('15/11/2022','dd/mm/yyyy')), 2, true, 5.7),
    (7, 'Squirtle',(to_date('02/04/1993','dd/mm/yyyy')), 3, false, 12.13),
    (8, 'Angemon', (to_date('12/06/2005','dd/mm/yyyy')), 1, true, 45),
    (9,	'Boarmon', (to_date('07/06/2005','dd/mm/yyyy')), 7,	true, 20.4),
    (10,'Blossom', (to_date('13/10/1998','dd/mm/yyyy')), 3,	true, 17);

INSERT INTO owners
	(full_name, age)
VALUES
	('Sam Smith' , 34),
	('Jennifer Orwell', 19),
	('Bob', 45),
	('Melody Pond', 77),
	('Dean Winchester', 14),
	('Jodie Whittaker', 38);

INSERT INTO species
	(name)
VALUES
	('Pokemon'),
	('Digimon');

INSERT INTO vets 
(name, age, date_of_graduation)

VALUES ('William Tatcher', 45, (to_date('04/04/2020','dd/mm/yyyy'))),
	   ('Maisy Smith', 26, (to_date('17/01/2019','dd/mm/yyyy'))),
	   ('Stephanie Mendez', 64, (to_date('05/04/1981','dd/mm/yyyy'))),
	   ('Jack Harkness', 38, (to_date('08/06/2008','dd/mm/yyyy')));

INSERT INTO specializations 
(vets_id, species_id)
VALUES(1, 1),
	  (3, 1),
	  (3, 2),
	  (4, 2);

INSERT INTO visits (animals_id, vets_id, date_visited)
VALUES 
(1, 1, (to_date('24/05/2020','dd/mm/yyyy'))),
(1, 3, (to_date('22/07/2020','dd/mm/yyyy'))),
(2, 4, (to_date('02/02/2021','dd/mm/yyyy'))),
(3, 2, (to_date('05/01/2020','dd/mm/yyyy'))),
(3, 2, (to_date('08/03/2020','dd/mm/yyyy'))),
(3, 2, (to_date('14/05/2020','dd/mm/yyyy'))),
(4, 3, (to_date('04/05/2021','dd/mm/yyyy'))),
(5, 4, (to_date('24/02/2020','dd/mm/yyyy'))),
(6, 2, (to_date('21/12/2019','dd/mm/yyyy'))),
(6, 1, (to_date('10/08/2020','dd/mm/yyyy'))),
(6, 2, (to_date('07/04/2021','dd/mm/yyyy'))),
(7, 3, (to_date('29/09/2019','dd/mm/yyyy'))),
(1, 4, (to_date('03/10/2020','dd/mm/yyyy'))),
(1, 4, (to_date('04/11/2020','dd/mm/yyyy'))),
(9, 2, (to_date('24/01/2019','dd/mm/yyyy'))),
(9, 2, (to_date('15/05/2019','dd/mm/yyyy'))),
(9, 2, (to_date('27/02/2020','dd/mm/yyyy'))),
(9, 2, (to_date('03/08/2020','dd/mm/yyyy'))),
(10, 3, (to_date('24/05/2020','dd/mm/yyyy'))),
(10, 1, (to_date('11/01/2021','dd/mm/yyyy')));

BEGIN;
	UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';
	UPDATE animals
SET species_id = 1
WHERE species_id is NULL;
	COMMIT;

	BEGIN;
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Agumon' AND owners.full_name = 'Sam Smith';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Pikachu' AND owners.full_name = 'Jennifer Orwell';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Gabumon' AND owners.full_name = 'Jennifer Orwell';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Devimon' AND owners.full_name = 'Bob';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Plantmon' AND owners.full_name = 'Bob';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Charmander' AND owners.full_name = 'Melody Pond';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Squirtle' AND owners.full_name = 'Melody Pond';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Blossom' AND owners.full_name = 'Melody Pond';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Angemon' AND owners.full_name = 'Dean Winchester';
		UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE name = 'Boarmon' AND owners.full_name = 'Dean Winchester';
COMMIT;