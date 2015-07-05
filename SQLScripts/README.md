This is where the sql scripts to create tables and to query the tables will go.

CREATE TABLE student
(
studentID int IDENTITY(1,1),
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
password varchar(20) NOT NULL,
email varchar(50) NOT NULL UNIQUE,
PRIMARY KEY (studentID)
);

/*admin table, ISA relationship with student*/
CREATE TABLE admin
(
adminID int REFERENCES student(studentID),
PRIMARY KEY (adminID)
);

CREATE TABLE rso
(
rsoID int IDENTITY(1,1),
name varchar(50),
PRIMARY KEY (rsoID)
);


/* 
pubprirso values:

0 public university event
1 private university event
2 RSO event
*/

CREATE TABLE event
(
eventID int IDENTITY(1,1),
type varchar(100),
name varchar(100),
contact_phone varchar(20),
contact_email varchar(50),
date DATE,
time TIME,
pubprirso int,
PRIMARY KEY (eventID)
);

CREATE TABLE university 
(
universityID int IDENTITY(1,1),
name varchar(30),
initials varchar(10),
description varchar(1000),
PRIMARY KEY (universityID)
);

/*director table, ISA relationship with student*/
CREATE TABLE director
(
directorID int REFERENCES student(studentID),
PRIMARY KEY (directorID)
);