DROP PROCEDURE IF EXISTS AddLocation;
DROP PROCEDURE IF EXISTS AddLocationNameOnly;

DELIMITER $$

CREATE PROCEDURE AddLocation (
    locationName varchar(30),
    building varchar(30),
    room int,
    city varchar(20),
    state varchar(2)
)
BEGIN
    INSERT INTO Locations(name, building, room, city, state) VALUE (locationName, building, room, city, state);
END$$

CREATE PROCEDURE AddLocationNameOnly (
    locationName varchar(20)
)
BEGIN
    INSERT INTO Locations(name) VALUE (locationName);
END$$

DELIMITER ;