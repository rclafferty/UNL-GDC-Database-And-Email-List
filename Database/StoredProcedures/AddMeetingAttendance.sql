DROP PROCEDURE IF EXISTS AddMeetingAttendance;
DROP PROCEDURE IF EXISTS AddMeeting;
DROP PROCEDURE IF EXISTS AddMeetingType;

DELIMITER $$

CREATE PROCEDURE AddMeetingType (
    meetingType varchar(40)
)
BEGIN
    IF meetingType IS NOT NULL THEN
        INSERT INTO MeetingTypes (meetingType) VALUE (meetingType);
    END IF;
END$$

CREATE PROCEDURE AddMeeting (
    meeting datetime,
    meetingTopic varchar(200),
    locationName varchar(50),
    meetingType varchar(40)
)
BEGIN
    DECLARE meetingLocationID int;
    DECLARE meetingTypeID int;

    SELECT id
    INTO meetingLocationID
    FROM Locations l
    WHERE l.name LIKE locationName;

    SELECT id
    INTO meetingTypeID
    FROM MeetingTypes mt
    WHERE mt.meetingType LIKE meetingType;

    IF meetingLocationID IS NOT NULL THEN
        IF meetingTypeID IS NULL THEN
            CALL AddMeetingType(meetingType);
        END IF;

        SELECT id
        INTO meetingTypeID
        FROM MeetingTypes mt
        WHERE mt.meetingType LIKE meetingType;

		INSERT INTO Meetings (meetingDate, topic, locationID, typeID) VALUE (meeting, meetingTopic, meetingLocationID, meetingTypeID);
	END IF;
END$$

CREATE PROCEDURE AddMeetingAttendance (
    firstName varchar(15),
    lastName varchar(15),
    meeting datetime
)
BEGIN
    DECLARE memberDatabaseID int;
    DECLARE meetingTimeID int;

    SELECT id
    INTO memberDatabaseID
    FROM Members m
    WHERE m.firstName LIKE CONCAT('%', firstName, '%')
        AND m.lastName LIKE CONCAT('%', lastName, '%');

    IF memberDatabaseID IS NOT NULL THEN
    
        SELECT id
        INTO meetingTimeID
        FROM Meetings me
        WHERE me.meetingDate LIKE meeting;

        IF meetingTimeID IS NULL THEN
            INSERT INTO Meetings (meetingDate) VALUE (meeting);

            SELECT id
            INTO meetingTimeID
            FROM Meetings me
            WHERE me.meetingDate LIKE meeting;
        END IF;
        
        INSERT INTO MeetingAttendance (meetingID, memberID) VALUES (meetingTimeID, memberDatabaseID);
	END IF;
END$$

DELIMITER ;