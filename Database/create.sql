CREATE DATABASE IF NOT EXISTS Class;
use Class;

-- USE GeneralTest;

DROP TABLE IF EXISTS
    EventAttendance,
    Events,
    EventTypes,
    Locations,
    MeetingAttendance,
    Meetings,
    MeetingTypes,
    Emails,
    Members,
    Majors,
    SchoolYears;

CREATE TABLE IF NOT EXISTS Majors (
    id int PRIMARY KEY AUTO_INCREMENT,
    major varchar(30) NOT NULL,

    # Uniques
    UNIQUE(major),

    # Indexes
    INDEX(major)
);

CREATE TABLE IF NOT EXISTS SchoolYears (
    id int PRIMARY KEY AUTO_INCREMENT,
    schoolYear varchar(10) NOT NULL,

    # Uniques
    UNIQUE(schoolYear),

    # Indexes
    INDEX(schoolYear)
);

CREATE TABLE IF NOT EXISTS Members (
    id int PRIMARY KEY AUTO_INCREMENT,

    # Primary info
    firstName varchar(15) NOT NULL,
    lastName varchar(15) NOT NULL,
    
    # School info
    majorID int DEFAULT 1,
        FOREIGN KEY(majorID) references Majors(id),
    doubleMajorID int DEFAULT 1,
        FOREIGN KEY (doubleMajorID) references Majors(id),
    yearID int DEFAULT 1,
        FOREIGN KEY(yearID) references SchoolYears(id),

    # Club Resources Info
    github varchar(20) NOT NULL DEFAULT 'N/A',
    discord varchar(20) NOT NULL DEFAULT 'N/A',
    googleDrive varchar(40) NOT NULL DEFAULT 'N/A',

    # Indexes
    INDEX(firstName, lastName),
    INDEX(github, discord, googleDrive),

    # Uniques
    UNIQUE(firstName, lastName)
);

CREATE TABLE IF NOT EXISTS Emails (
    memberID int,
        FOREIGN KEY(memberID) references Members(id),
    email varchar(30) NOT NULL,

    # Indexes
    INDEX(email),

    # Uniques
    UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS MeetingTypes (
    id int PRIMARY KEY AUTO_INCREMENT,
    meetingType varchar(20) NOT NULL,

    # Uniques
    UNIQUE(meetingType)
);

CREATE TABLE IF NOT EXISTS Locations (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    building varchar(30),
    room int,
    city varchar(20) NOT NULL DEFAULT 'Lincoln',
    state varchar(2) NOT NULL DEFAULT 'NE',

    # Indexes
    INDEX(name, building, room, city, state),

    # Uniques
    UNIQUE(name),
    UNIQUE(building, room, city, state)
);

CREATE TABLE IF NOT EXISTS Meetings (
    id int PRIMARY KEY AUTO_INCREMENT,
    typeID int DEFAULT 1,
        FOREIGN KEY(typeID) references MeetingTypes(id),
    meetingDate datetime NOT NULL,
    topic varchar(200),
    locationID int,
        FOREIGN KEY (locationID) REFERENCES Locations(id),
    
    # Uniques
    UNIQUE(meetingDate),

    # Indexes
    INDEX(topic)
);

CREATE TABLE IF NOT EXISTS MeetingAttendance (
    meetingID int,
        FOREIGN KEY(meetingID) references Meetings(id),
    memberID int,
        FOREIGN KEY(memberID) references Members(id),
        
	# Uniques
    UNIQUE(meetingID, memberID)
);

CREATE TABLE IF NOT EXISTS EventTypes (
    id int PRIMARY KEY AUTO_INCREMENT,
    eventType varchar(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Events (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    locationID int,
        FOREIGN KEY(locationID) references Locations(id),
    eventTypeID int,
        FOREIGN KEY(eventTypeID) references EventTypes(id),
    startDate datetime NOT NULL,
    endDate datetime NOT NULL
);

CREATE TABLE IF NOT EXISTS EventAttendance (
    eventID int,
        FOREIGN KEY(eventID) references Events(id),
    memberID int,
        FOREIGN KEY(memberID) references Members(id)
);