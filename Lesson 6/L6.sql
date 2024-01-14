3.	Создайте объект с параметрами для обновления значения NationalIDNumber в таблице HumanResources.Employee 
для указанного BusinessEntityID. Т.е. объекту будет подаваться 2 значения: BusinessEntityID (для кого изменяем данные) 
и NationalIDNumber (на какое значение изменяем).

С помощью данного объекта попробуйте заменить NationalIDNumber на 879341111 для BusinessEntityID= 15.


CREATE PROCEDURE HumanResources.uspUpNationalIDNumber   
    @NationalIDNumber nvarchar(15),   
	@BusinessEntityID int   
AS   
UPDATE HumanResources.Employee
SET NationalIDNumber = '879341111'
WHERE BusinessEntityID= 15;
  
  select getdate()
 
EXECUTE HumanResources.uspUpNationalIDNumber '879341111', 15; 


