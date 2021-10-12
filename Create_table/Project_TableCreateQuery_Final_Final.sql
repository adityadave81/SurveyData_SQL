DROP DATABASE if exists adults;

CREATE DATABASE adults;


CREATE TABLE IF NOT EXISTS `adults`.`INFO` (
  `Age` INT NOT NULL,
  `Sex` varchar(40) NOT NULL,
  `Race` varchar(40) NOT NULL,
  `Native_Country` varchar(40) NOT NULL,
  `Education_Id` INT NOT NULL,
  `Marital_Id` INT NOT NULL,
  `Metrics_Id` INT NOT NULL,
  `Income_Id` INT NOT NULL,
	constraint FK_1 foreign key (`Info_Id`) references INFO(`Info_Id`),
    constraint FK_2 foreign key (`Education_Id`) references EDUCATION(`Education_Id`),
    constraint FK_3 foreign key (`Marital_Id`) references MARITAL_INFO(`Marital_Id`),
    constraint FK_4 foreign key (`Metrics_Id`) references METRICS(`Metrics_Id`),
    constraint FK_5 foreign key (`Income_Id`) references INCOME(`Income_Id`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `adults`.`EDUCATION` (
  `Education_Id` INT NOT NULL auto_increment,
  `Education_num` INT NOT NULL,
  `Education` varchar(40) NOT NULL,
  primary key(`Education_Id`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `adults`.`MARITAL_INFO` (
  `Marital_Id` INT NOT NULL auto_increment,
  `Marital_status` varchar(40) NOT NULL,
  `Relationship` varchar(20) NOT NULL,
  primary key(`Marital_Id`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `adults`.`METRICS` (
  `Metrics_Id` INT NOT NULL auto_increment,
  `Demo_weight` INT NOT NULL,
  `Capital_gain` INT ,
  `Capital_loss` INT ,
   primary key(`Metrics_Id`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `adults`.`INCOME` (
  `Income_Id` INT NOT NULL auto_increment,
  `Income` INT NOT NULL,
  `Occupation` VARCHAR(50) NOT NULL,
  `Hours_per_week` INT NOT NULL,
  primary key(`Income_Id`)
    )
    ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8mb4
	COLLATE = utf8mb4_0900_ai_ci;

