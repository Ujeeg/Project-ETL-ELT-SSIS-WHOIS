# ETL - WITH SSIS

## Description:
This project aims to perform ETL and ELT using SQL Server and SSIS. The data and domain used are obtained from the Domain WhoIs database by extracting a few sample data. The applications used for this project are SQL Server 2022 and Visual Studio Code 2022. The data is retrieved from the following domain: http://domainwhoisdatabase.com/whois_database/sample/gtlds/v44/sample/simple/
![Source](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/bf78899c8df9f19fae7737d5fe9e1f113593fdc8/1/Domain.png)


## Objectives:

1. Establish a connection from the domain to the local environment.
2. Download the file from the domain to the local environment.
3.  Create a task to unzip the downloaded file.
4. Establish a connection from the local environment to the OLE DB.
5. Archive the downloaded file.
6. Send email notifications.



## Procedure
### 1. Create a Source Configuration table in a Database.
![](2/2.A. Local Connection DB Server.png)


#### A. Create New DataBase (WhoIsDB)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/677a031628d54e74ce8c577286802082c6e2981f/Whois%20Query.sql)

#### B. Create New Configuration Table (dbo.SourceConfig)


### 2. Create SSIS Package design to Read and Map source configuration data to a Variabel


#### A. Create connection to Local DB SQL SERVER
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/d4e121a16237f40f5b11328ad4d4de325ee70996/2/2.A.%20Local%20Connection%20DB%20Server.png)

#### B. Create New Variable (ConfigObject)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/d4e121a16237f40f5b11328ad4d4de325ee70996/2/2.B.%20Make%20New%20Variable.png)

#### C. Create Project Parameter (URLSource)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/677a031628d54e74ce8c577286802082c6e2981f/2/2.C.%20Make%20Parameter.png)


### 3. Download files from Source URL
#### A. Create and Setting up Foreach Loop Container
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/2/3.A%20Foreach%20Loop%20Container.png)

#### B. Create FileConnection Variable dengan expression URLSource dan Configvalue
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/3/3.B.png)

#### C. Create ConfigValue dengan value file yang akan di download
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/3/3.D%20expression.png)

#### D. Make New Domain Connection (HTTP Connection Manager)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/3/3.D.png)

#### E. Create new Variable for destination (TargetFolderConnection)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/3/3.E.png)

### 4. Create Script Task (Download Source Zipfile)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/4/4.A%201.png)

Create Script 
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/4/4.A%202.png)

### 5. Create Execute Procces Task (Unzip Source File)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/5/5.1.png)

### 6. Create Data Flow Task
#### A. Create Source connection (Flat File Source)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/6/6.A%201.png)

#### B. Create OLE DB connection (OLE DB Destination)
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/6/6.B%201.png)

Checking Mapping Table
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/6/6.B%202.png)

Create Variabel for dynamic
![](https://github.com/Ujeeg/Project-ETL-ELT-SSIS-WHOIS/blob/c489baa976b5ca7fa605e2406152f2d537cf8745/6/6.B%202.1.png)

### 7. Create Achive system
#### A. Create File System Task (Create Folder Archive if Not Exist)
##### a. Make Variable ArchiveFolderPath
#### B. Create File System Task (Move csv file To Archive Folder)
#### B. Create File System Task (Move zip file To Archive Folder)
