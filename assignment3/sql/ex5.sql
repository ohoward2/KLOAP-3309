USE scouting_athlete;

SELECT * FROM Athlete WHERE weight>200;

SELECT c.cityID, c.cityName FROM City c WHERE c.cityID NOT IN (SELECT cityID FROM Teams);

SELECT a.playerNo, a.aName, t.tName,t.tConference,t.ranking,c.cityID,c.cityName,c.cityCountry
FROM Athlete a, Team t, City c
WHERE t.ranking <= 100
AND t.cityName = 'London'
AND  t.cityID = c.cityID
AND t.tName = a.tName
AND t.tConference = a.tConference

SELECT a.playerNo, a.aName, a.position, t.tName,t.tConference,t.ranking,c.cityID,c.cityName,c.cityCountry
FROM Athlete a, Team t, City c
WHERE t.ranking <= 100
AND  t.cityID = c.cityID
AND t.tName = a.tName
AND t.tConference = a.tConference
AND a.position = 'Point Guard';

SELECT COUNT(playerNo), tConference FROM Athlete GROUP BY tConference;

SELECT AVG(x.age) FROM (SELECT * FROM Athlete WHERE age>20) x, tConference FROM Athlete GROUP BY tConference;

SELECT a.playerNo, a.aName, a.position, t.tName,t.tConference,t.ranking,c.cityID,c.cityName,c.cityCountry
FROM Athlete a, Team t, City c
WHERE t.tConference = 'BIG 12'
AND  t.cityID = c.cityID
AND t.tName = a.tName
AND t.tConference = a.tConference
AND a.position = 'Center'
GROUP BY position
ORDER BY height;
