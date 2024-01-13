6.	� ���� ������ AdventureWorks2017 ������� ������� Patients ��� ������� ���������� �� ������������ ��������� ��������. 
������� ������ ��������� ����:
ID � �������� ����. ���� �����������.
FirstName � ��� ��������.
LastName � ������� ��������.
SSN � ���������� ������������� ��������.
Email � ����������� ����� ��������. ����������� 
�� ���������� �������: ������ ������� ����� FirstName + ��������� 3 ����� LastName + @mail.com 
(��������, Akli@mail.com). �������� ������ �����. 

Temp � ����������� ��������.
CreatedDate � ���� ���������. 

USE AdventureWorks2017;
GO
IF OBJECT_ID('dbo.Patients', 'U') IS NOT NULL
    DROP TABLE Patients;
GO
CREATE Table Patients
	(
	ID INT IDENTITY(1, 1),
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	SSN nvarchar(14) not null, --����������������� ����� �� ��������
	Email as (UPPER(LEFT(FirstName,1)) + LOWER(LEFT(LastName,3))+'@mail.com') PERSISTED,
	Temp NUMERIC(3,1) not null,
	CreatedDate DATETIME not null DEFAULT GETDATE(),
	);


7.	�������� � ������� ��������� ������������ �������. 

	
INSERT INTO Patients (FirstName, LastName, SSN, Temp)
VALUES ('Sonia', 'Klimova', '4271085AO10PB5', 36.6), 
('Tonya', 'Ivanova', '4231190AO10PB5', 36.8),
('Petya', 'Petrov', '3231193AO10PB5', 37.8)


8.	�������� ���� TempType �� ���������� ���������� �< 37�C�,  �> 37�C� �� ������ �������� �� ���� Temp 
( ����������� ALTER TABLE ADD column AS ). ���������� �� ������, ������� ����������.

 ALTER TABLE
 ADD column AS 


 ALTER TABLE dbo.Patients ADD TempType AS 
	CASE
		WHEN Temp >37  THEN '> 37�C'
		ELSE '< 37�C' 
	END

9.	������� ������������� Patients_v, ������������ ����������� � �������� ���������� (�F = �Cx9/5 + 32)

CREATE VIEW vPatients AS
SELECT	FirstName, 
		LastName, 
		Temp AS TempC,
		Temp*9/5 + 32 AS TempF
FROM Patients 


	
10.	������� �������, ������� ���������� ����������� � �������� ����������, ��� ������ �� ���� ������� � ��������.
	
CREATE FUNCTION UDFConvertTemp (@Temp NUMERIC(3,1))
RETURNS NUMERIC(3,1)
AS
BEGIN
    RETURN (@Temp*9/5 + 32)
END;

11.	���������� ������� ������ g �� �������� �� � �������������� ����������, ����������� ������� select.
g)	������� ������ ������ ���� ������ (FROM �� ����������). ����� ����������� ��� �� ��� �������.

������� 1

	DECLARE @LastDayPrevMonth date
	set datefirst 1;
	set @LastDayPrevMonth=EOMONTH (GETDATE(),-1)

 SELECT CASE DATEPART(WEEKDAY,   DATEADD(DAY, 1, @LastDayPrevMonth)) 
			WHEN 7 THEN  DATEADD(DAY, 2, @LastDayPrevMonth )
			WHEN 6 THEN  DATEADD(DAY, 3, @LastDayPrevMonth )
		ELSE  DATEADD(DAY, 1, @LastDayPrevMonth )
		END

������� 2

	DECLARE @FirstDayMonth date
	set datefirst 1;
	set @FirstDayMonth=DATEADD(DAY, 1,EOMONTH (GETDATE(),-1))
  
 SELECT CASE DATEPART(WEEKDAY, @FirstDayMonth) 
			WHEN 7 THEN  DATEADD(DAY, 1, @FirstDayMonth )
			WHEN 6 THEN  DATEADD(DAY, 2, @FirstDayMonth )
		ELSE  @FirstDayMonth
		END

SELECT S.first_name, 
	CASE 
		WHEN US.END_DATE IS NULL THEN 'Currently Working'
	ELSE 'Left the company at' + US.END_DATE
	END AS status
FROM Employees S LEFT Join Job_history US ON S.EMPLOYEE_ID = US.EMPLOYEE_ID









