-- CTE combined with JOIN to link supplier names with their sales metrics
WITH SupplierSales AS (
    SELECT b.SupplierID, 
           b.BeanName, 
           SUM(o.QuantityKg) AS TotalQtySold
    FROM COFFEE_BEANS b 
    JOIN ORDERS o ON b.BeanID = o.BeanID
    GROUP BY b.SupplierID, b.BeanName
)
SELECT s.SupplierName, ss.BeanName, ss.TotalQtySold
FROM SUPPLIERS s 
JOIN SupplierSales ss ON s.SupplierID = ss.SupplierID
ORDER BY ss.TotalQtySold DESC;
