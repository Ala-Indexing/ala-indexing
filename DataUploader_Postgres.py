#loading packages
import pyodbc
import csv
import pandas as pd
import sqlalchemy as sa
import psycopg2

#creating engine and connection to database server
#format of create engine: //<user>:<pass>@<dsn>:<port>/<dbname>
#BE SURE TO CHANGE DBNAME TO CORRECT DB

engine = sa.create_engine('postgresql+psycopg2://postgres:alaindexing@localhost:5432/test')

#local file location
fileLoc = r'C:\Users\hcole\Downloads\cfbstats-com-2005-1-5-0-20181001T184640Z-001\cfbstats-com-2005-1-5-0\\'

#array of file names within folder
dfArray = ['conference', 'stadium', 'team', 'game', 'game-statistics', 'player', 'player-game-statistics', 'team-game-statistics', 'drive', 'play', 'punt', 'punt-return', 'reception', 'rush', 'kickoff', 'kickoff-return', 'pass']

#for loop that reads in file name based on fileLoc, and the current string item in dfArray (called "name" here)
for name in dfArray:
    #read csv in based on parameters
    df = pd.read_csv(fileLoc + name + '.csv')
    
    #replace these three lines with one line to remove punctuation
    df.columns = df.columns.str.replace(' ', '')
    df.columns = df.columns.str.replace('-', '')
    df.columns = df.columns.str.replace('/', '')
    df.columns = df.columns.str.replace('1st', 'First')
    df.columns = df.columns.str.replace(' ', '')
    df.columns = df.columns.str.lower()
    
    #removing dashes from table names
    name = name.replace('-', '')
    print(df.columns)
    
    #printing out progress and finally converting DataFrame to SQL
    print(name)            
    df.to_sql(name, engine, if_exists = 'append', index = False)

print('Data Upload Complete!')
