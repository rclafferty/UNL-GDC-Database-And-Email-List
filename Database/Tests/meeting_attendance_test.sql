USE Class;
SELECT me.topic, CONCAT(m.firstName, ' ', m.lastName) AS 'Member Name' FROM MeetingAttendance ma
	JOIN Meetings me ON me.id = ma.meetingID
    JOIN Members m ON m.id = ma.memberID
ORDER BY me.id;