-- Insert Query for the info table
Insert into adult1.info (Age, Sex, Race, Native_Country, Education_Id, Marital_Id, Metrics_Id, Workclass, Occupation, Hours_per_week, Income )
SELECT n.age, n.Sex, n.Race, n.`Native-Country`, e.Education_Id, m.Marital_Id, met.Metrics_Id, n.workclass, n.occupation, n.`hours-per-week`, n.Income
FROM adult1.`new` n 
LEFT JOIN education e ON  n.education = e.education
LEFT JOIN Marital_Info m ON n.`marital-status` = m.Marital_Status and n.Relationship = m.Relationship
LEFT JOIN metrics met ON n.demogweight = met.Demo_weight and n.`capital-gain`=met.Capital_gain and n.`capital-loss`= met.Capital_loss;

-- Insert Query for the education table

INSERT INTO education(Education_num, Education)
  SELECT DISTINCT `education-num`, education
  FROM adult1.New;
  
-- Insert Query for the metrics table

INSERT INTO metrics ( Demo_Weight, Capital_gain, Capital_loss )
SELECT DISTINCT demogweight, `capital-gain`, `capital-loss`
FROM adult1.New;

-- Insert Query for the marital_info table

INSERT INTO MARITAL_INFO ( Marital_status, Relationship )
SELECT DISTINCT `marital-status`, relationship
FROM adult1.New;