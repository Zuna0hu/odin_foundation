-- https://www.sqlteaching.com/

-- Table 1 - family_members
-- id	name	gender	species	num_books_read
-- 1	Dave	male	human	200
-- 2	Mary	female	human	180
-- 3	Pickles	male	dog	0

-- Table 2 - friends_of_pickles
-- id	name	gender	species	height_cm
-- 1	Dave	male	human	180
-- 2	Mary	female	human	160
-- 3	Fry	male	cat	30
-- 4	Leela	female	cat	25
-- 5	Odie	male	dog	40
-- 6	Jumpy	male	dog	35
-- 7	Sneakers	male	dog	55

-- Table 3 - celebs_born
-- id	name	birthdate
-- 1	Michael Jordan	1963-02-17
-- 2	Justin Timberlake	1981-01-31
-- 3	Taylor Swift	1989-12-13

-- Table 4 - character
-- id	name
-- 1	Doogie Howser
-- 2	Barney Stinson
-- 3	Lily Aldrin
-- 4	Willow Rosenberg

-- Table 5 - character_tv_show
-- id	character_id	tv_show_name
-- 1	4	Buffy the Vampire Slayer
-- 2	3	How I Met Your Mother
-- 3	2	How I Met Your Mother
-- 4	1	Doogie Howser, M.D.

-- Table 6 - character_actor
-- id	character_id	actor_name
-- 1	4	Alyson Hannigan
-- 2	3	Alyson Hannigan
-- 3	2	Neil Patrick Harris
-- 4	1	Neil Patrick Harris

-- Table 7 - tv_show
-- id	name
-- 1	Buffy the Vampire Slayer
-- 2	How I Met Your Mother
-- 3	Doogie Howser, M.D.

-- Table 8 - new_character_tv_show
-- id	character_id	tv_show_id
-- 1	1	3
-- 2	2	2
-- 3	3	2
-- 4	4	1

-- Table 9 - actor
-- id	name
-- 1	Alyson Hannigan
-- 2	Neil Patrick Harris

-- Table 10 - new_character_actor
-- id	character_id	actor_id
-- 1	1	2
-- 2	2	2
-- 3	3	1
-- 4	4	1

-- return all rows in family_members where num_books_read is a value greater or equal to 180?
SELECT * FROM family_members WHERE num_books_read >= 180;
-- SELECT * means to select all columns

-- return all rows in family_members where num_books_read is a value equal to 180?
SELECT * FROM family_members WHERE num_books_read = 180; 
-- not ==

-- find all of Pickles' friends that are dogs and under the height of 45cm
SELECT * FROM friends_of_pickles WHERE species='dog' AND height_cm < 45;

-- find all of Pickles' friends that are dogs or under the height of 45cm
SELECT * FROM friends_of_pickles WHERE species='dog' OR height_cm < 45;

-- Using the WHERE clause, we can find rows where a value is in a list of several possible values.
SELECT * FROM friends_of_pickles WHERE species IN ('cat', 'human'); 
-- would return the friends_of_pickles that are either a cat or a human.

-- To find rows that are not in a list, you use NOT IN instead of IN.
-- return the rows that are not cats or dogs
SELECT * FROM friends_of_pickles WHERE species NOT IN ('cat', 'dog');

-- By putting DISTINCT after SELECT, you do not return duplicates.
-- For example, if you run
SELECT DISTINCT gender, species FROM friends_of_pickles WHERE height_cm < 100;
-- you will get the gender/species combinations of the animals less than 100cm in height.

-- return a list of the distinct species of animals greater than 50cm in height
SELECT DISTINCT species FROM friends_of_pickles WHERE height_cm > 50;
-- this only selects the species column

-- sorts the friends_of_pickles by height_cm in descending order
SELECT * FROM friends_of_pickles ORDER BY height_cm DESC;

-- return the single row (and all columns) of the tallest friends_of_pickles?
SELECT * FROM friends_of_pickles ORDER BY height_cm DESC LIMIT 1;

-- returns the total number of rows in the table friends_of_pickles
SELECT COUNT(*) FROM friends_of_pickles;

-- return the number of rows in friends_of_pickles where the species is a dog
SELECT COUNT(*) FROM friends_of_pickles WHERE species = 'dog';

-- the total num_books_read made by this family
SELECT SUM(num_books_read) FROM family_members;

-- find the average num_books_read made by each family member
SELECT AVG(num_books_read) FROM family_members;

-- the highest num_books_read that a family member makes
SELECT MAX(num_books_read) FROM family_members;

-- return the tallest height for each species with the species name next to the height
SELECT MAX(height_cm), species FROM friends_of_pickles GROUP BY species;

-- return the family members that have the highest num_books_read
SELECT * FROM family_members WHERE num_books_read = (SELECT MAX(num_books_read) FROM family_members);

-- return all of the rows of family_members where favorite_book is not null?
SELECT * FROM family_members WHERE favorite_book IS NOT NULL;

-- return a list of celebrities that were born after September 1st, 1980
SELECT * FROM celebs_born WHERE birthdate > '1980-09-01';

-- use an inner join to pair each character name with the actor who plays them
SELECT  character.name, character_actor.actor_name
FROM character
INNER JOIN character_actor
ON character.id = character_actor.character_id;

