DROP PROCEDURE IF EXISTS AddMember;
DROP PROCEDURE IF EXISTS AddArchivedMember;

DELIMITER $$

CREATE PROCEDURE AddMember (
    firstName varchar(15),
    lastName varchar(15),
    major varchar(30),
    doubleMajor varchar(30),
    schoolYear varchar(20),
    github varchar(20),
    discord varchar(20),
    googleDrive varchar(40),
    primaryEmail varchar(40)
)
BEGIN
    DECLARE memberMajor varchar(30);
    DECLARE memberMajorID int;
    DECLARE memberDMajor varchar(30);
    DECLARE memberDMajorID int;
    DECLARE memberYear varchar(20);
    DECLARE memberYearID int;

    DECLARE memberGitHub varchar(20);
    DECLARE memberDiscord varchar(20);
    DECLARE memberGoogleDrive varchar(40);
    
    DECLARE memberIDNumber int;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND BEGIN END;

    IF major IS NULL THEN
        SET memberMajor = 'N/A';
    ELSE
        SET memberMajor = major;
    END IF;

    IF doubleMajor IS NULL THEN
        SET memberDMajor = 'Undeclared';
    ELSE
        SET memberDMajor = doubleMajor;
    END IF;

    IF schoolYear IS NULL THEN
        SET memberYear = 'N/A';
    ELSE
        SET memberYear = schoolYear;
    END IF;

    -- Check major
	SELECT id
	INTO memberMajorID
	FROM Majors m
	WHERE m.major LIKE CONCAT('%', memberMajor, '%');
    
    if memberMajorID is null then
		INSERT INTO Majors (major) VALUE (memberMajor);
        
		SELECT id
		INTO memberMajorID
		FROM Majors m
		WHERE m.major LIKE CONCAT('%', memberMajor, '%');
    end if;

    -- Check double major
	SELECT id
	INTO memberDMajorID
	FROM Majors m
	WHERE m.major LIKE CONCAT('%', memberDMajor, '%');
    
    if memberDMajorID is null then
		INSERT INTO Majors (major) VALUE (memberDMajor);
        
		SELECT id
		INTO memberDMajorID
		FROM Majors m
		WHERE m.major LIKE CONCAT('%', memberDMajor, '%');
	end if;

    -- Check school year
	SELECT id
	INTO memberYearID
	FROM SchoolYears s
	WHERE s.schoolYear LIKE CONCAT('%', memberYear, '%');
    
    if memberYearID is null then
		INSERT INTO SchoolYears (schoolYear) VALUE (memberYear);
        
		SELECT id
		INTO memberYearID
		FROM SchoolYears s
		WHERE s.schoolYear LIKE CONCAT('%', memberYear, '%');
    end if;

    IF github IS NULL THEN
        SET memberGitHub = 'N/A';
    ELSE
        SET memberGitHub = github;
    END IF;

    IF discord IS NULL THEN
        SET memberDiscord = 'N/A';
    ELSE
        SET memberDiscord = discord;
    END IF;
    
    IF googleDrive IS NULL THEN
		SET memberGoogleDrive = 'N/A';
	ELSE
		set memberGoogleDrive = googleDrive;
	END IF;

    INSERT INTO Members (firstName, lastName, majorID, doubleMajorID, yearID, github, discord, googleDrive) VALUES (firstName, lastName, memberMajorID, memberDMajorID, memberYearID, memberGitHub, memberDiscord, memberGoogleDrive);
	
    SELECT id
    INTO memberIDNumber
    FROM Members m
    WHERE m.firstName LIKE firstName AND m.lastName LIKE lastName;
    
    IF primaryEmail IS NOT NULL THEN
		INSERT INTO Emails(memberID, email) VALUE (memberIDNumber, primaryEmail);
	ELSE
		IF googleDrive IS NOT NULL THEN
			INSERT INTO Emails(memberID, email) VALUE (memberIDNumber, googleDrive);
		END IF;
	END IF;

END$$

CREATE PROCEDURE AddArchivedMember(
    firstName varchar(15),
    lastName varchar(15)
)
BEGIN
	CALL AddMember(firstName, lastName, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
END$$

DELIMITER ;