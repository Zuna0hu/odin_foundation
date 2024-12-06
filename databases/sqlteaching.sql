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