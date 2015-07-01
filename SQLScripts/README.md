This is where the sql scripts to create tables and to query the tables will go.

CREATE TABLE student
(
studentID int IDENTITY(1,1),
first_name varchar(20),
last_name varchar(20),
password varchar(20) NOT NULL,
email varchar(50) NOT NULL UNIQUE,
university varchar(30),
PRIMARY KEY (studentID)
);

CREATE TABLE admin
(
adminID int REFERENCES student(studentID),
PRIMARY KEY (adminID)
);

CREATE TABLE rso
(
rsoID int IDENTITY(1,1),
name varchar(50),
PRIMARY KEY (rosID)
);

CREATE TABLE event
(
eventID int IDENTITY(1,1),
type varchar(100),
name varchar(100),
date DATE,
pubprirso int,
PRIMARY KEY (eventID)
);

CREATE TABLE location 
(
longitutde int,
latitude int,
address varchar(100),
PRIMARY KEY (address)
);

CREATE TABLE university 
(
universityID int IDENTITY(1,1),
name varchar(30),
description varchar(100),
numberofstudents int,
PRIMARY KEY (universityID)
);

CREATE TABLE director
(
directorID int IDENTITY(1,1),
PRIMARY KEY (adminID)
);