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
  Name VARCHAR(30) NOT NULL,
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
  Attendance INT NOT NULL,
  Duration INT,
  GameCode bigint NOT NULL,
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
  Int INT NOT NULL,
  IntRetYard INT NOT NULL,
  IntRetTD INT NOT NULL,
  MiscRet INT NOT NULL,
  MiscRetYard INT NOT NULL,
  MisRetTD INT NOT NULL,
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
  TackleForLoss INT NOT NULL,
  TackleForLossYard INT NOT NULL,
  Sack FLOAT NOT NULL,
  SackYard INT NOT NULL,
  QBHurry INT NOT NULL,
  FumbleForced INT NOT NULL,
  PassBrokenUp INT NOT NULL,
  KickPuntBlocked INT NOT NULL,
  PlayerCode INT NOT NULL,
  GameCode bigint NOT NULL,
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE TeamGameStatistics
(
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
  TackleForLoss INT NOT NULL,
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
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE 
(
  DriveNumber INT NOT NULL,
  StartPeriod INT NOT NULL,
  StartClock INT,
  StartSpot INT NOT NULL,
  StartReason INT NOT NULL,
  EndPeriod INT NOT NULL,
  EndClock INT,
  EndSpot INT NOT NULL,
  EndReason INT NOT NULL,
  Plays INT NOT NULL,
  Yards INT NOT NULL,
  TimeOfPossession INT,
  RedZoneAttempt INT NOT NULL,
  GameCode bigint NOT NULL,
  TeamCode INT NOT NULL,
  PRIMARY KEY (DriveNumber),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Play
(
  PlayNumber INT NOT NULL,
  PeriodNumber INT NOT NULL,
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
  PRIMARY KEY (PlayNumber),
  FOREIGN KEY (DriveNumber) REFERENCES (DriveNumber),
  FOREIGN KEY (OffenseTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (DefenseTeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Punt
(
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayNumber) REFERENCES Play(PlayNumber),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE PuntReturn
(
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayNumber) REFERENCES Play(PlayNumber),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Reception
(
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayNumber) REFERENCES Play(PlayNumber),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Rush
(
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayNumber) REFERENCES Play(PlayNumber),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Kickoff
(
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayNumber) REFERENCES Play(PlayNumber),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE KickoffReturn
(
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayNumber) REFERENCES Play(PlayNumber),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode)
);

CREATE TABLE Pass
(
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayNumber) REFERENCES Play(PlayNumber),
  FOREIGN KEY (PasserPlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (ReceiverPlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);
