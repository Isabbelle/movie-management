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

#create move table
CREATE TABLE movies_tbl(
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    release_year int, 
    director_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (director_id) REFERENCES directors_tbl(id)
);