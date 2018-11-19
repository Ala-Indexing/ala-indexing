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
import os;

engine = create_engine("mysql+pymysql://brandon:AlaIndexing@35.186.183.201/AlaIndexing", echo=False)

#Create a DataFrame holder that cleans dataframes, and holds the table's name for later use
class dataFrameHolder:
    def __init__(self,tableName,dataFrame):
        self.tableName = tableName
        self.dataFrame = dataFrame
    def clean(self,columnName):
        self.dataFrame.drop_duplicates(subset=columnName,keep='first',inplace=True)
    def upload(self):
        self.dataFrame.to_sql(name = self.tableName,con=engine,if_exists='append',index = False,chunksize=1000)
        print("Uploaded table",self.tableName)
    def normalize(self,newTableName,dropColumns1,dropColumns2):
        normDataFrame = self.dataFrame.drop(dropColumns2,axis = 1)
        self.dataFrame.drop(dropColumns1,axis = 1,inplace=True)
        return dataFrameHolder(newTableName,normDataFrame)

def loadCSV(fileLOC):
    dfhGame = dataFrameHolder("pbpGame",pd.read_json(fileLOC, orient='columns'))
    dfhDrive = dfhGame.normalize(newTableName='pbpDrive',dropColumns1=['defenseAbbr','defenseId','defenseTeam','driveIndex','offenseAbbr','offenseId','offenseTeam','quarter','awayScore','clock','description','distance','down','driveIndex','endYardLine','homeScore','playIndex','type','yardLine','yardsGained'],dropColumns2=['awayAbbr','awayId','awayTeam','homeAbbr','homeId','homeTeam','week','year'])
    dfhGame.clean('gameId')
    dfhPlay = dfhDrive.normalize(newTableName='pbpPlay',dropColumns1=['awayScore','clock','description','distance','down','endYardLine','homeScore','playIndex','type','yardLine','yardsGained'],dropColumns2=['defenseAbbr','defenseId','defenseTeam','offenseAbbr','offenseId','offenseTeam','quarter'])
    dfhDrive.clean(['gameId','driveIndex'])
    dfhGame.upload()
    dfhDrive.upload()
    dfhPlay.upload()

def loadDir(dirLOC):
    names = os.listdir(dirLOC)
    for name in names:
        print(name)
        loadCSV(os.path.join(dirLOC,name))

fileLoc = input("Drop in a file *.json or folder and press enter: ")

fileLoc = fileLoc.strip('\"')

while fileLoc!="done":
    if fileLoc.endswith('.json'):
        loadCSV(fileLoc)
    else:
        loadDir(fileLoc)
    fileLoc = input("Drop in a file *.json, folder, or type done and press enter: ").strip('\"')