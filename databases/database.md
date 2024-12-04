# Introduction to Databases

Databases keep track of all your users’ data. It remembers that your login password is `CatLover1985` so you can sign into the website. The bottom layer of any web application is the database and it handles all the remembering for you.

It can be relatively simple, like an Excel spreadsheet, or incredibly complex and split into many giant pieces, like Facebook’s.

## SQL
Compared to a normal programming language like you’ve already learned, **SQL (Structured Query Language)**, which is used to query databases, has a very short syntax… with only a small handful of verbs to learn. What trips people up is that you need to be able to visualize in your head what it’s going to be doing.

The following content can be found in [How SQL can be used to organise and manage an overwhelming amount of data] (https://launchschool.com/books/sql/read/introduction) and you can also take this [video] (https://www.youtube.com/watch?v=z2kbsG8zsLM) as a reference.


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

To only allow unique values in a particular column (e.g. for usernames) in your database or to index a column for faster searching later: `CREATE INDEX`. It creates indexes in columns that you’ll likely be using to search on later (like username)… it will make your database much faster.

Use `;` at the end of each SQL code line.

Once your database is set up and you’ve got empty tables to work with, you use SQL’s statements to start populating it. The main actions you want to do are CRUD (which we’ve seen before) – Create, Read, Update, and Destroy.

“Create” queries use `INSERT INTO` and you’ll need to specify which columns to insert stuff into and then which values to put in those columns, which looks something like `INSERT INTO users (name, email) VALUES ('foobar','foo@bar.com');`. This is one of the few queries that you don’t need to be careful about which rows you’ve selected since you’re actually just adding new ones into the table.

### SQL Clauses 
Like WHERE, LIKE, DISTINCT and more.

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
If you want to get all the posts created by a given user, you need to tell SQL which columns it should use to zip the tables together with the `ON` clause. Perform the “zipping” with the `JOIN` command. 

If you mash two tables together where the data doesn’t perfectly match up (e.g. there are multiple posts for one user), which rows do you actually keep? 

Take the following two tables as example:

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
Like AVG, COUNT, SUM and more.

### SQL Indexes 
What they are good for.

### Difference Between WHERE and HAVING


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