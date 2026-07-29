CREATE DATABASE retail_analysis;
USE retail_analysis;

CREATE TABLE orders (
    Row_ID INT,
    Order_ID VARCHAR(20),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(30),
    Product_ID VARCHAR(30),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,4)
);

CREATE VIEW top_customers AS
SELECT Customer_Name,
SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Customer_Name;

DELIMITER //

CREATE PROCEDURE GetSalesByRegion(IN region_name VARCHAR(30))
BEGIN
SELECT *
FROM orders
WHERE Region = region_name;
END //

DELIMITER ;