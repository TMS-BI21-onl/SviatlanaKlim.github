3.	�������� ������ � ����������� ��� ���������� �������� NationalIDNumber � ������� HumanResources.Employee 
��� ���������� BusinessEntityID. �.�. ������� ����� ���������� 2 ��������: BusinessEntityID (��� ���� �������� ������) 
� NationalIDNumber (�� ����� �������� ��������).

� ������� ������� ������� ���������� �������� NationalIDNumber �� 879341111 ��� BusinessEntityID= 15.


CREATE PROCEDURE HumanResources.uspUpNationalIDNumber   
    @NationalIDNumber nvarchar(15),   
	@BusinessEntityID int   
AS   
UPDATE HumanResources.Employee
SET NationalIDNumber = '879341111'
WHERE BusinessEntityID= 15;
  
  select getdate()
 
EXECUTE HumanResources.uspUpNationalIDNumber '879341111', 15; 


