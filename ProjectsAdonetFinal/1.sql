﻿CREATE TABLE Products
(
	ProductId INT PRIMARY KEY,
	ProductName NVARCHAR(40) NOT NULL,
	Price MONEY NOT NULL,
	ExpireDate DATE NOT NULL,
	Picture NVARCHAR(50) NOT NULL
)
GO 
CREATE TABLE Customers
(
	CustomerId INT PRIMARY KEY,
	CustomerName NVARCHAR(40) NOT NULL,
	Phone NVARCHAR(20) NOT NULL,
	[Address] NVARCHAR(150) NOT NULL,
)
GO
CREATE TABLE Orders
(
	OrderId INT PRIMARY KEY,
	OrderDate DATE NOT NULL,
	DeliveryDate DATE NULL,
	CustomerId INT NOT NULL REFERENCES Customers(CustomerId)
)
GO
CREATE TABLE OrderItems 
(
	OrderId INT NOT NULL,
	ProductId INT NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY(OrderId, ProductId)
)
GO