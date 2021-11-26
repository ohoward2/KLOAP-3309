use scouting;

DELETE FROM Athlete WHERE age>22;

DELETE FROM Athlete WHERE age<19 AND height<185 AND weight<85;

UPDATE Athlete SET aPosition='Center' WHERE height>213 AND weight>125;