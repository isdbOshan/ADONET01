CREATE TABLE Departments
(
	DepartmentId INT IDENTITY PRIMARY KEY,
	DepartmentName NVARCHAR(30) NOT NULL
)
GO
CREATE TABLE Employees
(
	EmployeeId INT  IDENTITY PRIMARY KEY,
	EmployeeName NVARCHAR(40) NOT NULL,
	JoinDate DATE NOT NULL,
	Phone	NVARCHAR(30) NOT NULL,
	DepartmentId INT NOT NULL REFERENCES Departments(departmentId)
)
GO
INSERT INTO Departments VALUES ('IT'),('Admin'),('Accounts'), ('HR')