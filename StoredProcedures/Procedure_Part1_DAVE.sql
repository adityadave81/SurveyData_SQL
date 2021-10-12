USE adult1;
DROP PROCEDURE IF EXISTS avgbyoccage;

DELIMITER //

CREATE PROCEDURE avgbyoccage()
BEGIN
DECLARE count INT DEFAULT 0;
DECLARE avg_age DECIMAL (9,2);
DECLARE education_type VARCHAR(300);
DECLARE display_string VARCHAR(300);
DECLARE occupation_type VARCHAR(300);
DECLARE native_country_2 VARCHAR(40);


DECLARE avg_cursor CURSOR FOR 

select native_country, round(avg(age),2) as age, education, occupation 
from info i 
JOIN education e ON i.education_id = e.education_id
where income LIKE '%>50K%'
group by e.education,i.occupation,i.native_country 
order by age asc;
-- select native_country, round(avg(age),2) as age, education, occupation  from (
-- 									select distinct i.age, e.education, i.occupation, i.income, i.Native_Country
-- 									from info i 
-- 									JOIN education e ON i.education_id = e.education_id
-- 									where income LIKE '%>50K%'
-- 									) as a
-- 									group by a.education,a.occupation,a.native_country 
-- 									order by age asc;
                                    
                                    
    
DECLARE continue handler for not found set count = 1;
DROP TABLE IF EXISTS Avg_agebyocc;
CREATE TABLE IF NOT EXISTS Avg_agebyocc
      (Native_Country VARCHAR(40) NOT NULL, avg_age DECIMAL (9,2), education_type VARCHAR(300), Occupation VARCHAR(100));
 
OPEN avg_cursor;

testLoop : loop
FETCH avg_cursor INTO native_country_2, avg_age, education_type, occupation_type;

IF count = 1 THEN
 LEAVE testloop;
END IF;

INSERT INTO Avg_agebyocc
        VALUES(native_country_2, avg_age, education_type, occupation_type);

END loop testLoop; 

CLOSE avg_cursor;
    
SELECT  * FROM Avg_agebyocc;
    
END//

call avgbyoccage();    


    