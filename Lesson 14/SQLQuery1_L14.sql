1.	��� ����� ���� ������ �������� ������ ��� ���������� ������ �������� ��� 50 ��������� �� ��� ������� ������, 
��� ������� ������������ ����������� ������ �� ���������� ������ � ���� (7 � ����� ������ � 3 �����, 5-7 � 2 �����, 
������ 5 � 1 ����). 


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







