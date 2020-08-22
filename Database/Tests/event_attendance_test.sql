USE Class;
SELECT e.name, l.name, et.eventType, e.startDate, e.endDate FROM Events e
    JOIN Locations l ON l.id = e.locationID
    JOIN EventTypes et ON et.id = e.eventTypeID;

SELECT e.name, CONCAT(m.firstName, ' ', m.lastName) AS 'Member Name' FROM EventAttendance ea
	JOIN Events e ON e.id = ea.eventID
    JOIN Members m ON m.id = ea.memberID;