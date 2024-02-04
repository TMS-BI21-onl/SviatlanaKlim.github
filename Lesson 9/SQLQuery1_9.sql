дЮМЮ РЮАКХЖЮ КЧДЕИ People. оНКЪ: ID, FirstName, LastName,  ID_Father, ID_Mother.
дКЪ БЯЕУ дЛХРПХЕБ БШБЕДХРЕ ХУ тхн Х тхн ХУ НРЖНБ


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
	('хбюм','оерпнб', '1', '2001'),
	('длхрпхи','яхднпнб', '2', '2002'),
	('яберкюмю','люпршмнбяйюъ', '3', '2003'),
	('яепцеи','йскхахм', '4', '2004'),
	('лхкюмю','оерпнбю', '5', '2005'),
	('длхрпхи','яхднпнбяйхи', '6', '2006'),
	('яберкюмю','люпршмнбю', '7', '2007'),
	('яепцеи','йскханб', '8', '2008'),
	('длхрпхи','люпрнб', '9', '2009'),
	('яепцеи','йскхмхв', '10', '2010')

	

INSERT INTO 
	Father
	( [FirstName],[LastName])
VALUES
	('оерп','оерпнб'),
	('хбюм','яхднпнб'),
	('лхуюхк','люпршмнбяйхи'),
	('длхрпхи','йскхахм'),
	('яепцеи','оерпнб'),
	('онкхйюпо','яхднпнбяйхи'),
	('мхйнкюи','люпршмнб'),
	('яепцеи','йскханб'),
	('бюяхкхи','люпрнб'),
	('мхйхрю','йскхмхв')

SELECT *FROM Father
SELECT *FROM People


SELECT P.[FirstName] AS FirstName, P.[LastName] AS LastName, F.[FirstName] AS Father_FirstName, F.[LastName] AS Father_LastName
FROM People P JOIN  Father F ON F.ID = P.ID_Father
WHERE P.[FirstName] = 'длхрпхи'
