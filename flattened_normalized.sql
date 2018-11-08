CREATE TABLE Game
(
	awayAbbr VARCHAR(8) NOT NULL,
	awayId INT NOT NULL,
	awayTeam VARCHAR(30) NOT NULL,
	gameId INT NOT NULL,
	homeAbbr VARCHAR(8) NOT NULL,
	homeId INT NOT NULL,
	homeTeam VARCHAR(30) NOT NULL,
	week VARCHAR(8) NOT NULL,
	year INT NOT NULL,
	Primary Key(gameId)
);

CREATE TABLE Drive 
(
	defenseAbbr VARCHAR(8) NOT NULL,
	defenseId INT NOT NULL,
	defenseTeam VARCHAR(30) NOT NULL,
	driveIndex INT NOT NULL,
	gameId INT NOT NULL,
	offenseAbbr VARCHAR(8) NOT NULL,
	offenseId INT NOT NULL,
	offenseTeam VARCHAR(30) NOT NULL,
	quarter INT NOT NULL,
	PRIMARY KEY (defenseId, driveIndex, offenseId)
	FOREIGN KEY (gameId) REFERENCES game(gameId)
);

CREATE TABLE Play
(	
	awayScore INT NOT NULL,	
	clock TIME NOT NULL,
	defenseId INT NOT NULL,
	description VARCHAR(1000) NOT NULL,
	distance INT NOT NULL, 
	down INT NOT NULL,
	driveIndex INT NOT NULL,
	endYardLine INT NOT NULL,
	homeScore INT NOT NULL,
	offenseId INT NOT NULL,
	playIndex INT NOT NULL,
	type VARCHAR(30) NOT NULL,
	yardLine INT NOT NULL,
	yardsGained INT NOT NULL,
	FOREIGN KEY (defenseId, driveIndex, offenseId) REFERENCES Drive(defenseId, driveIndex, offenseId)
);
