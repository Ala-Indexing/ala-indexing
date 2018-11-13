#loading packages
import pyodbc
import csv
import pandas as pd
import sqlalchemy as sa
from sqlalchemy import *
import sqlalchemy.dialects.mysql
import sqlalchemy.dialects.mysql.mysqlconnector
import pymysql
import string
#local file location
fileLoc = r'C:\Users\brape\Desktop\collegefootballstatistics\cfbstats-com-2005-1-5-0\\'

#loading files into dataframes
dfConference = pd.read_csv(fileLoc + 'conference.csv')
dfStadium = pd.read_csv(fileLoc + 'stadium.csv')
dfTeam = pd.read_csv(fileLoc + 'team.csv')
dfGame = pd.read_csv(fileLoc + 'game.csv')
dfGameStatistics = pd.read_csv(fileLoc + 'game-statistics.csv')
dfPlayer = pd.read_csv(fileLoc + 'player.csv')
dfPlayerGameStatistics = pd.read_csv(fileLoc + 'player-game-statistics.csv')
dfTeamGameStatistics = pd.read_csv(fileLoc + 'team-game-statistics.csv')
dfDrive = pd.read_csv(fileLoc + 'drive.csv')
dfPlay = pd.read_csv(fileLoc + 'play.csv')
dfPunt = pd.read_csv(fileLoc + 'punt.csv')
dfPuntReturn = pd.read_csv(fileLoc + 'punt-return.csv')
dfReception = pd.read_csv(fileLoc + 'reception.csv')
dfRush = pd.read_csv(fileLoc + 'rush.csv')
dfKickoff = pd.read_csv(fileLoc + 'kickoff.csv')
dfKickoffReturn = pd.read_csv(fileLoc + 'kickoff-return.csv')
dfPass = pd.read_csv(fileLoc + 'pass.csv')

#dataframe file array
dfFileNameCleaned = ['conference_cleaned', 'stadium_cleaned', 'stadiumdetails_cleaned', 'team_cleaned', 'teamdetails_cleaned', 'game_cleaned',
                     'gamestatistics_cleaned', 'player_cleaned', 'playerdetails_cleaned', 'playergamestatistics_cleaned',
                     'teamgamestatistics_cleaned', 'drive_cleaned', 'play_cleaned', 'punt_cleaned', 'puntreturn_cleaned', 'reception_cleaned',
                     'rush_cleaned', 'kickoff_cleaned', 'kickoffreturn_cleaned', 'pass_cleaned']

dfTableNames = ['conference', 'stadium', 'stadiumdetails', 'team', 'teamdetails', 'game', 'gamestatistics', 'player', 'playerdetails',
                'playergamestatistics', 'teamgamestatistics', 'drive', 'play', 'punt', 'puntreturn', 'reception', 'rush', 'kickoff',
                'kickoffreturn', 'pass']

#cleaning dataframes
for df in (dfConference, dfStadium, dfTeam, dfGame, dfGameStatistics, dfPlayer, dfPlayerGameStatistics, dfTeamGameStatistics, dfDrive, dfPlay, dfPunt, dfPuntReturn, dfReception, dfRush, dfKickoff, dfKickoffReturn, dfPass):
    df.columns = df.columns.str.replace('[^\w\s]', '')
    df.columns = df.columns.str.replace(' ', '')
    df.columns = df.columns.str.replace('1st', 'First')
    df.columns = df.columns.str.lower()

dfStadium['remove'] = False
dfTeam['remove'] = False
dfPlayer['remove'] = False

#creating database connection string
conn = pymysql.connect(
    host='35.186.183.201',
    user='brandon',
    password='AlaIndexing',
    db='AlaIndexing2'
    )
engine = create_engine("mysql+pymysql://brandon:AlaIndexing@35.186.183.201/AlaIndexing2", echo=False)
cur = conn.cursor()
cur.execute('SELECT COUNT(*) FROM stadium')
result = cur.fetchone()
if (result[0] > 0):
    cur.execute('SELECT conferencecode FROM conference')
    conferenceCodes = cur.fetchall()
    for i, code in enumerate(conferenceCodes):
        conferenceCodes[i] = code[0]
    dfConference = dfConference[~dfConference['conferencecode'].isin(conferenceCodes)]
    
    dfStadiumResult = pd.read_sql_query('SELECT * FROM stadiumdetails', conn)
    dfStadiumResult['new'] = 0
    dfStadium['new'] = 1
    dfStadiumNew = dfStadiumResult.append(dfStadium)
    dfStadiumNew = dfStadiumNew.drop_duplicates(subset = ['name', 'city', 'state', 'capacity', 'surface'])
    duplicateStadium = dfStadiumNew.duplicated(subset = ['stadiumcode'])
    dfStadiumNew['remove'] = duplicateStadium.values
    dfStadium = dfStadiumNew[dfStadiumNew.new == 1]
    dfStadium.yearopened = dfStadium.yearopened.astype(int)
    
    dfTeamResult = pd.read_sql_query('SELECT * FROM teamdetails', conn)
    dfTeamResult['new'] = 0
    dfTeam['new'] = 1
    dfTeamNew = dfTeamResult.append(dfTeam)
    #dfTeamNew = dfTeamNew.drop_duplicates(subset = ['conferencecode'])
    duplicateTeam = dfTeamNew.duplicated(subset = ['teamcode'])
    dfTeamNew['remove'] = duplicateTeam.values
    dfTeam = dfTeamNew[dfTeamNew.new == 1]
    
    dfPlayerResult = pd.read_sql_query('SELECT * FROM playerdetails', conn)
    dfPlayerResult['new'] = 0
    dfPlayer['new'] = 1
    dfPlayerResult['playercode'] = pd.to_numeric(dfPlayerResult['playercode'])
    dfPlayerNew = dfPlayerResult.append(dfPlayer)
    #dfPlayerNew['playercode'] = pd.to_numeric(dfPlayerNew['playercode'])
    #dfPlayerNew = dfPlayerNew.drop_duplicates(subset = ['teamcode', 'uniformnumber', 'class', 'position' , 'height', 'weight', 'lastschool'])
    #dfPlayerNew = dfPlayerNew.drop_duplicates(subset = ['teamcode', 'uniformnumber', 'class', 'position'])
    duplicatePlayer = dfPlayerNew.duplicated(subset = ['playercode'])
    dfPlayerNew['remove'] = duplicatePlayer.values
    dfPlayer = dfPlayerNew[dfPlayerNew.new == 1]
dfStadiumDetails = dfStadium[['name', 'city', 'state', 'capacity', 'surface', 'stadiumcode']]
dfStadium = dfStadium[['stadiumcode', 'yearopened', 'remove']]
dfStadium = dfStadium[dfStadium.remove == False]
dfStadium = dfStadium.drop(['remove'], axis=1)

dfTeamDetails = dfTeam[['teamcode', 'conferencecode']]
dfTeam = dfTeam[['teamcode', 'name', 'remove']]
dfTeam = dfTeam[dfTeam.remove == False]
dfTeam = dfTeam.drop(['remove'], axis=1)

dfPlayerDetails = dfPlayer[['playercode', 'teamcode', 'uniformnumber', 'class', 'position', 'height', 'weight', 'lastschool']]
dfPlayer = dfPlayer[['playercode', 'lastname', 'firstname', 'hometown', 'homestate', 'homecountry', 'remove']]
dfPlayer = dfPlayer[dfPlayer.remove == False]
dfPlayer = dfPlayer.drop(['remove'], axis=1)

#cleaning names by removing punctuation in names to avoid issues with csv formatting
dfPlayer['firstname'] = dfPlayer['firstname'].str.replace('[^\w\s]','')
dfPlayer['lastname'] = dfPlayer['lastname'].str.replace('[^\w\s]','')
dfPlayerDetails['lastschool'] = dfPlayerDetails['lastschool'].replace('[^\w\s]','')

dfGame['date'] =  dfGame['date'].str.replace(r'(\d+)/(\d+)/(\d+)',r'\3/\1/\2')

dfPass['passerplayercode'] = dfPass['passerplayercode'].astype(int)
dfPass['receiverplayercode'] = dfPass['passerplayercode'].astype(int)


dfFinalArray = [dfConference, dfStadium, dfStadiumDetails, dfTeam, dfTeamDetails, dfGame, dfGameStatistics, dfPlayer, dfPlayerDetails,
                dfPlayerGameStatistics, dfTeamGameStatistics, dfDrive, dfPlay, dfPunt, dfPuntReturn, dfReception, dfRush, dfKickoff, dfKickoffReturn, dfPass]
for df, file, table in zip(dfFinalArray, dfFileNameCleaned, dfTableNames):
    print(df.shape)
    print(file)
    print(table)
    
    df.to_sql(name = table,con=engine,if_exists='append', index = False)