--Задачи 
1) Найдите людей и их номера телефонов, код города которых начинается на  4 и заканчивается на 5.
( таблицы Person.PersonPhone, Person.Person) 


SELECT [FirstName],[LastName],[PhoneNumber]
FROM Person.Person P
LEFT JOIN Person.PersonPhone PF ON P.[BusinessEntityID] =PF.[BusinessEntityID]
WHERE [PhoneNumber] LIKE '4%5'

2) Отнести каждого человека из [HumanResources].[Employee] в свою возрастную категорию:
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

3) Вывести самый дорогой продукт для каждого цвета из [Production].[Product] (3 способа)

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

МЕДИЦИНСКАЯ ЛАБОРАТОРИЯ
ID, Ф.И.О., название анализа, дата анализа, стоимость услуги, результат анализа, способ извещения.

1. Найти Ф.И.О. клиента часто сдающего анализы в 2023 г.
2. Вывести клиентов со способом извещения по электронной почте.