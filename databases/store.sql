CREATE TABLE store (id INTEGER PRIMARY KEY, name TEXT, brand TEXT, price INTEGER, country TEXT);

-- insert into table
INSERT INTO store VALUES
(1, "shoe", "Nike", 200, "America"),
(2, "shoe", "Abibas", 20, "America"),
(3, "pants", "Neki", 50, "America"),
(4, "sunglasses", "Abadi", 10, "Mexico"),
(5, "water bottle", "Cheap", 5, "Peru"),
(6, "shoe", "OldBalance", 200, "Canada"),
(7, "coat", "CanadianDuck", 20, "Canada"),
(8, "pants", "Kuzi", 500, "China"),
(9, "underwear", "Yabai", 10, "Japan"),
(10, "underwear", "Igeboya", 10, "Korea"),
(11, "shoe", "Noname", 60, "Britain"),
(12, "shoe", "Chaussures", 2, "France"),
(13, "pants", "Pantalon", 50, "France"),
(14, "sunglasses", "Attends", 10, "Canada"),
(15, "water bottle", "Bouteille", 50, "Canada");

-- show data (select all the columns)
SELECT * FROM store;

-- show data by price
SELECT * FROM store ORDER BY price;

-- show items more expensive than 20
SELECT * FROM store WHERE price > 20 ORDER BY country;

-- select id and name columns, show maximum price
SELECT id, name, MAX(price) FROM store;

-- show maximum price grouped by country
SELECT country, AVG(price) FROM store GROUP BY country;