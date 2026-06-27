-- NTILE() and CUME_DIST(): Distribute beans into 3 tiers and show cumulative probability
SELECT BeanName, PricePerKg,
       NTILE(3) OVER(ORDER BY PricePerKg) AS PriceTier,
       CUME_DIST() OVER(ORDER BY PricePerKg) AS CumulativeDistribution
FROM COFFEE_BEANS;
