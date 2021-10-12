USE adult1;
DROP PROCEDURE IF EXISTS avgeducation;

DELIMITER //

CREATE PROCEDURE avgeducation()
BEGIN
DECLARE count INT DEFAULT 0;
DECLARE avg_edu INT;
DECLARE marital_status VARCHAR(300);
DECLARE race VARCHAR(300);
DECLARE sex VARCHAR(300);
DECLARE native_country_2 VARCHAR(40);


DECLARE avg_edu CURSOR FOR 

SELECT i.Native_Country, m.Marital_Status, i.Race, i.Sex, ROUND( AVG(Education_Num)) as avg_edu
    FROM info i
    LEFT JOIN marital_info m ON m.Marital_Id = i.Marital_Id
    LEFT JOIN education e ON e.Education_Id = i.Education_Id
    GROUP BY i.Native_Country, m.Marital_Status, i.Race, i.Sex
    ORDER BY avg_edu ASC;

                                    
DECLARE continue handler for not found set count = 1;
DROP TABLE IF EXISTS Avg_edutable;
CREATE TABLE IF NOT EXISTS Avg_edutable
      (Native_Country VARCHAR(40) NOT NULL, Marital_Status VARCHAR(100), Race VARCHAR(300), Sex VARCHAR(100), Avg_Education INT);
 
OPEN avg_edu;

testLoop : loop
FETCH avg_edu INTO native_country_2, marital_status, race, sex, avg_edu;

IF count = 1 THEN
 LEAVE testloop;
END IF;

INSERT INTO Avg_edutable
        VALUES(native_country_2, marital_status, race, sex, avg_edu);

END loop testLoop; 

CLOSE avg_edu;
    
SELECT  * FROM Avg_edutable ORDER BY Avg_Education ASC;
    
END//

call avgeducation();    