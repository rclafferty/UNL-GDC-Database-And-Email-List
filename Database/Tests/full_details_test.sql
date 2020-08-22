USE Class;
SELECT m.firstName, m.lastName, maj.title, s.title, m.githubUsername, m.discordUsername FROM gdc.Members m
	JOIN gdc.Major maj ON maj.id = m.majorID
    JOIN gdc.SchoolYear s ON s.id = m.yearID
;