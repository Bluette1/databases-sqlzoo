/*Question 1*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

/*Question 2*/
SELECT name FROM world
  WHERE gdp / population >
     (SELECT gdp / population FROM world
      WHERE name='United Kingdom') AND continent = 'Europe'

/*Question 3*/
SELECT name, continent FROM world
  WHERE continent in  
     (SELECT continent FROM world
      WHERE name='Argentina' OR name = 'Australia') ORDER BY name

/*Question 4*/
SELECT name, population FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland') 

/*Question 5*/
SELECT name, CONCAT(ROUND(100 * population / (SELECT population FROM world WHERE name = 'Germany')), '%')
 as 'percentage' FROM world 
 WHERE continent = 'Europe'

/*Question 6*/
SELECT name
 FROM world 
WHERE NOT gdp = 'null' AND gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND NOT gdp = 'null' )

/*Question 7*/
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent)

/*Question 8*/
SELECT continent, name from world x
WHERE name = (SELECT name 
                  from world y 
                  WHERE  x.continent =  y.continent 
                  ORDER BY name 
                  LIMIT 1)

/*Question 9*/
SELECT name, continent, population FROM world 
WHERE continent IN 
(SELECT continent FROM world  x WHERE 25000000 >= 
(SELECT MAX(population) FROM world y WHERE x.continent = y.continent));

/*Question 10*/
SELECT name, continent FROM world x
  WHERE population >= ALL
    (SELECT 3 * population  FROM world y
        WHERE y.continent=x.continent AND x.name != y.name)