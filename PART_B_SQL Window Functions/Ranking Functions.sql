-- ROW_NUMBER(): Assigns a unique sequential number to orders by date
SELECT OrderID, OrderDate, 
       ROW_NUMBER() OVER(ORDER BY OrderDate) AS ChronologicalRow
FROM ORDERS;

-- RANK(): Ranks beans by price, leaving gaps for ties
SELECT BeanName, PricePerKg, 
       RANK() OVER(ORDER BY PricePerKg DESC) AS PriceRank
FROM COFFEE_BEANS;

-- DENSE_RANK(): Ranks suppliers by the number of beans they supply (no gaps)
SELECT SupplierID, COUNT(*) AS BeanCount, 
       DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS SupplierDenseRank
FROM COFFEE_BEANS 
GROUP BY SupplierID;

-- PERCENT_RANK(): Calculates the relative rank of order amounts as a percentage
SELECT OrderID, TotalAmount, 
       PERCENT_RANK() OVER(ORDER BY TotalAmount) AS AmountPercentRank
FROM ORDERS;
