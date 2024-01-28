1. 	Создайте вашу базу данных: таблицы, ограничения, ключи.

CREATE DATABASE Online_Shop
USE Online_Shop

CREATE TABLE Product
(
	ProductID			INT PRIMARY KEY IDENTITY,
	Name				NVARCHAR(30) NOT NULL,
	[Group]				NVARCHAR(30) NOT NULL,
	Brand				NVARCHAR(30) NOT NULL,
	Model				NVARCHAR(30) NOT NULL,
	Color				NVARCHAR(30),
	Price				FLOAT NOT NULL,
	VendorPrice			FLOAT NOT NULL
)

CREATE TABLE Vendor
(
	VendorID			INT PRIMARY KEY IDENTITY,
	Vendor				NVARCHAR(30) NOT NULL,
	Name				NVARCHAR(30) NOT NULL,
	ActiveFlag			BIT NOT NULL,
	WebURL				NVARCHAR(150) UNIQUE,
	ModifiedeDate		DATE NOT NULL
)


CREATE TABLE Client
(
	ClientID			INT PRIMARY KEY IDENTITY,
	FirstName			NVARCHAR(30) NOT NULL,
	LastName			NVARCHAR(30) NOT NULL,
	Gender				CHAR(1) NOT NULL,
	Birthday			DATE NOT NULL,
	PassportID			NVARCHAR(14) UNIQUE NOT NULL,
	TelNumber			NVARCHAR(13),
	Mail				AS CONCAT(UPPER(LEFT(FirstName,3)), LOWER(LEFT(LastName,3)), '@mail.com') PERSISTED 
)

CREATE TABLE Delivery
(
	DeliveryID			INT PRIMARY KEY IDENTITY,
	DeliveryType		NVARCHAR(30) NOT NULL
)

CREATE TABLE Status
(
	StatusID			INT PRIMARY KEY IDENTITY,
	Status				NVARCHAR(30) NOT NULL
)

CREATE TABLE Pay
(
	PayTypeID			INT PRIMARY KEY IDENTITY,
	PayType				NVARCHAR(30) NOT NULL
)


CREATE TABLE Orders
(	
	OrderID				INT PRIMARY KEY IDENTITY,
	ClientID			INT, 
	ProductID			INT,		
	DeliveryID			INT,
	VendorID			INT,
	StatusID			INT,
	PayTypeID			INT,
	Quantity			INT,
	Orderdate			DATETIME,
	TotalPrice			FLOAT,
	StatusChange		DATE,
	FOREIGN KEY (ClientID)  REFERENCES Client (ClientID),
	FOREIGN KEY (ProductID)  REFERENCES Product (ProductID),
	FOREIGN KEY (DeliveryID)  REFERENCES Delivery (DeliveryID),
	FOREIGN KEY (VendorID)  REFERENCES Vendor (VendorID),
	FOREIGN KEY (StatusID)  REFERENCES Status (StatusID),
	FOREIGN KEY (PayTypeID)  REFERENCES Pay (PayTypeID),
)



2.	Напишите скрипт для получения 1 млн человек с различными именами и фамилиями. 

SELECT *  FROM MOCK_DATA1 CROSS JOIN MOCK_DATA2

