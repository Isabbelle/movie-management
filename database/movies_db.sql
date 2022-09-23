# Create a new database

CREATE DATABASE movie_db;

# Shoe all databases

SHOW DATABASES;

# Use our new database
USE movie_db;

#show existing tables 
SHOW TABLES;

#create table directors

CREATE TABLE directors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    PRIMARY KEY (id)
);

#dont forget the semicolon at the end of every command

#get info about the table 
#DESCRIBE <Table_name>
DESCRIBE directors_tbl;

#add a new entry to the table
INSERT INTO directors_tbl VALUES(
       null,
       "James Cameron",
       1954
);

#show all data from table
SELECT
from
<WHERE>

SELECT * FROM directors_tbl;

#create movie table
CREATE TABLE movies_tbl(
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    release_year int, 
    director_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (director_id) REFERENCES directors_tbl(id)
);

# selecting from multipl tables
SELECT *
FROM movies_tbl, directors_tbl
WHERE movies_tbl.title LIKE "Inception";

#selecting from multiple tables


#add new movie in Movie table
INSERT INTO movies_tbl VALUES(
    null, 
    "Inception",
    2010,
    (SELECT id FROM directors_tbl WHERE name like "C")
);

INSERT INTO directors_tbl VALUES(
       null,
       "Chloe Zhaos",
       1982
);

INSERT INTO movies_tbl VALUES(
    null, 
    "Terminator",
    1984,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);
INSERT INTO movies_tbl VALUES(
    null, 
    "The Dark Knight",
    2008,
    (SELECT id FROM directors_tbl WHERE name like "Cristopher Nolan")
);

INSERT INTO movies_tbl VALUES(
    null, 
   "Eternals",
    2021,
    (SELECT id FROM directors_tbl WHERE name like "Chloe Zhaos")
);

#create table for the actors
CREATE TABLE main_actors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    sex varchar(1),
    PRIMARY KEY (ID)
);

INSERT INTO main_actors_tbl VALUES (null, "Arnold Schwarzenegger", 1947, "M");
INSERT INTO main_actors_tbl VALUES (null, "Gal GAdot", 1985, "F");
INSERT INTO main_actors_tbl VALUES (null, "Sigourney Weaver", 1949, "F");
INSERT INTO main_actors_tbl VALUES (null, "Christian Bale", 1974, "M");
INSERT INTO main_actors_tbl VALUES (null, "Leonardo DiCaprio", 1974, "M");
INSERT INTO main_actors_tbl VALUES (null, "Angelina Jolie", 1975, "F");
INSERT INTO main_actors_tbl VALUES (null, "Zoe Saldana", 1978, "F");
INSERT INTO main_actors_tbl VALUES (null, "Gemma Chan", 1947, "F");


# create movieactors table
CREATE TABLE movie_actors_tbl(
    movie_id int NOT NULL,
    main_actor_id int NOT NULL,
    PRIMARY KEY (movie_id, main_actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies_tbl(id),
    FOREIGN KEY (main_actor_id) REFERENCES main_actors_tbl(id)
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id from movies_tbl WHERE title LIKE "Avatar"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Zoe Saldana")
);

SELECT * movies_tbl.title, main_actors_tbl.name
FROM movies_tbl
  JOIN movie_actors_tbl ON movies_tbl.id = movie_actors_tbl.movie_id
  JOIN main_actors_tbl ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE movies_tbl.title LIKE "Avatar";

#homework data extract


