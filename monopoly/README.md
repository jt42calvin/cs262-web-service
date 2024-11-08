# CS 262 - Lab 7
# Student Name: Jacob Tocila
# Email: jt42
# Date: Oct 25, 2024

This sample Monopoly database and set of queries is used in Calvin College
CS 262 [lab 7](https://cs.calvin.edu/courses/cs/262/kvlinden/07is/lab.html).

Exercise 7.1, Add tables and relationships to this game database model to support saving Monopoly games in progress rather than just finished games. Keep track of each player’s cash, their properties, houses, hotels and where their piece is currently located.

Player(ID, emailAddress, name)
PlayerGame(gameID, playerID, finished, playerScore, playerProperties, playerMoney, playerPieceLocation)
Game(ID, time)
buildingLocations(gameID, playerID, propertyID, numberOfHouses, numberOfHotels,)

DATA TABLES PRODUCED FROM THIS LAB:

jt42=> \dt
             List of relations
  Schema   |      Name      | Type  | Owner 
-----------+----------------+-------+-------
 my_schema | game           | table | jt42
 my_schema | player         | table | jt42
 my_schema | playergame     | table | jt42
 my_schema | playerhotels   | table | jt42
 my_schema | playerhouses   | table | jt42
 my_schema | playerlocation | table | jt42
 my_schema | playermoney    | table | jt42
 my_schema | playerproperty | table | jt42
 my_schema | property       | table | jt42
(9 rows)

playerid |  emailaddress  | playername | registrationdate 
----------+----------------+------------+------------------
        1 | me@calvin.edu  | Me         | 2006-01-01
        2 | king@gmail.edu | The King   | 2006-02-01
        3 | dog@gmail.edu  | Dogbreath  | 2006-03-01
(3 rows)

 gameid |      starttime      
--------+---------------------
      1 | 2006-06-27 08:00:00
      2 | 2006-06-28 13:20:00
      3 | 2006-06-29 18:41:00
(3 rows)

 playerid | gameid |  score  
----------+--------+---------
        1 |      1 |    0.00
        1 |      2 |    0.00
        1 |      3 | 2350.00
        2 |      1 | 1000.00
        2 |      2 |    0.00
        2 |      3 |  500.00
        3 |      2 |    0.00
        3 |      3 | 5500.00
(8 rows)

    propertyname      | colorgroup | cost 
-----------------------+------------+------
 Mediterranean Avenue  | Brown      |   60
 Baltic Avenue         | Brown      |   60
 Oriental Avenue       | Light Blue |  100
 Vermont Avenue        | Light Blue |  100
 Connecticut Avenue    | Light Blue |  120
 St. Charles Place     | Pink       |  140
 States Avenue         | Pink       |  140
 Virginia Avenue       | Pink       |  160
 St. James Place       | Orange     |  180
 Tennessee Avenue      | Orange     |  180
 New York Avenue       | Orange     |  200
 Kentucky Avenue       | Red        |  220
 Indiana Avenue        | Red        |  220
 Illinois Avenue       | Red        |  240
 Atlantic Avenue       | Yellow     |  260
 Ventnor Avenue        | Yellow     |  260
 Marvin Gardens        | Yellow     |  280
 Pacific Avenue        | Green      |  300
 North Carolina Avenue | Green      |  300
 Pennsylvania Avenue   | Green      |  320
 Park Place            | Dark Blue  |  350
 Boardwalk             | Dark Blue  |  400
 Reading Railroad      | Railroad   |  200
 Pennsylvania Railroad | Railroad   |  200
 B&O Railroad          | Railroad   |  200
 Short Line Railroad   | Railroad   |  200
 Water Works           | Utility    |  150
 Electric Company      | Utility    |  150
(28 rows)

playerid | amount 
----------+--------
        1 |   1500
        2 |   1300
        3 |    400
(3 rows)