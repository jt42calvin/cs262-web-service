-- Create a new schema
CREATE SCHEMA IF NOT EXISTS monopoly_schema; -- Absolutely crucial to have this line in the script, create a schema if it doesn't exist. This was not included in the original lab code.

set search_path to monopoly_schema; -- Set the search path to the new schema

-- Drop previous versions of the tables if they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerLocation;
DROP TABLE IF EXISTS PlayerHotels;
DROP TABLE IF EXISTS PlayerHouses;
DROP TABLE IF EXISTS PlayerProperty;
DROP TABLE IF EXISTS PlayerMoney;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Game;

-- Create the schema.
CREATE TABLE Game (
    gameID serial PRIMARY KEY,
    startTime timestamp
);

CREATE TABLE Player (
    playerID serial PRIMARY KEY,
    emailAddress varchar(255) NOT NULL,
    playerName varchar(255),
    registrationDate date
);

CREATE TABLE Property (
    propertyID serial PRIMARY KEY,
    propertyName varchar(255) NOT NULL,
    cost integer NOT NULL,
    colorGroup varchar(50)
);

CREATE TABLE PlayerGame (
    playerID integer REFERENCES Player(playerID),
    gameID integer REFERENCES Game(gameID),
    score numeric,
    PRIMARY KEY (playerID, gameID)
);

CREATE TABLE PlayerMoney (
    playerID integer REFERENCES Player(playerID),
    amount integer NOT NULL,
    PRIMARY KEY (playerID)
);

CREATE TABLE PlayerProperty (
    playerID integer REFERENCES Player(playerID),
    propertyID integer REFERENCES Property(propertyID),
    PRIMARY KEY (playerID, propertyID)
);

CREATE TABLE PlayerHouses (
    playerID integer REFERENCES Player(playerID),
    propertyID integer REFERENCES Property(propertyID),
    quantity integer,
    PRIMARY KEY (playerID, propertyID)
);

CREATE TABLE PlayerHotels (
    playerID integer REFERENCES Player(playerID),
    propertyID integer REFERENCES Property(propertyID),
    PRIMARY KEY (playerID, propertyID)
);

CREATE TABLE PlayerLocation (
    playerID integer REFERENCES Player(playerID),
    propertyID integer REFERENCES Property(propertyID),
    PRIMARY KEY (playerID)
);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerMoney TO PUBLIC;
GRANT SELECT ON PlayerProperty TO PUBLIC;
GRANT SELECT ON PlayerHouses TO PUBLIC;
GRANT SELECT ON PlayerHotels TO PUBLIC;
GRANT SELECT ON PlayerLocation TO PUBLIC;


-- Add sample records.
INSERT INTO Game (gameID, startTime) VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game (gameID, startTime) VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game (gameID, startTime) VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player (playerID, emailAddress, registrationDate) VALUES (1, 'me@calvin.edu', '2006-01-01');
INSERT INTO Player (playerID, emailAddress, playerName, registrationDate) VALUES (2, 'king@gmail.com', 'The King', '2006-02-01');
INSERT INTO Player (playerID, emailAddress, playerName, registrationDate) VALUES (3, 'dog@gmail.com', 'Dogbreath', '2006-03-01');

INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (1, 'Mediterranean Avenue', 60, 'Brown');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (2, 'Baltic Avenue', 60, 'Brown');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (3, 'Oriental Avenue', 100, 'Light Blue');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (4, 'Vermont Avenue', 100, 'Light Blue');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (5, 'Connecticut Avenue', 120, 'Light Blue');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (6, 'St. Charles Place', 140, 'Pink');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (7, 'States Avenue', 140, 'Pink');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (8, 'Virginia Avenue', 160, 'Pink');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (9, 'St. James Place', 180, 'Orange');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (10, 'Tennessee Avenue', 180, 'Orange');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (11, 'New York Avenue', 200, 'Orange');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (12, 'Kentucky Avenue', 220, 'Red');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (13, 'Indiana Avenue', 220, 'Red');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (14, 'Illinois Avenue', 240, 'Red');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (15, 'Atlantic Avenue', 260, 'Yellow');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (16, 'Ventnor Avenue', 260, 'Yellow');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (17, 'Marvin Gardens', 280, 'Yellow');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (18, 'Pacific Avenue', 300, 'Green');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (19, 'North Carolina Avenue', 300, 'Green');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (20, 'Pennsylvania Avenue', 320, 'Green');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (21, 'Park Place', 350, 'Dark Blue');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (22, 'Boardwalk', 400, 'Dark Blue');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (23, 'Reading Railroad', 200, 'Railroad');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (24, 'Pennsylvania Railroad', 200, 'Railroad');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (25, 'B&O Railroad', 200, 'Railroad');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (26, 'Short Line Railroad', 200, 'Railroad');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (27, 'Water Works', 150, 'Utility');
INSERT INTO Property (propertyID, propertyName, cost, colorGroup) VALUES (28, 'Electric Company', 150, 'Utility');

-- Add records for PlayerGame with score values now supported by the table schema.
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (1, 1, 0.00);
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (1, 2, 0.00);
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (2, 2, 0.00);
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (2, 3, 500.00);
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (3, 2, 0.00);
INSERT INTO PlayerGame (playerID, gameID, score) VALUES (3, 3, 5500.00);

-- Add records for PlayerMoney.
INSERT INTO PlayerMoney (playerID, amount) VALUES (1, 3000);
INSERT INTO PlayerMoney (playerID, amount) VALUES (2, 1500);
INSERT INTO PlayerMoney (playerID, amount) VALUES (3, 400);