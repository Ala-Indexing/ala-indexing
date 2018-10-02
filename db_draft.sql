CREATE TABLE Conference
(
  ConferenceCode INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Subdivision VARCHAR(5) NOT NULL,
  PRIMARY KEY (ConferenceCode)
);

CREATE TABLE Stadium
(
  StadiumCode INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL,
  Capacity INT NOT NULL,
  Surface VARCHAR(20) NOT NULL,
  YearOpened INT NOT NULL,
  PRIMARY KEY (StadiumCode)
);

CREATE TABLE Team
(
  TeamCode INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  ConferenceCode INT NOT NULL,
  PRIMARY KEY (TeamCode),
  FOREIGN KEY (ConferenceCode) REFERENCES Conference(ConferenceCode)
);

CREATE TABLE Season
(
  SeasonId INT NOT NULL,
  Year INT NOT NULL,
  PRIMARY KEY (SeasonId)
);
insert into Season VALUES(2005,2005);

CREATE TABLE Game
(
  GameCode bigint NOT NULL,
  Date DATE NOT NULL,
  Site VARCHAR(30) NOT NULL,
  StadiumCode INT NOT NULL,
  HomeTeamCode INT NOT NULL,
  VisitingTeamCode INT NOT NULL,
  SeasonId INT NOT NULL,
  PRIMARY KEY (GameCode),
  FOREIGN KEY (StadiumCode) REFERENCES Stadium(StadiumCode),
  FOREIGN KEY (HomeTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (VisitingTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (SeasonId) REFERENCES Season(SeasonId)
);

CREATE TABLE GameStatistics
(
  GameStatisticsID uniqueidentifier NOT NULL
	DEFAULT newid(),
  Attendance INT NOT NULL,
  Duration INT,
  GameCode bigint NOT NULL,
  PRIMARY KEY(GameStatisticsID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE Player
(
  PlayerCode INT NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  FirstName VARCHAR(30),
  UniformNumber VARCHAR(5),
  Class VARCHAR(2),
  Position VARCHAR(10),
  Height INT,
  Weight INT,
  Hometown VARCHAR(30),
  HomeState VARCHAR(2),
  HomeCountry VARCHAR(30),
  LastSchool VARCHAR(30),
  TeamCode INT NOT NULL,
  PRIMARY KEY (PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE PlayerGameStatistics
(
  PlayerGameStatisticsID uniqueidentifier NOT NULL
	DEFAULT newid(),
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
  OffXPKickAttMade INT NOT NULL,
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
  PlayerCode INT NOT NULL,
  GameCode bigint NOT NULL,
  PRIMARY KEY (PlayerGameStatisticsID),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE TeamGameStatistics
(
  TeamGameStatisticsID uniqueidentifier NOT NULL
	DEFAULT newid(),
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
  KickoffRetYD INT NOT NULL,
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
  KickPuntReturned INT NOT NULL,
  FirstDownRush INT NOT NULL,
  FirstDownPass INT NOT NULL,
  FirstDownPenalty INT NOT NULL,
  TimeOfPossession INT NOT NULL,
  Penalty INT NOT NULL,
  PenaltyYard INT NOT NULL,
  ThirdDownAtt INT NOT NULL,
  ThirdDownConv INT NOT NULL,
  FourthDownAtt INT NOT NULL,
  FourthDownConv INT NOT NULL,
  RedZoneAtt INT NOT NULL,
  RedZoneTD INT NOT NULL,
  RedZoneFieldGoal INT NOT NULL,
  TeamCode INT NOT NULL,
  GameCode bigint NOT NULL,
  PRIMARY KEY (TeamGameStatisticsID),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE Drive 
(
  DriveID uniqueidentifier NOT NULL
	DEFAULT newid(),
  DriveNumber INT NOT NULL,
  StartPeriod INT NOT NULL,
  StartClock INT,
  StartSpot INT NOT NULL,
  StartReason varchar(100) NOT NULL,
  EndPeriod INT NOT NULL,
  EndClock INT,
  EndSpot INT NOT NULL,
  EndReason varchar(100) NULL,
  Plays INT NOT NULL,
  Yards INT NOT NULL,
  TimeOfPossession INT,
  RedZoneAttempt INT NOT NULL,
  GameCode bigint NOT NULL,
  TeamCode INT NOT NULL,
  PRIMARY KEY (DriveID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Play
(
  PlayID uniqueidentifier NOT NULL
  DEFAULT newid(),
  PlayNumber INT NOT NULL,
  PeriodNumber INT NOT NULL,
  GameCode bigint not null,
  Clock INT,
  OffensePoints INT NOT NULL,
  DefensePoints INT NOT NULL,
  Down INT,
  Distance INT,
  Spot INT NOT NULL,
  PlayType VARCHAR(20) NOT NULL,
  DrivePlay INT,
  DriveNumber INT,
  OffenseTeamCode INT NOT NULL,
  DefenseTeamCode INT NOT NULL,
  PRIMARY KEY (PlayID),
  FOREIGN KEY (OffenseTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (DefenseTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE Punt
(
  PuntID uniqueidentifier NOT NULL
	DEFAULT newid(),
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  Blocked INT NOT NULL,
  FairCatch INT NOT NULL,
  Touchback INT NOT NULL,
  Downed INT NOT NULL,
  OutOfBounds INT NOT NULL,
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  PlayerCode INT NOT NULL,
  TeamCode INT NOT NULL,
  PRIMARY KEY (PuntID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE PuntReturn
(
  PuntReturnID uniqueidentifier NOT NULL
	DEFAULT newid(),
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  Touchdown INT NOT NULL,
  Fumble INT NOT NULL,
  FumbleLost INT NOT NULL,
  Safety INT NOT NULL,
  FairCatch INT NOT NULL,
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  PlayerCode INT NOT NULL,
  TeamCode INT NOT NULL,
  PRIMARY KEY (PuntReturnID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Reception
(
  ReceptionID uniqueidentifier NOT NULL
	DEFAULT newid(),
  Reception INT NOT NULL,
  Yards INT NOT NULL,
  Touchdown INT NOT NULL,
  FirstDown INT NOT NULL,
  Fumble INT NOT NULL,
  FumbleLost INT NOT NULL,
  Safety INT NOT NULL,
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  PlayerCode INT NOT NULL,
  TeamCode INT NOT NULL,
  PRIMARY KEY (ReceptionID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Rush
(
  RushID uniqueidentifier NOT NULL
	DEFAULT newid(),
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  TouchDown INT NOT NULL,
  FirstDown INT NOT NULL,
  Sack INT NOT NULL,
  Fumble INT NOT NULL,
  FumbleLost INT NOT NULL,
  Safety INT NOT NULL,
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  PlayerCode INT NOT NULL,
  TeamCode INT NOT NULL,
  PRIMARY KEY (RushID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Kickoff
(
  KickoffID uniqueidentifier NOT NULL
	DEFAULT newid(),
  PlayerCode INT NOT NULL,
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  FairCatch INT NOT NULL,
  Touchback INT NOT NULL,
  Downed INT NOT NULL,
  OutOfBounds INT NOT NULL,
  Onside INT NOT NULL,
  OnsideSuccess INT NOT NULL,
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PRIMARY KEY (KickoffID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE KickoffReturn
(
  KickoffReturnID uniqueidentifier NOT NULL
	DEFAULT newid(),
  Attempt INT NOT NULL,
  Yards INT NOT NULL,
  Touchdown INT NOT NULL,
  Fumble INT NOT NULL,
  FumbleLost INT NOT NULL,
  Safety INT NOT NULL,
  FairCatch INT NOT NULL,
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  TeamCode INT NOT NULL,
  PlayerCode INT NOT NULL,
  PRIMARY KEY (KickoffReturnID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode)
);

CREATE TABLE Pass
(
  PassID uniqueidentifier NOT NULL
	DEFAULT newid(),
  Attempt INT NOT NULL,
  Completion INT NOT NULL,
  Yards INT NOT NULL,
  Touchdown INT NOT NULL,
  Interception INT NOT NULL,
  FirstDown INT NOT NULL,
  Dropped INT NOT NULL,
  GameCode bigint NOT NULL,
  PlayNumber INT NOT NULL,
  PasserPlayerCode INT NOT NULL,
  ReceiverPlayerCode INT,
  TeamCode INT NOT NULL,
  PRIMARY KEY (PassID),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PasserPlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (ReceiverPlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);
