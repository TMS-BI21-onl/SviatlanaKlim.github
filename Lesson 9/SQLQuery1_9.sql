���� ������� ����� People. ����: ID, FirstName, LastName,  ID_Father, ID_Mother.
��� ���� �������� �������� �� ��� � ��� �� �����


CREATE DATABASE Test_People

USE Test_People

CREATE TABLE Father
(
	ID			            INT PRIMARY KEY IDENTITY,
	FirstName				NVARCHAR(30) NOT NULL,
	LastName				NVARCHAR(30) NOT NULL
	)

CREATE TABLE People
(
	ID			            INT PRIMARY KEY IDENTITY,
	FirstName				NVARCHAR(30) NOT NULL,
	LastName				NVARCHAR(30) NOT NULL,
	ID_Father				INT NOT NULL,
	ID_Mother				INT NOT NULL
	FOREIGN KEY (ID_Father)  REFERENCES Father (ID),
	)


USE Test_People
INSERT INTO People ([FirstName],[LastName],ID_Father,ID_Mother)
VALUES
	('����','������', '1', '2001'),
	('�������','�������', '2', '2002'),
	('��������','������������', '3', '2003'),
	('������','�������', '4', '2004'),
	('������','�������', '5', '2005'),
	('�������','�����������', '6', '2006'),
	('��������','���������', '7', '2007'),
	('������','�������', '8', '2008'),
	('�������','������', '9', '2009'),
	('������','�������', '10', '2010')

	

INSERT INTO 
	Father
	( [FirstName],[LastName])
VALUES
	('����','������'),
	('����','�������'),
	('������','������������'),
	('�������','�������'),
	('������','������'),
	('��������','�����������'),
	('�������','��������'),
	('������','�������'),
	('�������','������'),
	('������','�������')

SELECT *FROM Father
SELECT *FROM People


SELECT P.[FirstName] AS FirstName, P.[LastName] AS LastName, F.[FirstName] AS Father_FirstName, F.[LastName] AS Father_LastName
FROM People P JOIN  Father F ON F.ID = P.ID_Father
WHERE P.[FirstName] = '�������'
