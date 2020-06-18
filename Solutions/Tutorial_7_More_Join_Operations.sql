/*Question 1*/
SELECT id, title
 FROM movie
 WHERE yr=1962

/*Question 2*/
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

/*Question 3*/
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

/*Question 4*/
SELECT id FROM actor 
WHERE name = 'Glenn Close' 

/*Question 5*/
SELECT id FROM movie 
WHERE title = 'Casablanca' 

/*Question 6*/
SELECT name FROM casting 
JOIN actor ON actorid = id
WHERE movieid = '11768'

/*Question 7*/
SELECT name FROM casting 
JOIN actor ON actorid = id
WHERE movieid = (SELECT id FROM movie 
WHERE title = 'ALIEN')

/*Question 8*/
SELECT title FROM movie 
JOIN casting ON id = movieid
WHERE actorid = (SELECT id FROM actor 
WHERE name = 'Harrison Ford')

/*Question 9*/
SELECT title FROM movie 
JOIN casting ON id = movieid
WHERE actorid = (SELECT id FROM actor 
WHERE name = 'Harrison Ford') AND ord != 1

/*Question 10*/
SELECT title, name FROM movie 
JOIN casting ON id = movieid JOIN actor ON actorid = actor.id 
WHERE yr = 1962 AND ord = 1

/*Question 11*/
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

/*Question 12*/
SELECT title, name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE movie.id IN (SELECT movieid FROM casting
WHERE actorid IN (
  SELECT actor.id FROM actor
  WHERE name='Julie Andrews')) AND ord = 1

/*Question 13*/
SELECT name FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid
WHERE ord = 1
GROUP BY name
HAVING count(title) >= 15

/*Question 14*/
SELECT title, COUNT(actorid) FROM movie JOIN casting ON movie.id = movieid 
WHERE yr = 1978
GROUP BY movie.id
ORDER BY COUNT(actorid) DESC, title

/*Question 15*/
SELECT DISTINCT name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id WHERE movie.id IN (SELECT movieid FROM casting
WHERE actorid IN (
  SELECT actor.id FROM actor
  WHERE name = 'Art Garfunkel') 
GROUP BY movie.id
) AND name != 'Art Garfunkel'