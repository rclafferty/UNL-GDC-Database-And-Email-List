SELECT m.firstName, m.lastName, maj.title, s.title, m.githubUsername, m.discordUsername FROM gdc.Members m
	JOIN gdc.Major maj ON maj.id = m.majorID
    JOIN gdc.SchoolYear s ON s.id = m.yearID
;

USE Class;
DROP TABLE FullDetails;
CREATE TABLE FullDetails SELECT m.firstName, m.lastName, maj.major AS 'majorID', doubleMaj.major AS 'doubleMajorID', s.schoolYear AS 'yearID', m.github, m.discord, m.googleDrive FROM Members m
	JOIN Majors maj ON maj.id = m.majorID
    JOIN Majors doubleMaj ON doubleMaj.id = m.doubleMajorID
    JOIN SchoolYears s ON s.id = m.yearID
;

SELECT * FROM FullDetails;
SELECT * FROM FullDetails WHERE major LIKE 'N/A' OR schoolYear LIKE 'N/A';

SELECT * FROM SchoolYears;

DROP TABLE Fall2018Attendance;
CREATE TABLE Fall2018Attendance SELECT m.meetingDate, COUNT(mem.id) AS 'Members', mt.meetingType FROM MeetingAttendance ma
	JOIN Meetings m ON ma.meetingID = m.id
    JOIN Members mem ON ma.memberID = mem.id
    JOIN MeetingTypes mt ON mt.id = m.typeID
WHERE m.meetingDate > '2018-08-01' AND m.meetingDate < '2018-12-31'
GROUP BY m.id
ORDER BY m.meetingDate ASC;
SELECT * FROM Fall2018Attendance;

DROP TABLE Spring2019Attendance;
CREATE TABLE Spring2019Attendance SELECT m.meetingDate, COUNT(mem.id) AS 'Members', mt.meetingType FROM MeetingAttendance ma
	JOIN Meetings m ON ma.meetingID = m.id
    JOIN Members mem ON ma.memberID = mem.id
    JOIN MeetingTypes mt ON mt.id = m.typeID
WHERE m.meetingDate > '2019-01-01' AND m.meetingDate < '2019-05-31'
GROUP BY m.id
ORDER BY m.meetingDate ASC;
SELECT * FROM Spring2019Attendance;

DROP TABLE Fall2019Attendance;
CREATE TABLE Fall2019Attendance SELECT m.meetingDate, maj.major, COUNT(mem.id) AS 'Members' FROM MeetingAttendance ma
	JOIN Meetings m ON ma.meetingID = m.id
    JOIN Members mem ON ma.memberID = mem.id
    JOIN MeetingTypes mt ON mt.id = m.typeID
    JOIN Majors maj ON maj.id = mem.majorID
WHERE m.meetingDate > '2019-08-01' AND m.meetingDate < '2019-12-31'
GROUP BY maj.id, m.id
ORDER BY m.meetingDate ASC;
SELECT * FROM Fall2019Attendance;

DROP TABLE VotingMemberAttendance;
CREATE TABLE VotingMemberAttendance SELECT m.meetingDate, COUNT(mem.id) AS 'Members' FROM MeetingAttendance ma
	JOIN Meetings m ON ma.meetingID = m.id
    JOIN Members mem ON ma.memberID = mem.id
    JOIN MeetingTypes mt ON mt.id = m.typeID
    JOIN Majors maj ON maj.id = mem.majorID
WHERE m.meetingDate > '2019-08-01' AND m.meetingDate < '2019-12-31'
GROUP BY maj.id, m.id
ORDER BY m.meetingDate ASC;
SELECT * FROM VotingMemberAttendance;