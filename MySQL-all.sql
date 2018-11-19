DROP DATABASE IF EXISTS AlaIndexing;
CREATE DATABASE AlaIndexing;
USE AlaIndexing;

CREATE TABLE conference
(
  ConferenceCode INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Subdivision VARCHAR(5) NOT NULL,
  PRIMARY KEY (ConferenceCode)
);

CREATE TABLE stadium
(
  StadiumCode INT NOT NULL,
  YearOpened INT NOT NULL,
  PRIMARY KEY (StadiumCode)
);

CREATE TABLE stadiumdetails
(
  Name VARCHAR(100) NOT NULL,
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL,
  Capacity INT NOT NULL,
  Surface VARCHAR(20) NOT NULL,
  StadiumCode INT NOT NULL,
  FOREIGN KEY (StadiumCode) REFERENCES stadium(StadiumCode)
);

CREATE TABLE team
(
  TeamCode INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (TeamCode)
);

CREATE TABLE teamdetails
(
  TeamCode INT NOT NULL,
  ConferenceCode INT NOT NULL,
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode),
  FOREIGN KEY (ConferenceCode) REFERENCES conference(ConferenceCode)
);

CREATE TABLE game
(
  GameCode bigint NOT NULL,
  Date DATE NOT NULL,
  VisitTeamCode INT NOT NULL,
  HomeTeamCode INT NOT NULL,
  StadiumCode INT NOT NULL,
  Site VARCHAR(30) NOT NULL,
  PRIMARY KEY (GameCode),
  FOREIGN KEY (StadiumCode) REFERENCES stadium(StadiumCode),
  FOREIGN KEY (HomeTeamCode) REFERENCES team(TeamCode),
  FOREIGN KEY (VisitTeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE gamestatistics
(
  GameCode bigint NOT NULL,
  Attendance INT NOT NULL,
  Duration VARCHAR(10),
  FOREIGN KEY (GameCode) REFERENCES game(GameCode)
);

CREATE TABLE player
(
  PlayerCode VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  FirstName VARCHAR(100),
  Hometown VARCHAR(100),
  HomeState VARCHAR(2),
  HomeCountry VARCHAR(100),
  PRIMARY KEY (PlayerCode)
);

CREATE TABLE playerdetails
(
  PlayerCode VARCHAR(30) NOT NULL,
  TeamCode INT NOT NULL,
  UniformNumber VARCHAR(5),
  Class VARCHAR(2),
  Position VARCHAR(10),
  Height VARCHAR(10),
  Weight VARCHAR(10),
  LastSchool VARCHAR(100),
  FOREIGN KEY (PlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE playergamestatistics
(
  PlayerCode VARCHAR(30) NOT NULL,
  GameCode bigint NOT NULL,
  RushAtt INT NOT NULL,
  RushYard INT NOT NULL,
  RushTD INT NOT NULL,
  PassAtt INT NOT NULL,
  PassComp INT NOT NULL,
  PassYard INT NOT NULL,
  PassTD INT NOT NULL,
  PassInt INT NOT NULL,
  PassConv INT NOT NULL,
  Rec INT NOT NULL,
  RecYards INT NOT NULL,
  RecTD INT NOT NULL,
  KickoffRet INT NOT NULL,
  KickoffRetYard INT NOT NULL,
  KickoffRetTD INT NOT NULL,
  PuntRet INT NOT NULL,
  PuntRetYard INT NOT NULL,
  PuntRetTD INT NOT NULL,
  FumRet INT NOT NULL,
  FumRetYard INT NOT NULL,
  FumRetTD INT NOT NULL,
  IntRet INT NOT NULL,
  IntRetYard INT NOT NULL,
  IntRetTD INT NOT NULL,
  MiscRet INT NOT NULL,
  MiscRetYard INT NOT NULL,
  MiscRetTD INT NOT NULL,
  FieldGoalAtt INT NOT NULL,
  FieldGoalMade INT NOT NULL,
  OffXPKickAtt INT NOT NULL,
  OffXPKickMade INT NOT NULL,
  Off2XPAtt INT NOT NULL,
  Off2XPMade INT NOT NULL,
  Def2XPAtt INT NOT NULL,
  Def2XPMade INT NOT NULL,
  Safety INT NOT NULL,
  Points INT NOT NULL,
  Punt INT NOT NULL,
  PuntYard INT NOT NULL,
  Kickoff INT NOT NULL,
  KickoffYard INT NOT NULL,
  KickoffTouchback INT NOT NULL,
  KickoffOutOfBounds INT NOT NULL,
  KickoffOnside INT NOT NULL,
  Fumble INT NOT NULL,
  FumbleLost INT NOT NULL,
  TackleSolo INT NOT NULL,
  TackleAssist INT NOT NULL,
  TackleForLoss VARCHAR(10) NOT NULL,
  TackleForLossYard INT NOT NULL,
  Sack FLOAT NOT NULL,
  SackYard INT NOT NULL,
  QBHurry INT NOT NULL,
  FumbleForced INT NOT NULL,
  PassBrokenUp INT NOT NULL,
  KickPuntBlocked INT NOT NULL,
  FOREIGN KEY (PlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (GameCode) REFERENCES game(GameCode)
);

CREATE TABLE teamgamestatistics
(
  TeamCode INT NOT NULL,
  GameCode bigint NOT NULL,
  RushAtt INT NOT NULL,
  RushYard INT NOT NULL,
  RushTD INT NOT NULL,
  PassAtt INT NOT NULL,
  PassComp INT NOT NULL,
  PassYard INT NOT NULL,
  PassTD INT NOT NULL,
  PassInt INT NOT NULL,
  PassConv INT NOT NULL,
  KickoffRet INT NOT NULL,
  KickoffRetYard INT NOT NULL,
  KickoffRetTD INT NOT NULL,
  PuntRet INT NOT NULL,
  PuntRetYard INT NOT NULL,
  PuntRetTD INT NOT NULL,
  FumRet INT NOT NULL,
  FumRetYard INT NOT NULL,
  FumRetTD INT NOT NULL,
  IntRet INT NOT NULL,
  IntRetYard INT NOT NULL,
  IntRetTD INT NOT NULL,
  MiscRet INT NOT NULL,
  MiscRetYard INT NOT NULL,
  MiscRetTD INT NOT NULL,
  FieldGoalAtt INT NOT NULL,
  FieldGoalMade INT NOT NULL,
  OffXPKickAtt INT NOT NULL,
  OffXPKickMade INT NOT NULL,
  Off2XPAtt INT NOT NULL,
  Off2XPMade INT NOT NULL,
  Def2XPAtt INT NOT NULL,
  Def2XPMade INT NOT NULL,
  Safety INT NOT NULL,
  Points INT NOT NULL,
  Punt INT NOT NULL,
  PuntYard INT NOT NULL,
  Kickoff INT NOT NULL,
  KickoffYard INT NOT NULL,
  KickoffTouchback INT NOT NULL,
  KickoffOutOfBounds INT NOT NULL,
  KickoffOnside INT NOT NULL,
  Fumble INT NOT NULL,
  FumbleLost INT NOT NULL,
  TackleSolo INT NOT NULL,
  TackleAssist INT NOT NULL,
  TackleForLoss FLOAT NOT NULL,
  TackleForLossYard INT NOT NULL,
  Sack FLOAT NOT NULL,
  SackYard INT NOT NULL,
  QBHurry INT NOT NULL,
  FumbleForced INT NOT NULL,
  PassBrokenUp INT NOT NULL,
  KickPuntBlocked INT NOT NULL,
  FirstDownRush INT NOT NULL,
  FirstDownPass INT NOT NULL,
  FirstDownPenalty INT NOT NULL,
  TimeOfPossession VARCHAR(10) NOT NULL,
  Penalty INT NOT NULL,
  PenaltyYard INT NOT NULL,
  ThirdDownAtt INT NOT NULL,
  ThirdDownConv INT NOT NULL,
  FourthDownAtt INT NOT NULL,
  FourthDownConv INT NOT NULL,
  RedZoneAtt INT NOT NULL,
  RedZoneTD INT NOT NULL,
  RedZoneFieldGoal INT NOT NULL,
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode),
  FOREIGN KEY (GameCode) REFERENCES game(GameCode)
);

CREATE TABLE drive 
(
  GameCode bigint NOT NULL,
  DriveNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  StartPeriod INT NOT NULL,
  StartClock varchar(10),
  StartSpot INT NOT NULL,
  StartReason varchar(100) NOT NULL,
  EndPeriod INT NOT NULL,
  EndClock VARCHAR(10),
  EndSpot INT NOT NULL,
  EndReason varchar(100) NULL,
  Plays INT NOT NULL,
  Yards INT NOT NULL,
  TimeOfPossession VARCHAR(10),
  RedZoneAttempt INT NOT NULL,
  PRIMARY KEY (GameCode, DriveNumber),
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE play
(
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  PeriodNumber INT NOT NULL,
  Clock VARCHAR(10),
  OffenseTeamCode INT NOT NULL,
  DefenseTeamCode INT NOT NULL,
  OffensePoints INT NOT NULL,
  DefensePoints INT NOT NULL,
  Down VARCHAR(10),
  Distance VARCHAR(10),
  Spot VARCHAR(10) NOT NULL,
  PlayType VARCHAR(20) NOT NULL,
  DriveNumber VARCHAR(10),
  DrivePlay VARCHAR(10),
  FOREIGN KEY (OffenseTeamCode) REFERENCES team(TeamCode),
  FOREIGN KEY (DefenseTeamCode) REFERENCES team(TeamCode),
  FOREIGN KEY (GameCode) REFERENCES game(GameCode)
);

CREATE TABLE punt
(
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PlayerCode VARCHAR(30) NOT NULL,
  Attempt INT NOT NULL,
  Yards VARCHAR(10) NOT NULL,
  Blocked VARCHAR(10) NOT NULL,
  FairCatch VARCHAR(10) NOT NULL,
  Touchback VARCHAR(10) NOT NULL,
  Downed VARCHAR(10) NOT NULL,
  OutOfBounds VARCHAR(10) NOT NULL,
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE puntreturn
(
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PlayerCode VARCHAR(30) NOT NULL,
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  Touchdown VARCHAR(10) NOT NULL,
  Fumble VARCHAR(10) NOT NULL,
  FumbleLost VARCHAR(10) NOT NULL,
  Safety VARCHAR(10) NOT NULL,
  FairCatch VARCHAR(10) NOT NULL,
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE reception
( 
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PlayerCode VARCHAR(30) NOT NULL,
  Reception INT NOT NULL,
  Yards INT NOT NULL,
  Touchdown INT NOT NULL,
  FirstDown INT NOT NULL,
  Fumble VARCHAR(10) NOT NULL,
  FumbleLost VARCHAR(10) NOT NULL,
  Safety VARCHAR(10) NOT NULL,
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE rush
(
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PlayerCode VARCHAR(30) NOT NULL,
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  TouchDown VARCHAR(10) NOT NULL,
  FirstDown VARCHAR(10) NOT NULL,
  Sack VARCHAR(10) NOT NULL,
  Fumble VARCHAR(10) NOT NULL,
  FumbleLost VARCHAR(10) NOT NULL,
  Safety VARCHAR(10) NOT NULL,
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE kickoff
(
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PlayerCode VARCHAR(30) NOT NULL,
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  FairCatch VARCHAR(10) NOT NULL,
  Touchback VARCHAR(10) NOT NULL,
  Downed VARCHAR(10) NOT NULL,
  OutOfBounds VARCHAR(10) NOT NULL,
  Onside VARCHAR(10) NOT NULL,
  OnsideSuccess VARCHAR(10) NOT NULL,
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);

CREATE TABLE kickoffreturn
(
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PlayerCode VARCHAR(30) NOT NULL,
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  Touchdown VARCHAR(10) NOT NULL,
  Fumble VARCHAR(10) NOT NULL,
  FumbleLost VARCHAR(10) NOT NULL,
  Safety VARCHAR(10) NOT NULL,
  FairCatch VARCHAR(10) NOT NULL,
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode),
  FOREIGN KEY (PlayerCode) REFERENCES player(PlayerCode)
);

CREATE TABLE pass
(
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PasserPlayerCode VARCHAR(30),
  ReceiverPlayerCode VARCHAR(30),
  Attempt VARCHAR(10) NOT NULL,
  Completion VARCHAR(10) NOT NULL,
  Yards INT NOT NULL,
  Touchdown VARCHAR(10) NOT NULL,
  Interception VARCHAR(10) NOT NULL,
  FirstDown VARCHAR(10) NOT NULL,
  Dropped VARCHAR(10) NOT NULL,
  FOREIGN KEY (GameCode) REFERENCES game(GameCode),
  FOREIGN KEY (PasserPlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (ReceiverPlayerCode) REFERENCES player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES team(TeamCode)
);
CREATE TABLE pbpGame
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
	PRIMARY KEY (gameId)
);

CREATE TABLE pbpDrive
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
  primary key (gameId,driveIndex),
  foreign key (gameId) REFERENCES pbpGame(gameId)
);

CREATE TABLE pbpPlay
(
  gameId int not null,
	awayScore INT NOT NULL,
	clock TIME NOT NULL,
	description VARCHAR(1000) NULL,
	distance INT NOT NULL,
	down INT NOT NULL,
	driveIndex INT NOT NULL,
	endYardLine INT NOT NULL,
	homeScore INT NOT NULL,
	playIndex INT NOT NULL,
	type VARCHAR(30) NOT NULL,
	yardLine INT NOT NULL,
	yardsGained INT NOT NULL,
  primary key (gameId,driveIndex,playIndex),
  foreign key (gameId,driveIndex) REFERENCES pbpDrive(gameId,driveIndex)
);
