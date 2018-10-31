#loading packages
import pyodbc
import csv
import pandas as pd
import sqlalchemy as sa
import psycopg2
import string
#local file location
fileLoc = r'C:\Users\BPennington17\Downloads\cfbstats-com-2005-1-5-0\\'

#array of file names within folder
dfArray = ['conference', 'stadium', 'team', 'game', 'game-statistics', 'player', 'player-game-statistics', 'team-game-statistics', 'drive', 'play', 'punt', 'punt-return', 'reception', 'rush', 'kickoff', 'kickoff-return', 'pass']

class dfBucket:
    name = 'def'
    df = None
    def __init__(self,name,df):
        self.name = name
        self.df = df

dfBucketArray = [];
#for loop that reads in file name based on fileLoc, and the current string item in dfArray (called "name" here)
for name in dfArray:
    #read csv in based on parameters
    df = pd.read_csv(fileLoc + name + '.csv')
    
    bucket = dfBucket(name,df)
    dfBucketArray.append(bucket)
    
    #replace these three lines with one line to remove punctuation
    df.columns = df.columns.str.replace(' ', '')
    df.columns = df.columns.str.replace('-', '')
    df.columns = df.columns.str.replace('/', '')
    df.columns = df.columns.str.replace('1st', 'First')
    df.columns = df.columns.str.lower()
    
    if name == 'player':
        df["firstname"] = df['firstname'].str.replace('[^\w\s]','')
        df["lastname"] = df['lastname'].str.replace('[^\w\s]','')
        
        df2 = df.copy(deep=True)
        bucket2 = dfBucket('playerdetails',df2)
        dfBucketArray.append(bucket2)
        
        bucket.df.drop('uniformnumber', axis=1, inplace=True)
        bucket.df.drop('class', axis=1, inplace=True)
        bucket.df.drop('position', axis=1, inplace=True)
        bucket.df.drop('height', axis=1, inplace=True)
        bucket.df.drop('weight', axis=1, inplace=True)
        bucket.df.drop('hometown', axis=1, inplace=True)
        bucket.df.drop('homestate', axis=1, inplace=True)
        bucket.df.drop('homecountry', axis=1, inplace=True)
        bucket.df.drop('lastschool', axis=1, inplace=True)
        bucket.df.drop('teamcode', axis=1, inplace=True)
        
        bucket2.df.drop('lastname', axis=1, inplace=True)
        bucket2.df.drop('firstname', axis=1, inplace=True)
        
        
    if name == 'pass':
        df['passerplayercode'] = df['passerplayercode'].astype(int)
        df['receiverplayercode'] = df['passerplayercode'].astype(int)
    
    #removing dashes from table names
    name = name.replace('-', '')
    
    for buck in dfBucketArray:
        buck.name = buck.name.replace('-','')
        cleanedName = buck.name + '_cleaned.csv'
        buck.df.to_csv(r'C:\Users\BPennington17\Desktop\cleaned\\' + cleanedName, index=False)
        conn = psycopg2.connect("host=capstonealaindexing2018.postgres.database.azure.com dbname=test user=hstandeffer@capstonealaindexing2018 password=Alaindexing!")
        cur = conn.cursor()
        fileString = r'C:\Users\BPennington17\Desktop\cleaned\\' + name + '_cleaned.csv'
        with open(fileString,'r') as f"
            next(f)
            cur.copy_from(f,name,sep=',')
        conn.commit()
    
    #printing out progress and finally converting DataFrame to SQL
    #print(name)
    #cleanedName = name + '_cleaned.csv'
    #df.to_csv(r'C:\Users\HStandeffer17\Desktop\cleaned\\' + cleanedName, index=False)
    
    #conn = psycopg2.connect("host=capstonealaindexing2018.postgres.database.azure.com dbname=test user=hstandeffer@capstonealaindexing2018 password=Alaindexing!")
    #cur = conn.cursor()
    #fileString = r'C:\Users\HStandeffer17\Desktop\cleaned\\' + name + '_cleaned.csv'
    #with open(fileString, 'r') as f:
        # Notice that we don't need the `csv` module.
    #    next(f)  # Skip the header row.
    #    cur.copy_from(f, name, sep=',')
    
    #conn.commit()
