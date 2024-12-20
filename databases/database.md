# Introduction to Databases

Databases keep track of all your users’ data. It remembers that your login password is `CatLover1985` so you can sign into the website. The bottom layer of any web application is the database and it handles all the remembering for you.

It can be relatively simple, like an Excel spreadsheet, or incredibly complex and split into many giant pieces, like Facebook’s.

## SQL
Compared to a normal programming language like you’ve already learned, **SQL (Structured Query Language)**, which is used to query databases, has a very short syntax… with only a small handful of verbs to learn. What trips people up is that you need to be able to visualize in your head what it’s going to be doing.

The following content can be found in [How SQL can be used to organise and manage an overwhelming amount of data](https://launchschool.com/books/sql/read/introduction) and you can also take this [video](https://www.youtube.com/watch?v=z2kbsG8zsLM) as a reference.


SQL, which stands for **Structured Query Language**, is the programming language used to communicate with a relational database.

SQL can be pronounced as "Sequel" or as "Ess-Queue-Ell". Depends on how your colleagues call them.

SQL is a powerful language that uses simple English sentences that, with a few lines, allow you to **Select (find), Insert (add), Update (change), and Delete (remove)** a large amount of data.

SQL is a little different from other programming languages. SQL is a declarative language: when you write a SQL statement you describe **what** needs to be done, but not exactly how to do it -- the exact details of how the query is executed are handled internally by the RDBMS you are using.

### Why Learn SQL
SQL is everywhere. Firefox uses SQLite to keep track of the user's history and data, and banking systems might be using an Oracle database to store daily transactions.

We may encounter SQL in progeamming languages too. Ruby on Rails, for example, would generate SQL behind the scenes when running certain commands. Whichever language you're using, the database and its data will most likely out-live most of the application code.

A well-designed database is like the foundations of a house, and learning SQL and relational database concepts will help you build your applications on a strong foundation. Since databases are such a key part of almost all web applications, understanding the language of databases and how they work is a vital step towards becoming a well-rounded web-developer.

### Schema
The **setup information** for your database is stored in a special file called the “Schema” (after setting up the database) , and this is updated whenever you make changes to the structure of your database.

Think of the schema as saying “here’s our database and it’s got a couple tables. The first table is ‘users’ and it’s got columns for ‘ID’ (which is an integer), ‘name’ (which is a bunch of characters), ‘email’ (which is a bunch of characters) …”

### SQL Statements 
Like SELECT, CREATE TABLE, UPDATE, DELETE and more.

To set up the database: `CREATE DATABASE`.

To set up an individual table: `CREATE TABLE`.

- **What is Index Good for**:
To only allow unique values in a particular column (e.g. for usernames) in your database or to index a column for faster searching later: `CREATE INDEX`. It creates indexes in columns that you’ll likely be using to search on later (like username)… it will make your database much faster.

Use `;` at the end of each SQL code line.

Once your database is set up and you’ve got empty tables to work with, you use SQL’s statements to start populating it. The main actions you want to do are CRUD (which we’ve seen before) – Create, Read, Update, and Destroy.

“Create” queries use `INSERT INTO` and you’ll need to specify which columns to insert stuff into and then which values to put in those columns, which looks something like `INSERT INTO users (name, email) VALUES ('foobar','foo@bar.com');`. This is one of the few queries that you don’t need to be careful about which rows you’ve selected since you’re actually just adding new ones into the table.

### SQL Clauses 
Like WHERE, LIKE, DISTINCT and more.

#### WHERE

If we wanted to grab all of the rows that correspond to humans, we would type

`SELECT * FROM family_members WHERE species = 'human';`

Note that the quotes have to be around the word human, as it is an explicit value, unlike a keyword such as WHERE.

SQL accepts various inequality symbols, including:

- `=`: "equal to"

- `>`: "greater than"

- `<`: "less than"

- `>=`: "greater than or equal to"

- `<=`: "less than or equal to"

#### AND

In the `WHERE` part of a query, you can search for multiple attributes by using the `AND` keyword. 

For example, if you wanted to find the friends of Pickles that are over 25cm in height and are cats, you would run:

`SELECT * FROM friends_of_pickles WHERE height_cm > 25 AND species = 'cat';`

#### IN

Using the WHERE clause, we can find rows where a value is in a list of several possible values.

`SELECT * FROM friends_of_pickles WHERE species IN ('cat', 'human');` would return the friends_of_pickles that are either a cat or a human.

To find rows that are not in a list, you use `NOT IN` instead of IN.

#### DISTINCT

By putting `DISTINCT` after `SELECT`, you do not return duplicates.

For example, if you run
`SELECT DISTINCT gender, species FROM friends_of_pickles WHERE height_cm < 100;`, you will get the gender/species combinations of the animals less than 100cm in height.

Note that even though there are multiple male dogs under that height, we only see one row that returns "male" and "dog".

#### ORDER BY

If you want to sort the rows by some kind of attribute, you can use the `ORDER BY` keyword. 

For example, if you want to sort the friends_of_pickles by name, you would run: `SELECT * FROM friends_of_pickles ORDER BY name;`. That returns the names in ascending alphabetical order.

In order to put the names in descending order, you would add a `DESC` at the end of the query.

`SELECT * FROM friends_of_pickles ORDER BY height_cm DESC;`

#### LIMIT

Often, tables contain millions of rows, and it can take a while to grab everything. If we just want to see a few examples of the data in a table, we can select the first few rows with the `LIMIT` keyword. If you use `ORDER BY`, you would get the first rows for that order.

`SELECT * FROM friends_of_pickles ORDER BY height_cm LIMIT;`

If you wanted to see the two shortest friends_of_pickles, you would run: `SELECT * FROM friends_of_pickles ORDER BY height_cm LIMIT 2;`

Note:
- Some variants of SQL do not use the `LIMIT` keyword.
- The `LIMIT` keyword comes after the `DESC` keyword.
`SELECT * FROM friends_of_pickles ORDER BY height_cm DESC LIMIT 2;`

#### CRUD with Clauses
Every CRUDdy command in SQL contains a few parts – the action (`statement`), the table it should run on, and the conditions (`clauses`). If you just do an action on a table without specifying conditions, it will apply to the whole database and you’ll probably break something.

For “Destroy” queries, the classic mistake is typing `DELETE FROM users` **without** a WHERE clause, which removes all your users from the table. You probably needed to delete just one user, who you would specify based on some (hopefully unique) attribute like “name” or “id” as part of your condition clause, e.g. `DELETE FROM users WHERE users.id = 1`. You can do all kinds of common sense things, such as using comparison operators (>, <, <= etc.) to specify groups of rows to run commands on, or logical operators (AND, OR, NOT etc.) to chain multiple clauses together, e.g. `DELETE FROM users WHERE id > 12 AND name = 'foo'`.

“Update” queries use `UPDATE` and you’ll need to tell it what data to `SET` (using key=”value” pairs) and which rows to do those updates for. Be careful because if your `WHERE` clause finds multiple rows (e.g. if you’ve searched based on a common first name), they’ll all get updated. A standard query for updating a user’s email may look something like the following (though in the real world you’d search on ID because it’s always unique):

```SQL
UPDATE users
SET name='barfoo', email='bar@foo.com'
WHERE email='foo@bar.com';
```

“Read” queries, which use `SELECT`, are the most common, e.g. `SELECT * FROM users WHERE created_at < '2013-12-11 15:35:59 -0800'`. The * you see just says “all the columns”. Specify a column using both the **table name** and the **column name**. You can get away with just the column name for queries of one table, but as soon as there is more than one table involved, SQL will yell at you so just always specify the table name: `SELECT users.id, users.name FROM users`.

A close cousin of `SELECT`, for if you only want unique values of a column, is `SELECT DISTINCT`. Say you want a list of all the different names of your users without any duplicates… try `SELECT DISTINCT users.name FROM users`.

#### JOIN Command

Different parts of information can be stored in different tables, and in order to put them together, we use `INNER JOIN ... ON`. Joining tables gets to the core of SQL functionality, but it can get very complicated. 

If you want to get all the posts created by a given user, you need to tell SQL which columns it should use to zip the tables together with the `ON` clause. Perform the “zipping” with the `JOIN` command. 

In relational databases, most of the time there are matching keys in different table, liking using `id` and `character_id` in tables of `character` and `character_tv_show`:

```Bash
-- Table - character
-- id	name
-- 1	Doogie Howser
-- 2	Barney Stinson
-- 3	Lily Aldrin
-- 4	Willow Rosenberg

-- Table - character_tv_show
-- id	character_id	tv_show_name
-- 1	4	Buffy the Vampire Slayer
-- 2	3	How I Met Your Mother
-- 3	2	How I Met Your Mother
-- 4	1	Doogie Howser, M.D.
```

See that in `character_tv_show`, instead of storing both the character and TV show names (e.g. Willow Rosenberg and Buffy the Vampire Slayer), it stores the character_id as a substitute for the character name. This `character_id` refers to the matching `id` row from the character table.

This is done so data is not **duplicated**. For example, if the name of a character were to change, you would only have to change the name of the character in one row.

This allows us to "join" the tables together "on" that reference/common column.

To get each character name with his/her TV show name, we can write

```SQL
SELECT character.name, character_tv_show.tv_show_name
FROM character
INNER JOIN character_tv_show
ON character.id = character_tv_show.character_id;
```

This puts together every row in `character` with the corresponding row in `character_tv_show`, or vice versa.

**Note**:
- We use the syntax `table_name.column_name`. If we only used `column_name`, SQL might incorrectly assume which table it is coming from.
- The example query above is written over multiple lines for readability, but that does not affect the query.

---

If you mash two tables together where the data doesn’t perfectly match up (e.g. there are multiple posts for one user), which rows do you actually keep? Take the following two tables as example:

```Bash
id name       id  name
-- ----       --  ----
1  Pirate     1   Rutabaga
2  Monkey     2   Pirate
3  Ninja      3   Darth Vader
4  Spaghetti  4   Ninja
```


There are four different possibilities:

- **INNER JOIN**: Aka JOIN – Your best friend and 95% of what you’ll use. It produces only the set of records that match in both Table A and Table B.

Keeps only the rows from both tables where they match up. If you asked for all the posts for all users (`SELECT * FROM users JOIN posts ON users.id = posts.user_id`), it would return only the users who have actually written posts and only posts which have specified their author in the user_id column. If an author has written multiple posts, there will be multiple rows returned (but the columns containing the user data will just be repeated).

It can be seen as **A ∩ B**:

```SQL
SELECT * FROM TableA
INNER JOIN TableB
ON TableA.name = TableB.name
id  name       id   name



1   Pirate     2    Pirate

3   Ninja      4    Ninja
```

---

- **FULL OUTER JOIN**: Keep **all rows** from all tables, even if there are mismatches between them. Set any mismatched cells to NULL. It produces the set of all records in Table A and Table B, with matching records from both sides where available. If there is no match, the missing side will contain null.

It can be seen as **A ∪ B**:

```SQL
SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name
id    name       id    name



1     Pirate     2     Pirate

2     Monkey     null  null

3     Ninja      4     Ninja

4     Spaghetti  null  null

null  null       1     Rutabaga

null  null       3     Darth Vader
```

---

- **LEFT OUTER JOIN**: Keep all the rows from the left table and add on any rows from the right table which match up to the left table’s. Set any empty cells this produces to NULL. E.g. return all the users whether they have written posts or not. If they do have posts, list those posts as above. If not, set the columns we asked for from the “posts” table to NULL.

In short, it produces a complete set of records from Table A, with the matching records (where available) in Table B. If there is no match, the right side will contain null.

It can be seen as **A**:

```SQL
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name

id  name       id    name
--  ----       --    ----
1   Pirate     2     Pirate
2   Monkey     null  null
3   Ninja      4     Ninja
4   Spaghetti  null  null
```

---

- **RIGHT OUTER JOIN**: The opposite… keep all rows in the right table.

- **How to Get (A ∩ (!B))**: It is equal to getting the set of records only in A but not in B.

We can use a `LEFT OUTER JOIN` along with a `WHERE` clause:

```SQL
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableB.id IS null
id  name       id     name



2   Monkey     null   null

4   Spaghetti  null   null

```

---

- **How to Get (A ∩ (!B)) ∪ ((!A) ∩ B)**: To produce the set of records unique to Table A and Table B, we perform the same full outer join, then exclude the records we don't want from both sides via a where clause.

```SQL
SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableA.id IS null
OR TableB.id IS null
id    name       id    name



2     Monkey     null  null

4     Spaghetti  null  null

null  null       1     Rutabaga

null  null       3     Darth Vader
```

---

- **Another Example**:

```Bash
# Table 1 - Orders
OrderID	CustomerID	OrderDate

10308	2	1996-09-18
10309	37	1996-09-19
10310	77	1996-09-20

# Table 2 - Customers
CustomerID	CustomerName	ContactName	Country

1	Alfreds Futterkiste	Maria Anders	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mexico
```

Use the following SQL commands:

```SQL
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
```

It will output:
```Bash
OrderID	CustomerName	OrderDate

10308	Ana Trujillo Emparedados y helados	9/18/1996
```

### SQL Functions 
Like `AVG`, `COUNT`, `SUM` and more.

Sometimes you want to just return a single relevant value that aggregates a column, like the `COUNT` of posts a user has written. Use one of the helpful “aggregate” functions offered by SQL to do that. Include the function as a part of the SELECT statement, like `SELECT MAX(users.age) FROM users`.

The function will operate on just a single column unless you specify *, which only works for some functions like COUNT (because you can not use `MAX` on the column of “name”?).

#### COUNT

- **COUNT(*)**: We can check the number of rows in a table by using the `COUNT` function.

For example, if we are querying a table states_of_us, we'd expect 50 rows, or 500 rows in a table called fortune_500_companies.

`SELECT COUNT(*) FROM friends_of_pickles;` would return the total number of rows in the table friends_of_pickles. 

- **COUNT(*)...WHERE**: 

We can combine `COUNT(*)` with `WHERE` to return the number of rows that matches the `WHERE` clause.

For example, `SELECT COUNT(*) FROM friends_of_pickles WHERE species = 'human';` returns the numbers of friends of pickles that are humans.

#### SUM

We can use the `SUM` keyword in order to find the sum of a given value.

For example, running `SELECT SUM(num_legs) FROM family_members;` returns the total number of legs in the family.

#### AVG

We can use the `AVG` keyword in order to find the average of a given value.

For example, running `SELECT AVG(num_legs) FROM family_members;` returns the average number of legs of each family member.

However, because of the way computers handle numbers, averages will not always be completely exact.

#### MAX and MIN:

We can use the `MAX` and `MIN` to find the maximum or minimum value of a table.

To find the least number of legs in a family member, you can run `SELECT MIN(num_legs) FROM family_members;`

#### Alias
We can use aliases (`AS`) to rename columns or aggregate functions so you can call them by that alias later, e.g. `SELECT MAX(users.age) AS highest_age FROM users` will return a column called highest_age with the maximum age in it.


#### Use Function with GROUP BY Clause

When you `GROUP BY` something, you split the table into different piles based on the value of each row.

For example, `SELECT COUNT(*), species FROM friends_of_pickles GROUP BY species;` would return the number of rows for each species.

When you want to use aggregate functions like `COUNT` on very specific chunks of your data and then group them together, e.g. displaying the `COUNT` of posts for EACH user (as opposed to the count of all posts by all users). The commands would look like:

```SQL
SELECT users.id, users.name, COUNT(posts.id) AS posts_written
FROM users
JOIN posts ON users.id = posts.user_id
GROUP BY users.id, users.name;
```

Grouping by `users.name` in addition to `users.id` improves clarity and aligns with best practices by explicitly including all selected non-aggregated columns in the GROUP BY clause, though it might not be strictly necessary for most databases.

#### HAVING

If you want to only display a subset of your data. In a normal situation, you’d use a `WHERE` clause to narrow it down. 

But if you’ve used an aggregate function like `COUNT` (say to get the count of posts written for each user in the example above), `WHERE` won’t work anymore. 

So to conditionally retrieve records based on aggregate functions, you use the `HAVING` function, **which is essentially the `WHERE` for aggregates**. So say you only want to display users who have written more than 10 posts:

```SQL
SELECT users.id, users.name, COUNT(posts.id) AS posts_written
FROM users
JOIN posts ON users.id = posts.user_id
GROUP BY users.id, users.name
HAVING COUNT(posts.id) >= 10;
```

In this [practice website](https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_groupby), we can use `HAVING` to get the number of orders in each country when it is greater than 100:

```SQL
SELECT COUNT(CustomerID) AS UserAmount, Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 10;
```

#### Nested Queries

In SQL, you can put a SQL query inside another SQL query.

For example, to find the family members with the least number of legs,
you can run:

`SELECT * FROM family_members WHERE num_legs = (SELECT MIN(num_legs) FROM family_members);`

The `SELECT` query inside the parentheses is executed first, and returns the minimum number of legs. Then, that value (2) is used in the outside query, to find all family members that have 2 legs.

#### NULL

Sometimes, in a given row, there is no value at all for a given column. For example, a dog does not have a favorite book, so in that case there is no point in putting a value in the favorite_book column, and the value is `NULL`. In order to find the rows where the value for a column is or is not `NULL`, you would use `IS NULL` or `IS NOT NULL`.

#### Date

Sometimes, a column can contain a date value. The first 4 digits represents the year, the next 2 digits represents the month, and the next 2 digits represents the day of the month. For example, `1985-07-20` would mean July 20, 1985.

You can compare dates by using `<` and `>`. For example, `SELECT * FROM celebs_born WHERE birthdate < '1985-08-17';` returns a list of celebrities that were born before August 17th, 1985.

### SQL is Fast

Learning this stuff is particularly relevant because it’s MUCH faster for you to build queries that use SQL intelligently than to just grab a whole bunch of data out of your database and then use a programming language (like Ruby or JavaScript) to process it. 

For instance, if you want all the unique names of your users, you COULD just grab the whole list from your database using SQL like `SELECT users.name FROM users` then use a JavaScript/Ruby method to remove duplicates… but that requires you to pull all that data out of your database and then put it into memory and then iterate through it in your code. 

**Use `SELECT DISTINCT` users.name FROM users instead to have SQL do it all in one step.**

SQL is built to be **fast**. It has a special query optimizer which takes a look at the whole query you’re about to run and it figures out exactly which tables it needs to join together and how it can most quickly execute the query. 

The difference between using `SELECT` and `SELECT DISTINCT` is negligible compared to the time cost of doing it yourself.

Learning your SQL will help you write better queries that can do more which will make your app much faster.

## The Importance of Data
As human beings, we are limited in our capacity to remember things. Having tools that allow immediate access and analysis of data enables us to make better decisions.

We need to structure the data after collecting them so we can organize and study it to find patterns and meaning.

## Structured Data
Unstructure data, which contains information but without any structure, has limitations.

An example of unstructured data, is a note:

```Bash
Alice agreed to help with project. She scheduled a meeting on Dec 18th at 2:30pm. Her email is in the invite
```

Once the amount of data grows, it becomes unwieldy. For example, if you want to find a particular note, you may need to look through the entire book to find it. 

```Bash
# Inconsistencies in names
- EArts
- Electronic Arts
- EA
# It causes chaos
```

So we need a way of organising, or structuring, your data. One way to structure data is to store it in **tabular** format (rows and columns), such as in spreadsheets or todo lists.

```Bash
name | email | Meeting Time
John | joe@example.com | 12/12/2014 1:30PM
Alice | alice@example.com | 12/18/2014 2:30PM
```

Storing data in a structured way, such as in a table or a spreadsheet, allows us to find the data easily and also to manage it better. The data can be arranged and analyzed in various ways such as sorting alphabetically or totalling a set of values.

A common way of storing data in a structured manner is to use a **relational database**.

## Database
A basic definition of a database is simply **a structured set of data held in a computer**.

### Spreadsheet as Database
The spreadsheet as a whole can be thought of as a database, and the worksheets within the spreadsheet can be used to describe tables within a database. A table contains rows and columns. Each row contains data for one individual. Each column contains data of one specific kind for all of the individuals.

The rows and columns within a worksheet can be seen as analogous to the rows and columns in a table. Each row represents a single set of related data, while the columns represent a standardized way to store data for that particular attribute.

An anology:
```Bash
Spreadsheet | Database
Worksheet | Table
Worksheet Column | Table Column
Worksheet Row | Table Row
```
### Primary Key and Foreign Key
Keys are one of the most important elements in a relational database to maintain the relationship between the tables and it also helps in uniquely identifying the data from a table. 

The primary key is a key that helps uniquely identify the tuple of the database. For example, student ID.

In contrast, the Foreign Key is a key used to determine the relationship between the tables through the primary key of one table that is the primary key of one table acts as a foreign key to another table. One example is the Game Store Database in the following section.

### Relational Database Management Systems
After sharing and adding information to the spreadsheet, with the amount of information increases, we will encounter issues with **duplicate data**, **typos**, perhaps even **formatting** issues. 

The simple spreadsheet now becomes unwieldy and finding/collecting information requires a lot of effort in scrolling and searching. At this point, you would probably benefit from moving to a **relational database management system**.

**A relational database model defines a set of relations (which we can think of as analogous to tables) and describes the relationships, or connections, between them in order to determine how the data stored in them can interact**. 

A relational database often consists of multiple related tables. Using the relational model elevates our database from data that is represented in just a flat, two-dimensional table, to one where we can describe the data in a more complex and detailed way. Using a relational database helps us to cut down on duplicated data and provides a much more useful data structure for us to interact with.

```Bash
# For example 
# Database: Game Store 

## Table 1 - Video Games
| Column        | Description                                |
|---------------|--------------------------------------------|
| `ID`          | Unique identifier for each video game.    |
| `Title`       | Name of the video game.                   |
| `Price`       | Price of the video game.                  |
| `PublisherID` | References a publisher in the Publishers table. |
| `PlatformID`  | References a platform in the Platforms table.   |

### `PublisherID` and `PlatformID` are foreign keys.

## Table 2 - Publishers
| Column   | Description                       |
|----------|-----------------------------------|
| `ID`     | Unique identifier for each publisher. |
| `Title`  | Name of the publisher.           |
| `URL`    | Official website of the publisher. |

## Table 3 - Platforms
| Column   | Description                       |
|----------|-----------------------------------|
| `ID`     | Unique identifier for each platform. |
| `Title`  | Name of the gaming platform.      |
```

A relational database management system, or RDBMS, is essentially a software application, or system, for managing relational databases. An RDBMS allows a user, or another application, to interact with a database by issuing commands using syntax that conforms to a certain set of conventions or standards.

There are many relational database management systems such as SQLite, MS SQL, PostgreSQL and MySQL. Some are lightweight, easy to install and use, while others are robust, scalable, but are complex to install. These various RDBMSes may vary in certain ways, and some of the commands they use may have slight syntactical differences. One thing they have in common however is the underlying language they all use: SQL.

But the relational model is not the only structured data model. A program like MongoDB, for example, uses a document-oriented data storage model. This, and other systems using non-relational data storage and retrieval models, are often grouped under the term 'NoSQL'. 