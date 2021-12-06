INSERT INTO `City` (`cityID`, `cityName`, `country`) VALUES 
    (19086, "London", "Canada"),
    (19087, "Toronto", "Canada"),
    (19088, "Mississauga", "Canada");

INSERT INTO `League` (`lName`, `seasonYear`) VALUES 
    ("Kent Cup", 2019),
    ("Hawaii Bowl", 2020),
    ("Trophy Cup", 2016);

INSERT INTO `Team` (`cityID`, `tName`, `tConference`, `ranking`) VALUES
    (19086, "Western University", "Canada East", 372),
    (19086, "Fanshawe College", "Canada East", 373),
    (19087, "Ryerson", "Canada East", 374);

INSERT INTO `Coach` (`coachNo`, `age`, `cName`, `tName`, `tConference`) VALUES
    (1, 33, "Greg LeGregory", "Western University", "Canada East"),
    (2, 43, "James Jameson", "Fanshawe College", "Canada East"),
    (3, 27, "Clara Luther", "Ryerson", "Canada East");

INSERT INTO `Athlete` (`playerNo`, `age`, `height`, `weight`, `aPosition`, `aName`, `tName`, `tConference`) VALUES
    (3933, 20, 199, 88, "Point Guard", "Kelly Fort", "Ryerson", "Canada East"),
    (3934, 21, 204, 90, "Small Forward", "John Doe", "Western University", "Canada East"),
    (3935, 19, 210, 94, "Power Forward", "Megan Harries", "Ryerson", "Canada East");

INSERT INTO `Scout` (`scoutID`, `age`, `sName`, `tName`, `tConference`) VALUES 
    (1, 33, "Terrence Howerd", "Western University", "Canada East"),
    (2, 55, "Steve Canoo", "Ryerson", "Canada East"),
    (3, 23, "Natalie Praco", "Fanshawe College", "Canada East");

INSERT INTO `Tournament` (`tournamentNo`, `startDate`, `endDate`, `tAddress`, `tournamentYear`, `lName`, `cityID`, `tConference`, `tName`) VALUES
    (1, "2019-09-04", "2019-09-06", '7 Main St.', 2019, "Kent Cup", 19086, "Canada East", "Fanshawe College"),
    (2, "2019-10-04", "2019-10-06", '32 Sussex Dr.', 2019, "Kent Cup", 19086, "Canada East", "Western University"),
    (3, "2019-11-04", "2019-11-15", '40 Essex Dr.', 2019, "Kent Cup", 19086, "Canada East", "Western University");

INSERT INTO `TournamentParticipations` (`tournamentNo`, `tConference`, `tName`) VALUES
    (1, "Canada East", "Fanshawe College"),
    (2, "Canada East", "Western University"),
    (3, "Canada East", "Western University");
