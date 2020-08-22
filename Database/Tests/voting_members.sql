DROP TABLES IF EXISTS
	FallAttendance,
    
	SeptAttendance,
    OctAttendance,
    NovAttendance,
    
    ArchivedMembers,
    ArchivedMembers2018,
    ArchivedMembers2019,
    
    CurrentMembers;
	
SELECT COUNT(*) FROM (
	SELECT distinct firstName, lastName FROM Members m
		JOIN MeetingAttendance ma ON ma.memberID = m.id
		JOIN Meetings me ON me.id = ma.meetingID
	WHERE me.meetingDate > '2019-09-01 00:00:00' AND me.meetingDate < '2019-09-30 23:59:59'
	GROUP BY m.id
) c;
    
CREATE TABLE CurrentMembers SELECT distinct m.id, m.firstName, m.lastName FROM Members m
	JOIN MeetingAttendance ma ON ma.memberID = m.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2019-08-01 00:00:00'
GROUP BY m.id;

-- From the query above
SELECT * FROM CurrentMembers;
    
CREATE TABLE ArchivedMembers SELECT distinct m.id, m.firstName, m.lastName FROM Members m
	JOIN MeetingAttendance ma ON ma.memberID = m.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2018-08-01 00:00:00' AND me.meetingDate < '2019-7-31 23:59:59' AND m.id NOT IN (
	SELECT id FROM CurrentMembers
)
GROUP BY m.id;

-- From the query above
SELECT * FROM ArchivedMembers;
SELECT firstName, lastName FROM ArchivedMembers;
    
CREATE TABLE ArchivedMembers2018 SELECT distinct m.id, m.firstName, m.lastName FROM Members m
	JOIN MeetingAttendance ma ON ma.memberID = m.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2018-08-01 00:00:00' AND me.meetingDate < '2018-12-31 23:59:59'
GROUP BY m.id;

-- From the query above
SELECT * FROM ArchivedMembers2018;

CREATE TABLE ArchivedMembers2019 SELECT distinct m.id, m.firstName, m.lastName FROM Members m
	JOIN MeetingAttendance ma ON ma.memberID = m.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2019-01-01 00:00:00' AND me.meetingDate < '2019-05-31 23:59:59'
GROUP BY m.id;

-- From the query above
SELECT COUNT(*) FROM ArchivedMembers2019;
SELECT * FROM ArchivedMembers2019;
    
CREATE TABLE FallAttendance SELECT distinct m.id, m.firstName, m.lastName FROM Members m
	JOIN MeetingAttendance ma ON ma.memberID = m.id
	JOIN Meetings me ON me.id = ma.meetingID
WHERE me.meetingDate > '2019-08-01 00:00:00' AND me.meetingDate < '2019-12-31 23:59:59'
GROUP BY m.id;

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

INSERT INTO MemberCount(calendarDate, count)
SELECT '2018-12-01', COUNT(DISTINCT id)
FROM (
	SELECT DISTINCT count.id, count.firstName, count.lastName, count.meetingDate FROM (
		SELECT distinct m.id, m.firstName, m.lastName, me.meetingDate FROM Members m
			JOIN MeetingAttendance ma ON ma.memberID = m.id
			JOIN Meetings me ON me.id = ma.meetingID
		WHERE me.meetingDate > '2018-09-01' AND me.meetingDate < '2018-10-01'
		GROUP BY m.id
	) as count
		INNER JOIN (
			SELECT distinct m.id, m.firstName, m.lastName FROM Members m
				JOIN MeetingAttendance ma ON ma.memberID = m.id
				JOIN Meetings me ON me.id = ma.meetingID
			WHERE me.meetingDate > '2018-10-01' AND me.meetingDate < '2018-11-01'
			GROUP BY m.id
		) as count2
		INNER JOIN (
			SELECT distinct m.id, m.firstName, m.lastName FROM Members m
				JOIN MeetingAttendance ma ON ma.memberID = m.id
				JOIN Meetings me ON me.id = ma.meetingID
			WHERE me.meetingDate > '2018-11-01' AND me.meetingDate < '2018-12-01'
			GROUP BY m.id
		) as count3
        
        -- GROUP BY meetingDate
) as ids
ORDER BY id;

SELECT meet.meetingDate, maj.major, COUNT(ma.memberID) FROM Meetings meet
	JOIN MeetingAttendance ma ON ma.meetingID = meet.id
    JOIN Members m ON m.id = ma.memberID
    JOIN Majors maj ON maj.id = m.majorID
--     JOIN (
-- 		SELECT COUNT(*) AS 'count' FROM Majors accMaj
-- 			JOIN Members accM ON accM.majorID = accMaj.id
--             JOIN MeetingAttendance accMA ON accMA.memberID = accM.id
--             JOIN Meetings accME ON accME.id = accMA.meetingID
-- 		WHERE accMaj.major LIKE 'Accounting'
--     ) accCount
GROUP BY meet.id, maj.id
ORDER BY meet.meetingDate, maj.major;

SELECT DISTINCT major FROM Majors;

-- SELECT distinct * FROM Members m
-- 	JOIN MeetingAttendance ma ON ma.memberID = m.id
-- 	JOIN Meetings me ON me.id = ma.meetingID
-- WHERE me.meetingDate > '2018-09-01' AND me.meetingDate < '2018-10-01'
-- GROUP BY m.id