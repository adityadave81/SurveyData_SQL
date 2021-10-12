USE adult1;
DROP PROCEDURE IF EXISTS individual;

DELIMITER //

CREATE PROCEDURE individual()
BEGIN
DECLARE count INT DEFAULT 0;
DECLARE income_type VARCHAR(200);
DECLARE education_num INT;
DECLARE occupation_type VARCHAR(300);
DECLARE native_country VARCHAR(40);


DECLARE pro_cursor CURSOR FOR 

Select i.Native_Country, i.Occupation, e.Education_num, i.Income
	From info i JOIN education e ON i.Education_Id = e.Education_Id
    Group BY i.Native_Country,i.Occupation, e.Education_Num, i.Income
	ORDER BY i.Native_Country ASC;

                                    
DECLARE continue handler for not found set count = 1;
DROP TABLE IF EXISTS native;
CREATE TABLE IF NOT EXISTS native
      (Native_Country VARCHAR(40) NOT NULL, occupation_type VARCHAR(300),  education_num INT, income_type VARCHAR(200));
 
OPEN pro_cursor;

testLoop : loop
FETCH pro_cursor INTO native_country, occupation_type, education_num, income_type;

IF count = 1 THEN
 LEAVE testloop;
END IF;

INSERT INTO native
        VALUES(native_country, occupation_type, education_num, income_type);

END loop testLoop; 

CLOSE pro_cursor;
    
SELECT  * FROM native;
    
END//

call individual();  