-- Simple CTE to calculate the global average price
WITH AvgPriceCTE AS (
    SELECT AVG(PricePerKg) AS avg_price 
    FROM COFFEE_BEANS
)
SELECT BeanName, Origin, PricePerKg 
FROM COFFEE_BEANS, AvgPriceCTE 
WHERE PricePerKg > avg_price
ORDER BY PricePerKg DESC;
