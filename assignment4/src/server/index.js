const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const mysql = require("mysql");


const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "Turtle34#$",
    database: "Scouting"

});

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get("/", (req, res) => {
    res.send("Hello world");
  });
  
  //Find players from a city
  app.get("/api/cityPlayers", (req, res) => {
    const cityName = req.query.cityName;
    console.log(cityName);  
  
    const sqlSelect =
      `SELECT a.aName, a.age, a.height, a.tName, a.tConference
      FROM Athlete a, Team t, City c
      WHERE c.cityName = ?
      AND a.tName = t.tName
      AND a.tConference = t.tConference 
      AND c.cityID = t.cityID`;
  
    db.query(sqlSelect, [cityName], (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).json({}); 
        return
      }
      console.log(result);
      res.json(result);
    });
  });
  
  //Find Elite positional players
  app.get("/api/elitePosition", (req, res) => {
      const position = req.query.position;
      console.log(position);  
    
      const sqlSelect =
          `SELECT a.aName, a.age, a.height, a.aPosition, t.ranking
          FROM Athlete a, Team t, City c
          WHERE a.aPosition = ?
          AND t.ranking <= 100
          AND t.cityID = c.cityID
          AND t.tName = a.tName
          AND a.tConference = t.tConference 
          ORDER BY t.ranking`;
    
      db.query(sqlSelect, [position], (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).json({});
          return
        }
        console.log(result);
        res.json(result);
      });
    });
  
    //Get BIG12 conference players by height
    app.get("/api/BIG12Centers", (req, res) => {
      const height = req.query.height;
      console.log(height);
    
      const sqlSelect =
        `SELECT a.aName, a.age, a.height, a.aPosition, a.tName
        FROM Athlete a, Team t
        WHERE a.height = ?
        AND t.tName = a.tName
        AND a.tConference = 'BIG 12'
        ORDER BY a.height`;
    
      db.query(sqlSelect, [height], (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).json({});
          return
        }
        console.log(result);
        res.json(result);
      });
    });
  
    //Search player by name
    app.get("/api/searchPlayer", (req, res) => {
      const playerName = req.query.playerName;
      console.log(playerName);
    
      const sqlSelect =
        `SELECT a.aName, a.age, a.height, a.weight, a.aPosition, a.tName, a.tConference
        FROM Athlete a, Team t
        WHERE a.aName = ?
        AND t.tName = a.tName
        AND a.tConference = a.tConference`;
    
      db.query(sqlSelect, [playerName], (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).json({});
          return
        }
        console.log(result);
        res.json(result);
      });
    });

    //Add American City
    var ID = 2009001
  
    app.post("/api/insert", (req, res) => {
    
        const cityName = req.body.cityName;
    
        const sqlInsert = 
        "INSERT INTO City (cityID, cityName, country) VALUES ("+ID+", ?, 'United States')";

        ID++;
        db.query(sqlInsert, [cityName], (err, result) => {
            if (err) {
              console.error(err);
              res.status(500).json({});
              return
            }
            console.log(result);
            res.json(result);
          });
        });
  
  app.listen(3001, () => {
    console.log("running on port 3001");
  });




