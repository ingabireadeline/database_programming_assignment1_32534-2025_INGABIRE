-- Aggregate Window Functions: Grand Total, Global Avg, Min, and Max
SELECT OrderID, BeanID, TotalAmount,
       SUM(TotalAmount) OVER() AS GrandTotal,
       AVG(TotalAmount) OVER() AS GlobalAvg,
       MIN(TotalAmount) OVER() AS GlobalMin,
       MAX(TotalAmount) OVER() AS GlobalMax
FROM ORDERS
ORDER BY OrderDate;
