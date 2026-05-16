
-- Single Table Lab Sheet

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE, death DATE);

. schema
. table

INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
('Fang','Benny','dog','m',4,'2000-08-27',NULL),
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
('Slim','Benny','snake','m',5,'2001-04-29',NULL);

-- Q1.1
-- The names of owners and their pet's name for all pets who are female. 
SELECT owner,name FROM pet where sex='f';

-- Q1.2
-- The names and birth dates of pets which are dogs.
SELECT name, birth FROM pet where species='dog';

-- Q1.3
-- The names of the owners of birds.
SELECT DISTINCT owner FROM pet WHERE species='bird';

-- Q1.4
-- The species of pets who are female.
SELECT species FROM pet WHERE sex='f';

-- Q1.5
-- The names and birth dates of pets which are cats or birds
SELECT name, birth FROM pet WHERE species IN ('cat', 'bird');

-- Q1.6
-- The names and species of pets which are cats or birds and which are female
SELECT name, species FROM pet where sex='f' AND species IN ('cat', 'bird');


-- Q2.1
-- The names of owners and their pets where the pet's name ends with “er” or “all”
SELECT owner, name FROM pet WHERE name LIKE '%er' OR name LIKE '%all';

-- Q2.2
-- The names of any pets whose owner's name contains an "e"
SELECT name FROM pet WHERE owner LIKE '%e%';

-- Q2-3
-- The names of all pets whose name does not end with "fy"
SELECT name FROM pet WHERE name NOT LIKE '%fy';

-- Q2-4
-- All pet names whose owners name is only four characters long
SELECT name FROM pet WHERE owner LIKE '____';

-- Q2-5
-- All owners whose names begin and end with one of the first five letters of the alphabet
SELECT DISTINCT owner FROM pet WHERE owner GLOB '[A-Ea-e]*[a-e]';

-- Q2-6
-- Repeat the previous query, but make the query sensitive to the case of letters of the alphabet the characters in the name
SELECT DISTINCT owner FROM pet WHERE owner GLOB '[A-E]*[a-e]';

-- Q3-1 
-- The average number of check-ups that each owner has made with their pets 
SELECT owner, AVG(checkups) AS average_checkups FROM pet GROUP BY owner;

-- Q3-2
-- The number of pets of each species in ascending order
SELECT species, COUNT(*) AS number_of_pets FROM pet GROUP BY species ORDER BY number_of_pets ASC;

-- Q3-3
-- The number of pets of each species that each owner has
SELECT species, owner, COUNT(*) AS number_of_pets FROM pet GROUP BY owner, species ORDER BY number_of_pets ASC;

-- Q3-4
-- The number of distinct species of pet each owner has
SELECT owner, COUNT(DISTINCT species) AS num_type_pets FROM pet GROUP BY owner;

-- Q3-5
-- The number of pets of each gender there are in the database, where the gender is known
SELECT sex, COUNT(*) AS num_sex FROM pet WHERE sex <> '' GROUP BY sex;

-- Q3-6
-- The number of birds each owner has
SELECT COUNT(species) AS num_birds, owner FROM pet WHERE species='bird' GROUP BY owner;

-- Q3-7 
-- The total number of check-ups each owner has made with all their pets
SELECT SUM(checkups) AS num_checkups, owner FROM pet GROUP BY owner;
