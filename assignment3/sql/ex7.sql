CREATE VIEW DraftProspectives
AS SELECT a.aName, a.position, a.tName, a.tConference, t.ranking
FROM Athlete a, City c, Team t
WHERE t.ranking <= 25
AND a.tName= t.tName
AND a.tConference = t.tConference
AND c.cityID = t.cityID
AND  a.age >=18
AND a.age <=21;

CREATE VIEW PointGuardOutliers 
AS SELECT a.aName, a.position, a.tName, a.tConference, t.ranking 
FROM Athlete a, City c, Team t
WHERE a.height > 191
AND a.tName= t.tName
AND a.tConference = t.tConference
AND c.cityID = t.cityID
AND  a.position = 'Point Guard';

CREATE VIEW CenterGeologicalDensity
AS SELECT a.aName, a.position, a.tName,t.ranking, count(*)
FROM Athlete a, City c, Team t
WHERE  a.position = 'Center'
AND c.cityName = 'London'
AND a.tName= t.tName
AND c.cityID = t.cityID;