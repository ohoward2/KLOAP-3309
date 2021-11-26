USE scouting;

SELECT * FROM Athlete WHERE weight>200;

SELECT c.cityID, c.cityName FROM City c WHERE c.cityID NOT IN (SELECT cityID FROM Teams);

SELECT a.playerNo, a.aName, t.tName,t.tConference,t.ranking,c.cityID,c.cityName,c.country
FROM Athlete a, Team t, City c
WHERE t.ranking <= 100
AND c.cityName = 'London'
AND  t.cityID = c.cityID
AND t.tName = a.tName
AND t.tConference = a.tConference

SELECT a.playerNo, a.aName, a.aPosition, t.tName,t.tConference,t.ranking,c.cityID,c.cityName,c.country
FROM Athlete a, Team t, City c
WHERE t.ranking <= 100
AND  t.cityID = c.cityID
AND t.tName = a.tName
AND t.tConference = a.tConference
AND a.aPosition = 'Point Guard';

SELECT COUNT(playerNo), tConference FROM Athlete GROUP BY tConference;

SELECT AVG(age), tConference FROM Athlete GROUP BY tConference;

SELECT a.playerNo, a.aName, a.aPosition, t.tName,t.tConference,t.ranking,c.cityID,c.cityName,c.country
FROM Athlete a, Team t, City c
WHERE t.tConference = 'BIG 12'
AND  t.cityID = c.cityID
AND t.tName = a.tName
AND t.tConference = a.tConference
AND a.aPosition = 'Center'
GROUP BY aPosition
ORDER BY height;
