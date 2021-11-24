USE scouting_athlete;

INSERT INTO City (cityID, cityName, country) VALUES
	(19086, 'London', 'Canada');
SELECT * FROM City;

INSERT INTO Team (cityID, tName, tConference, ranking) VALUES
	(19086, 'Western', 'Canada', 372);
SELECT * FROM Team;

INSERT INTO Athlete (playerNo, age, height, weight, aPosition, aName, tName, tConference) VALUES
	(3933, 18, 190, 90, 'Center', 'Aaron McAaron', 'Western', 'Canada');
SELECT * FROM Athlete;   