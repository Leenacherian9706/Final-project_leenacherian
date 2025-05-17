create database Sales;
use sales;
CREATE TABLE superstore_sales (Row_ID INT, Order_ID VARCHAR(20), Order_Date DATE, Ship_Date DATE, Ship_Mode VARCHAR(50), Customer_ID VARCHAR(20), Customer_Name VARCHAR(100), Segment VARCHAR(50), Country VARCHAR(50), City VARCHAR(50), State VARCHAR(50), Postal_Code VARCHAR(10), Region VARCHAR(50), Product_ID VARCHAR(20), Category VARCHAR(50), Sub_Category VARCHAR(50), Product_Name VARCHAR(200), Sales DECIMAL(10,2), Quantity INT, Discount DECIMAL(5,2), Profit DECIMAL(10,2));
DELETE FROM superstore_sales
WHERE Profit IS NULL OR Sales IS NULL OR Category IS NULL;
SELECT * FROM superstore_sales
WHERE Profit IS NULL OR Sales IS NULL OR Category IS NULL
   OR Sub_Category IS NULL OR Order_Date IS NULL;
SELECT ï»¿order_id, COUNT(*) AS cnt
FROM superstore_sales
GROUP BY ï»¿order_id
HAVING cnt > 1;
DELETE s1
FROM superstore_sales s1
JOIN superstore_sales s2
ON s1.`ï»¿order_id` = s2.`ï»¿order_id`
AND s1.Row_ID > s2.Row_ID;
select * from superstore_sales;
ALTER TABLE superstore_sales
ADD COLUMN Row_ID int NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE superstore_sales
drop  Row_ID ;
SELECT `ï»¿order_id`, COUNT(*) AS cnt
FROM superstore_sales
GROUP BY `ï»¿order_id`
HAVING cnt > 1;
SELECT 
    category,
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM superstore_sales
GROUP BY category, sub_category
ORDER BY profit_margin_percent ASC;
select * from superstore_sales;