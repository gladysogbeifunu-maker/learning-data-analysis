
-- DISPLAY ALL STUDENTS RECORDS
SELECT * FROM dbo.exams;
--SHOW ONLY GENDER AND WRITING SCORE
SELECT * gender, writing_score FROM dbo.exams;
-- FILTER STUDENTS WITH MARKS > 80
SELECT * FROM dbo.exams WHERE math_score > 80;
--SORT BY MARKS DESCENDING 
SELECT * FROM dbo.exams ORDER BY math_score DESC;
--COUNT TOTAL STUDENTS
SELECT COUNT(*) AS total_students FROM dbo.exams;

-- EMPLOYERS FROM SALES DEPARTMENT
SELECT * FROM dbo.employee_records WHERE department = 'SALES';
--EMPLOYEES EARNING BETWEEN 40,000 & 60,000
SELECT * FROM dbo.employee_records WHERE salary BETWEEN 40000 and 60000;
--EMPLOYEES NOT LIVING IN DELHI
SELECT * FROM dbo.employee_records WHERE Country <>'DELHI';
-- NAMES STARTING WITH A
SELECT * FROM dbo.employee_records WHERE employee_Name LIKE 'A%';

--TOTAL REVEUNE 
SELECT SUM(amount) AS total_revenue FROM dbo.[Sales Dataset];
--AVERAGE ORDER AMOUNT
SELECT AVG(amount) AS avg_order_amount FROM dbo.[Sales Dataset];
--ORDER COUNT PER CUSTOMERS
SELECT CustomerName, COUNT(order_ID) AS total_order FROM dbo.[Sales Dataset] GROUP BY CustomerName;
--HIGHEST AND LOWEST ORDER AMOUNT
SELECT MAX(Amount) AS highest_order, MIN(Amount) AS lowest_order FROM dbo.[Sales Dataset];

--TOTAL SALES AMOUNT PER CATEGORY
SELECT Category, SUM(Sales) AS total_sales FROM dbo.Ecommerce_Sales_Data_2024_2025 GROUP BY Category;
--TOTAL QUANTITY SOLD PER PRODUCT
SELECT  Product_Name, SUM(quantity) AS total_quantity FROM  dbo.Ecommerce_Sales_Data_2024_2025 GROUP BY Product_Name;
--AVERAGE PRICE PER CATEGORY
SELECT Category, AVG(Unit_Price) AS avg_price FROM dbo.Ecommerce_Sales_Data_2024_2025 GROUP BY category;
-- CATEGORY WITH THE MOST UNIT SOLD
SELECT Order_ID, SUM(Quantity) AS total_units GROUP BY Category ORDER BY total_units DESC;

--PRODUCT ABOVE AVERAGE PRICE
SELECT * FROM dbo.merch_sales WHERE Sales_Price > (SELECT AVG(Sales_Price) FROM dbo.merch_sales);
--HIGHEST PRICED PRODUCT
SELECT * FROM dbo.merch_sales WHERE Sales_Price = (SELECT MAX(Sales_Price) FROM dbo.merch_sales);
--PRODUCT CHEAPER THAN CLOTHING
SELECT * FROM dbo.merch_sales WHERE Sales_Price < (SELECT Sales_Price WHERE Product_Category = 'Clothing');
--RAKE PRODUCT BY SALES
SELECT Category, amount, RANK() OVER (ORDER BY amount DESC) AS sales_rank FROM dbo.[Sales Dataset];
--RUNNING TOTAL OF SALES
SELECT Quantity, amount, SUM(amount) OVER (ORDER BY quantity) AS running_total FROM dbo.[Sales Dataset];
--ROW  NUMBER PER PRODUCT
SELECT Category, amount, ROW_NUMBER() OVER (PARTITION BY Category ORDER BY quantity) AS row_num FROM dbo.[Sales Dataset];
--MONTH-WISE SALES TREND
SELECT  DATEPART(MONTH, order_date) AS month, SUM(amount) AS total_sales FROM dbo.[Sales Dataset] 
GROUP BY DATEPART(MONTH, order_date) ORDER BY month;
--SALARY CATEGORY
SELECT Employee_Name, salary,CASE WHEN salary >= 80000 THEN 'High Salary' WHEN salary >= 40000 THEN 'Medium'
  ELSE 'Low' END AS salary_category FROM employee_records;
  --BONUS PERCENTAGE
SELECT Employee_name, salary, CASE WHEN salary >= 80000 THEN 0.20 WHEN salary >= 40000 THEN 0.10
  ELSE 0.05 END AS bonus_percentage FROM employee_records;
  --PERFORMANCE GRADE
SELECT Employee_Name, salary,CASE WHEN salary >= 90000 THEN 'A'  WHEN salary >= 60000 THEN 'B'
  ELSE 'C' END AS performance_grade FROM employee_records;
--TOTAL REVENUE BY CITY
SELECT city, SUM(amount) AS total_revenue FROM dbo.[Sales Dataset] GROUP BY city;
--MOST USED PAYMENT METHOD
SELECT PaymentMode, COUNT(*) AS usage_count
  FROM dbo.[Sales Dataset] GROUP BY PaymentMode ORDER BY usage_count DESC;
--DAILY & MONTHLY SALES
-- Daily
SELECT order_date, SUM(amount) FROM dbo.[Sales Dataset] GROUP BY order_date;

-- Monthly
SELECT DATEPART(MONTH, order_date) AS month, SUM(amount)
FROM dbo.[Sales Dataset] GROUP BY Order_Date;
--TOP 10 CUSTOMER BY REVENUE
SELECT TOP 10 CustomerName, SUM(amount) AS total_spent FROM dbo.[Sales Dataset]
GROUP BY CustomerName ORDER BY total_spent DESC;




 





