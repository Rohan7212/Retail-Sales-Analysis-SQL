-- Total Records
SELECT COUNT(*) FROM orders;

-- Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM orders;

-- Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM orders;

-- Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders;

-- Top Products
SELECT Product_Name,
SUM(Sales) Sales
FROM orders
GROUP BY Product_Name
ORDER BY Sales DESC
LIMIT 10;

-- Sales by Category
SELECT Category,
ROUND(SUM(Sales),2) Sales
FROM orders
GROUP BY Category;

-- Sales by Region
SELECT Region,
ROUND(SUM(Sales),2) Sales
FROM orders
GROUP BY Region;

-- Top Customers
SELECT Customer_Name,
ROUND(SUM(Sales),2) Sales
FROM orders
GROUP BY Customer_Name
ORDER BY Sales DESC
LIMIT 10;

-- Average Order Value
SELECT ROUND(SUM(Sales)/COUNT(DISTINCT Order_ID),2)
AS Avg_Order_Value
FROM orders;

-- Top Profit Products
SELECT Product_Name,
SUM(Profit) Profit
FROM orders
GROUP BY Product_Name
ORDER BY Profit DESC
LIMIT 5;

-- Loss Making Products
SELECT Product_Name,
SUM(Profit) Profit
FROM orders
GROUP BY Product_Name
HAVING Profit<0
ORDER BY Profit;

-- Customer Ranking
SELECT Customer_Name,
SUM(Sales) Sales,
RANK() OVER(ORDER BY SUM(Sales) DESC) Ranking
FROM orders
GROUP BY Customer_Name;

-- Category Contribution
SELECT Category,
ROUND(100*SUM(Sales)/(SELECT SUM(Sales) FROM orders),2)
AS Percentage
FROM orders
GROUP BY Category;

-- Top States
SELECT State,
SUM(Sales) Sales
FROM orders
GROUP BY State
ORDER BY Sales DESC
LIMIT 10;

-- Monthly Sales Trend
SELECT
YEAR(STR_TO_DATE(Order_Date,'%m/%d/%Y')) AS Year,
MONTH(STR_TO_DATE(Order_Date,'%m/%d/%Y')) AS Month,
SUM(Sales) Sales
FROM orders
GROUP BY Year,Month
ORDER BY Year,Month;

-- Repeat Customers
SELECT Customer_Name,
COUNT(DISTINCT Order_ID) Orders_Count
FROM orders
GROUP BY Customer_Name
HAVING Orders_Count>5
ORDER BY Orders_Count DESC;

-- View
SELECT * FROM top_customers
ORDER BY Total_Sales DESC
LIMIT 10;

-- Stored Procedure
CALL GetSalesByRegion('West');