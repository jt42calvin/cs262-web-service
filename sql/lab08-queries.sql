-- Jacob Tocila, lab 08, 2024, November 1

-- Tutorial how to use this:
-- 1. Open a terminal and navigate to the directory containing this file (must be on Linux lab machine)
-- 2. Run the following command to create the database:
-- psql
-- \include monopoly.sql
-- 3. Run the following command to see the tables: (toggle the lines above to see different tables)
-- \dt

-- These are sample queries to test the database. I made these during lab 07.
-- SELECT propertyName, colorGroup, cost FROM Property; -- Toggle this line to see a data table of the Property table!!!
-- SELECT * FROM Player; -- Toggle this line to see a data table of the Player table!!!
-- SELECT * FROM Game; -- Toggle this line to see a data table of the Game table!!!
-- SELECT * FROM PlayerGame; -- Toggle this line to see a data table of the PlayerGame table!!!
-- SELECT * FROM PlayerMoney; -- Toggle this line to see a data table of the PlayerMoney table!!!


--THESE ARE FROM LAB 08, EXERCISE 8.1

-- Write SQL queries that return the following information from your Monopoly database:
-- Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT * FROM Game ORDER BY startTime DESC;
-- Retrieve all the games that occurred in the past week.
SELECT * FROM Game WHERE startTime > NOW() - INTERVAL '1 week';
-- Retrieve a list of players who have (non-NULL) names.
SELECT * FROM Player WHERE playerName IS NOT NULL;
-- Retrieve a list of IDs for players who have some PlayerMoney larger than 2000.
SELECT playerID FROM PlayerMoney WHERE amount > 2000;
-- Retrieve a list of players who have GMail accounts.
SELECT * FROM Player WHERE emailAddress LIKE '%@gmail.com';

--THESE ARE FROM LAB 08, EXERCISE 8.2

-- Write PostgreSQL queries that return the following information from your Monopoly database:
-- Retrieve all “The King”’s game scores in decreasing order. Search by playerName like '%The King%'
SELECT * FROM PlayerGame WHERE playerID = (SELECT playerID FROM Player WHERE playerName LIKE '%The King%') ORDER BY score DESC;
-- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00. (It's a null name...)
SELECT playerName FROM Player WHERE playerID IN (SELECT playerID FROM PlayerGame WHERE gameID = (SELECT gameID FROM Game WHERE startTime = '2006-06-28 13:20:00') ORDER BY score DESC LIMIT 1);
-- So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?

/* For context, this is the lsat example query

Joining a table with itself - The following query retrieves the names of the players who share the same name.
SELECT P1.name
FROM Player AS P1, Player AS P2
WHERE P1.name = P2.name
  AND P1.ID < P2.ID; */

-- When we compare all of the values in a table to the same values in the same table, we would normally get a duplicate, however, this clause will exclude it from being compated to itself.

-- The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
-- I mean, if you really wanted to compare data in one row to every other value in the same table, it makes sense to do it this way.