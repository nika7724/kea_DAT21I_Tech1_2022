SHOW TABLES;

# Rules for casting
# how does A_I work?

-- TODO Define a primary key in movies
CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY, -- IF THERE ARE MANY MOVIES, THEN YOU CAN USE BEGINT
    title VARCHAR(255) NOT NULL,
    year  YEAR
);

#TODO Create a foreign key on direcotors that points to movies

#Todo create directors
CREATE TABLE IF NOT EXISTS directors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    movie_id int,
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

ALTER TABLE movies
    ADD COLUMN year YEAR NOT NULL AFTER title;

DESC movies;
show tables;

ALTER TABLE movies
    DROP COLUMN year;
DESC movies;

ALTER TABLE movies
    ADD COLUMN year YEAR NOT NULL AFTER title;
show tables;
DESC movies;

ALTER TABLE movies
    MODIFY year INT(4);
DESC movies;



