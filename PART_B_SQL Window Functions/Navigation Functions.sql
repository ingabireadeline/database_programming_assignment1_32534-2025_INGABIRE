-- LAG() and LEAD(): Access previous and next row values based on OrderDate
SELECT OrderID, OrderDate, TotalAmount,
       LAG(TotalAmount, 1) OVER(ORDER BY OrderDate) AS PrevOrderAmount,
       LEAD(TotalAmount, 1) OVER(ORDER BY OrderDate) AS NextOrderAmount
FROM ORDERS;
