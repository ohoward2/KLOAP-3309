USE scouting_athlete;
DROP TABLE IF EXISTS TournamentParticipations;
DROP TABLE IF EXISTS Tournament;
DROP TABLE IF EXISTS Scout;
DROP TABLE IF EXISTS Athlete;
DROP TABLE IF EXISTS Coach;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS League;
DROP TABLE IF EXISTS City;

CREATE TABLE City (
	cityID INT NOT NULL PRIMARY KEY,
    cityName VARCHAR(30),
    country VARCHAR(30)
);

CREATE TABLE League (
	lName VARCHAR(30),
	seasonYear INT,
    UNIQUE (seasonYear, lName),
	PRIMARY KEY (lName, seasonYear)
);

CREATE TABLE Team (
	cityID INT NOT NULL,
	tName VARCHAR(30) NOT NULL,
	tConference VARCHAR(30) NOT NULL,
	ranking INT,
	UNIQUE (tName, tConference),
    PRIMARY KEY (tConference, tName),
	FOREIGN KEY (cityID) REFERENCES City (cityID)
);

CREATE TABLE Coach (
	coachNo INT NOT NULL PRIMARY KEY,
    age INT, 
    cName VARCHAR(30),
    tName VARCHAR(30) NOT NULL,
    tConference VARCHAR(30) NOT NULL,
    FOREIGN KEY (tConference) REFERENCES Team (tConference),
    FOREIGN KEY (tName) REFERENCES Team (tName)
);

CREATE TABLE Athlete (
	playerNo INT NOT NULL PRIMARY KEY,
    age INT, 
    height INT,
    weight INT,
    aPosition VARCHAR(30), 
    aName VARCHAR(30),
    tName VARCHAR(30) NOT NULL,
    tConference VARCHAR(30) NOT NULL,
    FOREIGN KEY (tConference, tName) REFERENCES Team (tConference, tName)
    );
    
    CREATE TABLE Scout (
	scoutID INT NOT NULL PRIMARY KEY,
    age INT, 
    sName VARCHAR(30),
    tName VARCHAR(30) NOT NULL,
    tConference VARCHAR(30) NOT NULL,
    FOREIGN KEY (tConference, tName) REFERENCES Team (tConference, tName)
    );
    
    CREATE TABLE Tournament (
    tournamentNo INT NOT NULL PRIMARY KEY,
    startDate DATE,
    endDate DATE,
    tAddress VARCHAR (60),
    tournamentYear INT,
    lName VARCHAR(30),
    cityID INT,
    tConference VARCHAR(30) NOT NULL,
    tName VARCHAR(30) NOT NULL, 
	FOREIGN KEY (tConference, tName) REFERENCES Team (tConference, tName),
	FOREIGN KEY (tournamentYear, lName) REFERENCES League (seasonYear, lName)
    );
    
	CREATE TABLE TournamentParticipations (
    tournamentNo INT NOT NULL,
	tConference VARCHAR(30) NOT NULL,
    tName VARCHAR(30) NOT NULL,
    PRIMARY KEY(tournamentNo, tConference, tName),
	FOREIGN KEY (tConference, tName) REFERENCES Team (tConference, tName),
	FOREIGN KEY (tournamentNo) REFERENCES Tournament(tournamentNo)
    );

    
SHOW DATABASES;
