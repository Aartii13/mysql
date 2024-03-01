use class_11;
CREATE TABLE `WalmartSalesData` (
        `Invoice ID` VARCHAR(11) NOT NULL,
        `Branch` VARCHAR(1) NOT NULL,
        `City` VARCHAR(9) NOT NULL,
        `Customer type` VARCHAR(6) NOT NULL,
        `Gender` VARCHAR(6) NOT NULL,
        `Product line` VARCHAR(22) NOT NULL,
        `Unit price` DECIMAL(38, 2) NOT NULL,
        `Quantity` DECIMAL(38, 0) NOT NULL,
        `Tax 5%%` DECIMAL(38, 4) NOT NULL,
        `Total` DECIMAL(38, 4) NOT NULL,
        `Date` varchar (20),
        `Time` varchar(20),
        `Payment` VARCHAR(11) NOT NULL,
        cogs DECIMAL(38, 2) NOT NULL,
        `gross margin percentage` DECIMAL(38, 9) NOT NULL,
        `gross income` DECIMAL(38, 4) NOT NULL,
        `Rating` DECIMAL(38, 1) NOT NULL
);



LOAD DATA INFILE  
'D:\WalmartSalesData.csv'
into table WalmartSalesData
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;


select str_to_date(Date,'%m/%d/%y') from WalmartSalesData;

alter table WalmartSalesData
add column Date_new  date after `Date`;

update WalmartSalesData
set Date_new = str_to_date(`Date`,'%m/%d/%Y');

select * from walmartsalesdata;

SELECT 
	TIME,
    (CASE
		WHEN 'TIME' BETWEEN '00:00:00' AND '12:00:00' THEN 'MORNING'
        WHEN 'TIME' BETWEEN '12:01:00' AND '16:00:00' THEN 'AFTERNOON'
        ELSE 'EVENING'
        END) AS TIME_OF_DAY
	FROM walmartsalesdata;



ALTER TABLE walmartsalesdata ADD COLUMN month_name VARCHAR(10);

UPDATE walmartsalesdata
SET month_name = MONTHNAME(date_new); 

#que 1: Get total sales for each product line

SELECT `Product line`, SUM(`Total`) AS `Total Sales`
FROM `walmartsalesdata`
GROUP BY `Product line`;

#que 2 : Get average rating for each product line.
SELECT `Product line`, AVG(`Rating`) AS `Average Rating`
FROM `walmartsalesdata`
GROUP BY `Product line`


# Que 3: Get total sales for each branch.

SELECT `Branch`, SUM(`Total`) AS `Total Sales`
FROM `walmartsalesdata`
GROUP BY `Branch`;

# Que 4: Get total sales by customer type
SELECT `Customer type`, SUM(`Total`) AS `Total Sales`
FROM `walmartsalesdata`
GROUP BY `Customer type`;



# Que 5: Get total sales by gender
SELECT `Gender`, SUM(`Total`) AS `Total Sales`
FROM `walmartsalesdata`
GROUP BY `Gender`;

#Que 6: Get average gross income
SELECT AVG(`gross income`) AS `Average Gross Income`
FROM `walmartsalesdata`;



#Que 7: Get sales distribution by time of day
SELECT `time_of_day`, COUNT(*) AS `Number of Sales`
FROM `walmartsalesdata`
GROUP BY `time_of_day`;

 #Que 8: Get total sales and average rating for each product line
SELECT 
    `Product line`,
    SUM(`Total`) AS `Total Sales`,
    AVG(`Rating`) AS `Average Rating`
FROM `walmartsalesdata`
GROUP BY `Product line`;


# Que 9: Get total sales for each city and branch
SELECT 
    `City`,
    `Branch`,
    SUM(`Total`) AS `Total Sales`
FROM `walmartsalesdata`
GROUP BY `City`, `Branch`;

# Que 10: Get average total sales and average rating by customer type

SELECT 
    `Customer type`,
    AVG(`Total`) AS `Average Total Sales`,
    AVG(`Rating`) AS `Average Rating`
FROM `walmartsalesdata`
GROUP BY `Customer type`;

# Que 11: Get total sales and average rating by gender
SELECT 
    `Gender`,
    SUM(`Total`) AS `Total Sales`,
    AVG(`Rating`) AS `Average Rating`
FROM `walmartsalesdata`
GROUP BY `Gender`;

# Que 12: Get total sales by payment method


SELECT 
    `Payment`,
    SUM(`Total`) AS `Total Sales`
FROM `walmartsalesdata`
GROUP BY `Payment`;




# Que 13: Get average gross margin percentage by product line
SELECT 
    `Product line`,
    AVG(`gross margin percentage`) AS `Average Gross Margin Percentage`
FROM `walmartsalesdata`
GROUP BY `Product line`;

# Que14: Get total sales and average rating by time of day.

SELECT 
    `time_of_day`,
    SUM(`Total`) AS `Total Sales`,
    AVG(`Rating`) AS `Average Rating`
FROM `walmartsalesdata`
GROUP BY `time_of_day`;


# Que 15: Get top 5 cities with the highest total sales.
SELECT 
    `City`,
    SUM(`Total`) AS `Total Sales`
FROM `walmartsalesdata`
GROUP BY `City`
ORDER BY `Total Sales` DESC
LIMIT 5;

# Que 16: Get total sales and gross income for each branch.

SELECT 
    `Branch`,
    SUM(`Total`) AS `Total Sales`,
    SUM(`gross income`) AS `Total Gross Income`
FROM `walmartsalesdata`
GROUP BY `Branch`;

#	Que 17: Which customer type pays the most in VAT?
SELECT
	`customer type`,
	AVG(`Tax 5%%`) AS total_tax
FROM walmartsalesdata
GROUP BY `customer type`
ORDER BY total_tax ;

#Que 18: Which customer type buys the most?
SELECT
	`customer type`,
    COUNT(*)
FROM walmartsalesdata
GROUP BY `customer type`;

#que 19: Which of the customer types brings the most revenue?
SELECT
	`customer type`,
	SUM(total) AS total_revenue
FROM walmartsalesdata
GROUP BY `customer type`
ORDER BY total_revenue;

#que20:  Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(`Tax 5%%`), 2) AS avg_tax_pct
FROM walmartsalesdata
GROUP BY city 
ORDER BY avg_tax_pct DESC;


#que 21:  What is the gender of most of the customers?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM walmartsalesdata


GROUP BY gender
ORDER BY gender_cnt DESC;









