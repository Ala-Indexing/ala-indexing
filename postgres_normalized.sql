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
  YearOpened INT NOT NULL,
  PRIMARY KEY (StadiumCode)
);

CREATE TABLE StadiumDetails
(
  Name VARCHAR(100) NOT NULL,
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL,
  Capacity INT NOT NULL,
  Surface VARCHAR(20) NOT NULL,
  StadiumCode INT NOT NULL,
  FOREIGN KEY (StadiumCode) REFERENCES Stadium(StadiumCode)
);

CREATE TABLE Team
(
  TeamCode INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (TeamCode)
);

CREATE TABLE TeamDetails
(
  TeamCode INT NOT NULL,
  ConferenceCode INT NOT NULL,
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (ConferenceCode) REFERENCES Conference(ConferenceCode)
);

CREATE TABLE Game
(
  GameCode bigint NOT NULL,
  Date DATE NOT NULL,
  VisitTeamCode INT NOT NULL,
  HomeTeamCode INT NOT NULL,
  StadiumCode INT NOT NULL,
  Site VARCHAR(30) NOT NULL,
  --SeasonId INT NOT NULL,
  PRIMARY KEY (GameCode),
  FOREIGN KEY (StadiumCode) REFERENCES Stadium(StadiumCode),
  FOREIGN KEY (HomeTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (VisitTeamCode) REFERENCES Team(TeamCode)
  --FOREIGN KEY (SeasonId) REFERENCES Season(SeasonId)
);

CREATE TABLE GameStatistics
(
  GameCode bigint NOT NULL,
  Attendance INT NOT NULL,
  Duration VARCHAR(10),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE Player
(
  PlayerCode VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  FirstName VARCHAR(30),
  Hometown VARCHAR(30),
  HomeState VARCHAR(2),
  HomeCountry VARCHAR(30),
  PRIMARY KEY (PlayerCode)
);

CREATE TABLE PlayerDetails
(
  PlayerCode VARCHAR(30) NOT NULL,
  TeamCode INT NOT NULL,
  UniformNumber VARCHAR(5),
  Class VARCHAR(2),
  Position VARCHAR(10),
  Height VARCHAR(10),
  Weight VARCHAR(10),
  LastSchool VARCHAR(50),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE PlayerGameStatistics
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
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE TeamGameStatistics
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
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE Drive 
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Play
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
  FOREIGN KEY (OffenseTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (DefenseTeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode)
);

CREATE TABLE Punt
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE PuntReturn
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Reception
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Rush
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE Kickoff
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);

CREATE TABLE KickoffReturn
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode),
  FOREIGN KEY (PlayerCode) REFERENCES Player(PlayerCode)
);

CREATE TABLE Pass
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
  FOREIGN KEY (GameCode) REFERENCES Game(GameCode),
  FOREIGN KEY (PasserPlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (ReceiverPlayerCode) REFERENCES Player(PlayerCode),
  FOREIGN KEY (TeamCode) REFERENCES Team(TeamCode)
);
