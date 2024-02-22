1. ����� ProductSubcategoryID �� Production.Product, ��� ��� ��� ������ ProductSubcategoryID ������ 150. 

SELECT ProductSubcategoryID, MIN (Weight) AS Weight_MIN
FROM Production.Product
GROUP BY  ProductSubcategoryID
HAVING MIN (Weight) >150 

2. ����� ����� ������� ������� (���� StandardCost) �� Production.Product. (4 �������)

SELECT TOP 1 WITH TIES StandardCost, Name
FROM Production.Product
order by StandardCost DESC


SELECT *
FROM
(SELECT Name, StandardCost, 
		RANK() OVER (ORDER BY StandardCost DESC) as rnk
FROM Production.Product) T
WHERE rnk=1


SELECT *
FROM
(
	SELECT Name, StandardCost, MAX(StandardCost) OVER () as max_cost
	FROM Production.Product
) T
WHERE StandardCost=max_cost


SELECT Name, StandardCost
FROM Production.Product
WHERE StandardCost = (SELECT MAX(StandardCost) FROM Production.Product)

3. ����� ��������, ������� �� ��������� ��� �� ��������� �� ������ ������ (����� GROUP2)

SELECT FirstName, LastName, MAX(OrderDate) as last_orders
FROM Client C 
LEFT JOIN Orders O ON C.ClientID = O.ClientID
GROUP BY FirstName, LastName
HAVING DATEDIFF(day, MAX(OrderDate), GETDATE())>=365 OR MAX(OrderDate) IS NULL

4. ����� ��� ������� ���������� ���-�� ������� �� ��������� 5 ���.  (����� GROUP2)


 SELECT v.VendorID, v.Name, COUNT(o.OrderID) AS order_count
FROM Vendor v
JOIN Order o ON v.VendorID = o.VendorID
WHERE  DATEDIFF(year, GETDATE(), OrderDate) <= 5
GROUP BY v.VendorID, v.Name


5. 
Users (
    id bigint NOT NULL,
    email varchar(255) NOT NULL
);

Notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    category varchar(100),
    is_read boolean DEFAULT false
);

����� ������ ��������� ��� ������������ alex@gmail.com, � ������� ����� 50 ������������� 
�����������


SELECT n.category, COUNT(n.id) as Result
FROM users u
JOIN notifications n ON u.id = n.user_id
WHERE u.email = 'alex@gmail.com' AND n.is_read = false
GROUP BY n.category
HAVING COUNT(n.id) > 50







