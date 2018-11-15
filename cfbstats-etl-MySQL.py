import pyodbc
import csv
import pandas as pd
import sqlalchemy as sa
from sqlalchemy import create_engine
import sqlalchemy.dialects.mysql
import sqlalchemy.dialects.mysql.mysqlconnector
import pymysql
import string
from datetime import datetime



fileLoc = input("Drop in a foler and press enter: ") + "\\"

engine = create_engine("mysql+pymysql://brandon:AlaIndexing@35.186.183.201/AlaIndexing", echo=False)

#Create a DataFrame holder that cleans dataframes, and holds the table's name for later use
class dataFrameHolder:
    def __init__(self,tableName,dataFrame):
        self.tableName = tableName
        self.dataFrame = dataFrame
    def clean(self,columnName):
        quer = "select " + columnName + " from " + self.tableName
        connection = engine.connect()
        result = connection.execute(quer)
        identities = list()
        for row in result:
            identities.append(str(row[columnName]))
        connection.close()
        self.dataFrame = self.dataFrame[~self.dataFrame[columnName.lower()].isin(identities)]
    def upload(self):
        self.dataFrame.to_sql(name = self.tableName,con=engine,if_exists='append',index = False,chunksize=1000)
        print("Uploaded table",self.tableName)
    def normalize(self,newTableName,dropColumns1,dropColumns2):
        normDataFrame = self.dataFrame.drop(dropColumns2,axis = 1)
        self.dataFrame.drop(dropColumns1,axis = 1,inplace=True)
        return dataFrameHolder(newTableName,normDataFrame)


#Read in the CSV data
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

#clean up column names
for df in (dfConference, dfStadium, dfTeam, dfGame, dfGameStatistics, dfPlayer, dfPlayerGameStatistics, dfTeamGameStatistics, dfDrive, dfPlay, dfPunt, dfPuntReturn, dfReception, dfRush, dfKickoff, dfKickoffReturn, dfPass):
    df.columns = df.columns.str.replace('[^\w\s]', '')
    df.columns = df.columns.str.replace(' ', '')
    df.columns = df.columns.str.replace('1st', 'First')
    df.columns = df.columns.str.lower()

#create dataframeholders, normalize, and upload
dfhConference = dataFrameHolder("conference",dfConference)
dfhConference.clean('ConferenceCode')
dfhConference.upload()

dfhStadium = dataFrameHolder("stadium",dfStadium)
dfhStadiumDetails = dfhStadium.normalize(newTableName="stadiumdetails",dropColumns1=['name','city','state','capacity','surface'],dropColumns2=['yearopened'])
dfhStadium.clean('StadiumCode')
dfhStadium.upload()
dfhStadiumDetails.upload()

dfhTeam = dataFrameHolder("team",dfTeam)
dfhTeamDetails = dfhTeam.normalize(newTableName="teamdetails",dropColumns1=['conferencecode'],dropColumns2=['name'])
dfhTeam.clean('TeamCode')
dfhTeam.upload()
dfhTeamDetails.upload()

dfhGame = dataFrameHolder("game",dfGame)
dfhGame.dataFrame['date'] = pd.to_datetime(dfhGame.dataFrame['date'], format='%m/%d/%Y')
dfhGame.upload()

dfhGameStatistics = dataFrameHolder("gamestatistics",dfGameStatistics)
dfhGameStatistics.upload()

dfhPlayer = dataFrameHolder("player",dfPlayer)
dfhPlayerDetails = dfhPlayer.normalize(newTableName="playerdetails",dropColumns1=['teamcode','uniformnumber','class','position','height','weight','lastschool'],dropColumns2=['lastname','firstname','hometown','homestate','homecountry'])
dfhPlayer.clean('PlayerCode')
dfhPlayer.upload()
dfhPlayerDetails.upload()

dfhTeamGameStatistics = dataFrameHolder("teamgamestatistics",dfTeamGameStatistics)
dfhTeamGameStatistics.upload()

dfhPlayerGameStatistics = dataFrameHolder("playergamestatistics",dfPlayerGameStatistics)
dfhPlayerGameStatistics.upload()

dfhDrive = dataFrameHolder("drive",dfDrive)
dfhDrive.upload()

dfhPlay = dataFrameHolder("play",dfPlay)
dfhPlay.upload()

dfhKickoff = dataFrameHolder("kickoff",dfKickoff)
dfhKickoff.upload()

dfhKickoffReturn = dataFrameHolder("kickoffreturn",dfKickoffReturn)
dfhKickoffReturn.upload()

dfhPass = dataFrameHolder("pass",dfPass)
dfhPass.upload()

dfhPunt = dataFrameHolder("punt",dfPunt)
dfhPunt.upload()

dfhPuntReturn = dataFrameHolder("puntreturn",dfPuntReturn)
dfhPuntReturn.upload()

dfhReception = dataFrameHolder("reception",dfReception)
dfhReception.upload()

dfhRush = dataFrameHolder("rush",dfRush)
dfhRush.upload()