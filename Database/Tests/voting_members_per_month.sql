DROP TABLES IF EXISTS
    JulyAttendance,
    AugAttendance,
	SeptAttendance,
    OctAttendance,
    NovAttendance,
    DecAttendance,
    
    ArchivedMembers,
    ArchivedMembers2018,
    ArchivedMembers2019,
    
    CurrentMembers;

CREATE TABLE SeptAttendance SELECT distinct m.id, m.firstName, m.lastName FROM Members m
	JOIN MeetingAttendance ma ON ma.memberID = m.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2019-09-01 00:00:00' AND me.meetingDate < '2019-09-30 23:59:59'
GROUP BY m.id;

CREATE TABLE OctAttendance SELECT distinct m1.id, m1.firstName, m1.lastName FROM Members m1
	JOIN MeetingAttendance ma ON ma.memberID = m1.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2019-10-01 00:00:00' AND me.meetingDate < '2019-10-31 23:59:59'
GROUP BY m1.id;

CREATE TABLE NovAttendance SELECT distinct m2.id, m2.firstName, m2.lastName FROM Members m2
	JOIN MeetingAttendance ma ON ma.memberID = m2.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2019-11-01 00:00:00'
GROUP BY m2.id;

SELECT s.firstName, s.lastName FROM SeptAttendance s
	JOIN OctAttendance o ON o.id = s.id
	JOIN NovAttendance n ON n.id = o.id;
    
-- use testgdc;