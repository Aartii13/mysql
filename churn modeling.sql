use class_11;

CREATE TABLE churnmodeling1 (
        `RowNumber` DECIMAL(38, 0) NOT NULL,
        `CustomerId` DECIMAL(38, 0) NOT NULL,
        `Surname` VARCHAR(23) NOT NULL,
        `CreditScore` DECIMAL(38, 0) NOT NULL,
        `Geography` VARCHAR(7) NOT NULL,
        `Gender` VARCHAR(6) NOT NULL,
        `Age` DECIMAL(38, 0) NOT NULL,
        `Tenure` DECIMAL(38, 0) NOT NULL,
        `Balance` DECIMAL(38, 2) NOT NULL,
        `NumOfProducts` DECIMAL(38, 0) NOT NULL,
        `HasCrCard` BOOL NOT NULL,
        `IsActiveMember` BOOL NOT NULL,
        `EstimatedSalary` DECIMAL(38, 2) NOT NULL,
        `Exited` BOOL NOT NULL);
 LOAD DATA INFILE  
'D:/churnmodeling.csv'
into table ChurnModeling
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;


SELECT surname FROM churnmodeling WHERE surname REGEXP '^[a]' ;  
SELECT surname FROM churnmodeling WHERE surname REGEXP '^[ab]' ;  
SELECT surname FROM churnmodeling WHERE surname REGEXP 'a' ;  


SELECT surname FROM churnmodeling WHERE surname REGEXP 'n.$';
SELECT surname FROM churnmodeling WHERE surname REGEXP '^.{9}$';  
  

SELECT surname FROM churnmodeling WHERE surname REGEXP '^.{12}$';
SELECT creditscore FROM churnmodeling WHERE creditscore REGEXP 76; 

SELECT creditscore FROM churnmodeling WHERE creditscore REGEXP 564; 
SELECT creditscore FROM churnmodeling WHERE creditscore REGEXP 511; 


SELECT ('a' NOT REGEXP '[a-z]') AS not_match ;

SELECT * from churnmodeling;

SELECT surname, creditscore, balance 
FROM churnmodeling   
WHERE surname RLIKE 's$|t$';

SELECT surname, creditscore, balance 
FROM churnmodeling   
where surname RLIKE 't$|d$'; 

SELECT surname, balance
FROM churnmodeling   
WHERE surname RLIKE '..grave'; 

SELECT surname, balance,geography FROM churnmodeling   
WHERE geography RLIKE 'sp.ain'; 

SELECT   
'Javatpoint' LIKE 'Java%' AS 'Match',  
'Javatpoint' NOT LIKE 'Java%' AS 'Not-Match';

SELECT  surname from churnmodeling where Surname LIKE 'ave%';
SELECT  surname from churnmodeling where surname LIKE 'u%';

SELECT * FROM churnmodeling WHERE surname LIKE 'e%';  

SELECT * FROM churnmodeling  WHERE surname LIKE '%.';
SELECT * FROM churnmodeling WHERE surname LIKE '%t';

SELECT * FROM churnmodeling WHERE surname LIKE 'b%.';
SELECT * FROM churnmodeling WHERE surname LIKE 'u%n';

SELECT * FROM churnmodeling WHERE surname  LIKE 'andr_';
SELECT * FROM churnmodeling WHERE surname LIKE 'muldro_';
SELECT * FROM churnmodeling WHERE Surname LIKE 'mcdona%';
SELECT * FROM churnmodeling WHERE surname LIKE 't__ao.';





