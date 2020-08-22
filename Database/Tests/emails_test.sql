USE Class;
SELECT CONCAT(m.firstName, ' ', m.lastName) AS 'Member', e.email FROM Members m
    JOIN Emails e ON e.memberID = m.id;