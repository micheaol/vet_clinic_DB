/* Populate database with sample data. */

INSERT INTO animals (
	id,
	name,
	date_of_birth,
	escape_attempt,
	neutered,
	weight_kg
) 
VALUES (
	1,
	'Agumon',
	(to_date('03/02/2020','dd/mm/yyyy')),
	0,
	true,
	10.23
);

INSERT INTO animals (
	id,
	name,
	date_of_birth,
	escape_attempt,
	neutered,
	weight_kg
) 

VALUES (
	2,
	'Gabumon',
	(to_date('15/11/2018','dd/mm/yyyy')),
	2,
	true,
	8
);

INSERT INTO animals (
	id,
	name,
	date_of_birth,
	escape_attempt,
	neutered,
	weight_kg
) 
VALUES (
	3,
	'Pikachu',
	(to_date('07/01/2021','dd/mm/yyyy')),
	1,
	false,
	15.04
);

INSERT INTO animals (
	id,
	name,
	date_of_birth,
	escape_attempt,
	neutered,
	weight_kg
) 
VALUES (
	4,
	'Devimon',
	(to_date('12/05/2017','dd/mm/yyyy')),
	5,
	true,
	11
);
INSERT INTO animals(
	id,
	name,
	date_of_birth,
	escape_attempt,
	neutered,
	weight_kg
	) 
	VALUES (
		5,
		'Charmander',
		(to_date('08/02/2020','dd/mm/yyyy')),
		0,
		false,
		11
	);
	INSERT INTO animals(
		id,
		name,
		date_of_birth,
		escape_attempt,
		neutered,
		weight_kg
		)
		VALUES (
			6,
			'Plantmon',
			(to_date('15/11/2022','dd/mm/yyyy')),
			2,
			true,
			5.7
		);

		INSERT INTO animals(
			id,
			name,
			date_of_birth,
			escape_attempt,
			neutered,
			weight_kg
		)
		VALUES (
			7,
			'Squirtle',
			(to_date('02/04/1993','dd/mm/yyyy')),
			3,
			false,
			12.13
		);

		INSERT INTO animals(
			id,
			name,
			date_of_birth,
			escape_attempt,
			neutered,
			weight_kg
			)
			VALUES (
				8,
				'Angemon',
				(to_date('12/06/2005','dd/mm/yyyy')),
				1,
				true,
				45
			);

			INSERT INTO animals(
				id,
				name,
				date_of_birth,
				escape_attempt,
				neutered,
				weight_kg
				) 
				VALUES (
					9,
					'Boarmon',
					(to_date('07/06/2005','dd/mm/yyyy')),
					7,
					true,
					20.4
				);

				INSERT INTO animals(
					id,
					name,
					date_of_birth,
					escape_attempt,
					neutered,
					weight_kg
					) 
					VALUES (
						10,
						'Blossom',
						(to_date('13/10/1998','dd/mm/yyyy')),
						3,
						true,
						17
					);
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith' , 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

BEGIN;
UPDATE animals
SET species_id = 2
WHERE animal_name LIKE '%mon';
UPDATE animals
SET species_id = 1
WHERE species_id is NULL;
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Agumon' AND owners.full_name = 'Sam Smith';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Pikachu' AND owners.full_name = 'Jennifer Orwell';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Gabumon' AND owners.full_name = 'Jennifer Orwell';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Devimon' AND owners.full_name = 'Bob';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Plantmon' AND owners.full_name = 'Bob';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Charmander' AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Squirtle' AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Blossom' AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Angemon' AND owners.full_name = 'Dean Winchester';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animal_name = 'Boarmon' AND owners.full_name = 'Dean Winchester';
COMMIT;