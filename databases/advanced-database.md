# Some Advanced Knowledge and Concepts in Database and SQL

Here I will introduce some of the more complicated and useful concepts in database and SQL.


## Multilple JOIN

Where there are more than two table than you need to `JOIN` together, it is a good practice to use multiple lines of `JOIN` commands.

For example:

We have a `character` table:

```Bash
character
id	name
1	Doogie Howser
2	Barney Stinson
3	Lily Aldrin
4	Willow Rosenberg
```

And we have a `actor` table:

```Bash
actor
id	name
1	Alyson Hannigan
2	Neil Patrick Harris
```

A `character_actor` table kind of functioning as a medium. The purpose of using only IDs, instead of the actual name values, in the character_actor table is to follow the principles of database normalization that enhance efficiency, consistency, and maintainability.

```Bash
character_actor
id	character_id	actor_id
1	1	2
2	2	2
3	3	1
4	4	1
```

To `join` the three tables together, we can use the multiple join command:

```SQL
SELECT character.name, actor.name 
FROM character
INNER JOIN character_actor
ON character.id = character_actor.character_id
INNER JOIN actor
ON character_actor.actor_id = actor.id;
```

Usually we would need to `JOIN` the first table with the medium table first, so the other table can be joined through the foreign keys in the medium table. 

### Many-to-Many Relationships
A single actor can play many characters, and a single character can theoretically be played by many actors, in case of remakes, for example. Therefore, it is a many-to-many relationship, and direct linking between `character` and `actor` is not always possible. The medium table provides the required mapping.

You cannot directly link the `character` and `actor` tables because there's no direct relationship between them in the schema.

The `character_actor` table bridges this gap:
`character_actor.character_id` is a foreign key referencing `character.id`.
`character_actor.actor_id` is a foreign key referencing `actor.id`.


