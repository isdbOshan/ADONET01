CREATE TABLE Products
(
	ProductId INT PRIMARY KEY,
	ProductName NVARCHAR(40) NOT NULL,
	Picture NVARCHAR(50) NOT NULL,
	MfgDate DATE NOT NULL,
	ExpireAfter INT NOT NULL
)
CREATE TABLE Accessories
(
	AccessoryId INT PRIMARY KEY,
	AccessoryName NVARCHAR(30) NOT NULL,
	ProductId INT NOT NULL REFERENCES Products(ProductId)
)
