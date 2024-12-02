# Introduction to Databases

Databases keep track of all your users’ data. It remembers that your login password is `CatLover1985` so you can sign into the website. The bottom layer of any web application is the database and it handles all the remembering for you.

It can be relatively simple, like an Excel spreadsheet, or incredibly complex and split into many giant pieces, like Facebook’s.

## SQL
Compared to a normal programming language like you’ve already learned, **SQL (Structured Query Language)**, which is used to query databases, has a very short syntax… with only a small handful of verbs to learn. What trips people up is that you need to be able to visualize in your head what it’s going to be doing.

The following content can be found in [How SQL can be used to organise and manage an overwhelming amount of data] (https://launchschool.com/books/sql/read/introduction)

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

So we need a way of organising, or structuring, your data. One way to structure data is to store it in **tabular** format (rows and columns), such as in spreadsheets or todo lists.

```Bash
name | email | Meeting Time
John | joe@example.com | 12/12/2014 1:30PM
Alice | alice@example.com | 12/18/2014 2:30PM
```

Storing data in a structured way, such as in a table or a spreadsheet, allows us to find the data easily and also to manage it better. The data can be arranged and analyzed in various ways such as sorting alphabetically or totalling a set of values.

A common way of storing data in a structured manner is to use a **relational database**.

## Database
A basic definition of a database is simply 'a structured set of data held in a computer'.

### Spreadsheet as Database