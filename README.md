# ala-indexing

This Repository will host the main SQL files for creating the Ala-Indexing Database as well as the ETL Python script and any other relevant scripts for the project.

# Steps to Create Local Postgres Database and Uploading Data

Creating Database:
1)  Go to the following link: https://www.enterprisedb.com/downloads/postgres-postgresql-downloads 
2)  Select PostgreSQL 10.5 as the Version and your operating system
3)  Click "Download Now"
4)  Go through the standard installation options
5)  Once downloaded, run the "PgAdmin4" application
6)  Using the left sidebar, open the "Servers" dropdown
7)  Right click "Databases" and create a new database, giving it whatever name you prefer
8)  Right click the new database and open the "Query Tool"
9)  Copy the SQL Script titled "db_draft_postgres.sql" from the GitHub repository and paste it into the editor
10) Execute the script to create the tables in the database

Uploading Data:
1) Download Python either through Anaconda (preferred) or from Python.org
2) Go through standard installation steps, and ensure that Python is added to PATH environment variables after downloading
3) Save the script titled "DataUploader_Postgres.py" from the GitHub repository to a text editor
4) Open command prompt
5) Navigate to the current directory where the "DataUploader_Postgres.py" file was saved
6) Run the command: "python <script file name>    (make sure to include ".py" extension to file name)
7) Run test command to ensure data was uploaded to database successfully



# DataEntry Folder Naming Conventions (Outdated Data Uploaded Method)

To save files into this folder, type "DataEntry/" followed by the file name before committing the file.

Example: for conference.csv, paste the Visual Studio Code into the GitHub text box and save the name as "DataEntry/Conference.cs" then click the green button at the bottom to save or commit changes.
