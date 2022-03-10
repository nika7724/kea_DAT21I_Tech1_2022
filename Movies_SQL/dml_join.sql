-- Get the directors for the movie id 1
-- Get Both the director names and the movie title and year

SELECT name, title, year
FROM directors JOIN movies m ON directors.movie_id = m.id
ORDER BY name
;