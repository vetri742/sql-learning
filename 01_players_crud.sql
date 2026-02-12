USE sql_learning;
CREATE TABLE players(
pid INT PRIMARY KEY,
pname VARCHAR(32),
age INT,
Team VARCHAR(30) );
INSERT INTO players
VALUES
(18,"virat",37,"RCB"),
(45,"rohit",38,"MI"),
(07,"dhoni",44,"CSK"),
(08,"jadeja",37,"RR");
SELECT*FROM players;
SELECT*FROM players
WHERE Pid=18;
SELECT*FROM players
WHERE age>=38;
UPDATE players
SET Team="RPS"
WHERE pid=7;
SELECT*FROM players;
DELETE FROM players
WHERE pid=45;
SELECT*FROM players;
DROP TABLE players;
