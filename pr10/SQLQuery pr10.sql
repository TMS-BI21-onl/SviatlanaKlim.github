--������ 
1) ������� ����� � �� ������ ���������, ��� ������ ������� ���������� ��  4 � ������������� �� 5.
( ������� Person.PersonPhone, Person.Person) 


SELECT [FirstName],[LastName],[PhoneNumber]
FROM Person.Person P
LEFT JOIN Person.PersonPhone PF ON P.[BusinessEntityID] =PF.[BusinessEntityID]
WHERE [PhoneNumber] LIKE '4%5'

2) ������� ������� �������� �� [HumanResources].[Employee] � ���� ���������� ���������:
Adolescence: 17-20
Adults: 21-59
Elderly: 60-75
Senile: 76-90



SELECT [BusinessEntityID],
CASE
	WHEN 	(YEAR(GETDATE())-YEAR(BirthDate)) FROM [HumanResources].[Employee] BETWEEN  17 AND 20 THEN 'Adolescence'
	WHEN(YEAR(GETDATE())-YEAR(BirthDate)) FROM [HumanResources].[Employee] BETWEEN  21 AND 59 THEN 'Adults'
	WHEN(YEAR(GETDATE())-YEAR(BirthDate)) FROM [HumanResources].[Employee] BETWEEN  60 AND 75 THEN 'Elderly'
	WHEN(YEAR(GETDATE())-YEAR(BirthDate)) FROM [HumanResources].[Employee] BETWEEN  76 AND 90 THEN 'Senile'
	ELSE ''
END 
FROM [HumanResources].[Employee]

3) ������� ����� ������� ������� ��� ������� ����� �� [Production].[Product] (3 �������)

SELECT[Name],[Color],  max([StandardCost]) as maxST 
FROM [Production].[Product]
GROUP BY [Color], [Name]

SELECT TOP 1 WITH TIES [StandardCost],[Name],[Color] FROM [Production].[Product]
order by [StandardCost] DESC

SELECT * FROM 
(SELECT NAME,StandardCost,[Color], rank() over(order by StandardCost desc, color) as r
from [Production].[Product]) t


SELECT NAME,StandardCost,[Color] 
FROM [Production].[Product] 
where StandardCost = (SELECT MAX (StandardCost) 
FROM [Production].[Product]) 

����������� �����������
ID, �.�.�., �������� �������, ���� �������, ��������� ������, ��������� �������, ������ ���������.

1. ����� �.�.�. ������� ����� �������� ������� � 2023 �.
2. ������� �������� �� �������� ��������� �� ����������� �����.