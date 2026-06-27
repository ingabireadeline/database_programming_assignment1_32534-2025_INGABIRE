-- Multiple CTEs: First calculate regional sales, then filter high performers
WITH RegionSales AS (
    SELECT s.Region, SUM(o.TotalAmount) AS TotalSales
    FROM SUPPLIERS s 
    JOIN COFFEE_BEANS b ON s.SupplierID = b.SupplierID
    JOIN ORDERS o ON b.BeanID = o.BeanID
    GROUP BY s.Region
),
HighSalesRegions AS (
    SELECT Region, TotalSales 
    FROM RegionSales 
    WHERE TotalSales > 2000
)
SELECT * FROM HighSalesRegions ORDER BY TotalSales DESC;
