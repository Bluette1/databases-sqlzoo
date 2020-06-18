/*Question 1*/
SELECT COUNT(*) FROM stops

/*Question 2*/
SELECT id FROM stops 
WHERE name = 'Craiglockhart'

/*Question 3*/
SELECT id, name
FROM stops, route
WHERE id = stop
AND num = '4'
AND company = 'LRT'

/*Question 4*/
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

/*Question 5*/
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149 

/*Question 6*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

/*Question 7*/
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137 
GROUP BY company, num

/*Question 8*/
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'

/*Question 9*/
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND a.company = 'LRT'

/*Question 10*/
SELECT x.num, x.company, stops.name, y.num, y.company
FROM 
(SELECT  b.stop as stop, stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id) 
WHERE stopa.name='Craiglockhart') AS x
JOIN 
(SELECT d.stop as stop, stopd.name, c.company, c.num
FROM route c JOIN route d ON
  (c.company=d.company AND c.num=d.num)
  JOIN stops stopc ON (c.stop=stopc.id)
  JOIN stops stopd ON (d.stop=stopd.id) 
WHERE stopc.name='Lochend') AS y
ON (x.stop = y.stop) 
JOIN stops ON x.stop = stops.id
ORDER BY x.num, x.company, name, y.num, y.company