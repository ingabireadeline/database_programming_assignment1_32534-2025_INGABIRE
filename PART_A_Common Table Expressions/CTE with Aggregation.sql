-- CTE with Aggregation to analyze inventory levels by origin
WITH OriginStats AS (
    SELECT Origin, 
           AVG(StockKg) AS AvgStock, 
           COUNT(*) AS BeanCount
    FROM COFFEE_BEANS 
    GROUP BY Origin
)
SELECT Origin, AvgStock, BeanCount 
FROM OriginStats 
WHERE AvgStock > 300
ORDER BY AvgStock DESC;
