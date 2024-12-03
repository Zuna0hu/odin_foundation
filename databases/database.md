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