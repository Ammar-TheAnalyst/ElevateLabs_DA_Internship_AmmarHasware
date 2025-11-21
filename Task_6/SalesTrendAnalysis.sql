-- Monthly Total Revenue for each month
SELECT YEAR(Date) AS Year, MONTH(Date) AS Month,
ROUND(SUM(`Total Revenue`),2) AS Total_Monthly_Revenue
FROM online_sales
GROUP BY `Year`, `Month`;

-- Monthly Order Volume (number of transactions).
SELECT YEAR(Date) AS Year, MONTH(Date) AS Month,
COUNT(DISTINCT `Transaction ID`) AS Order_Volume
FROM online_sales
GROUP BY `Year`, `Month`; 


-- Top 3 Best-Selling Product Categories
SELECT `Product Category`,
ROUND(SUM(`Total Revenue`),2) AS Total_Category_Revenue
FROM online_sales
GROUP BY `Product Category`
ORDER BY Total_Category_Revenue DESC
LIMIT 3;


-- Most Popular Payment Method ONLY Between March and June.
SELECT `Payment Method`,
COUNT(*) AS Total_Transactions
FROM online_sales
WHERE `Date` BETWEEN '2024-03-01' AND '2024-06-30'
GROUP BY `Payment Method`
ORDER BY Total_Transactions DESC
;


