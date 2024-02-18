1.	ƒл€ своей базы данных создайте объект дл€ нахождени€ общего рейтинга топ 50 продавцов за всю историю продаж, 
где рейтинг определ€етс€ количеством баллов за количество продаж в день (7 и более продаж Ц 3 балла, 5-7 Ц 2 балла, 
меньше 5 Ц 1 балл). 


CREATE VIEW v_RATING 50 Vendor AS 

SELECT  TOP 50  NAME, SUM(marks) AS sum_marks
FROM (SELECT  CONVERT(date, Orderdate) AS o_date, V.Name, 
		  CASE 
			 WHEN COUNT(OrderID)<5 THEN 1
			 WHEN COUNT(OrderID)>=5 AND COUNT(OrderID)<7 THEN 2
			 ELSE 3
		  END AS marks
	 FROM Orders O
	 JOIN Vendor V ON V.VendorID=O.VendorID
		GROUP BY  CONVERT(date, Orderdate),  V.Name 
	) t
GROUP BY NAME
ORDER BY sum_marks DESC;


SELECT * 
  FROM [Online_Shop].[dbo].[v_RATING 50 Vendor]







