CREATE TABLE Projects
(
	ProjectId INT PRIMARY KEY,
	ProjectTitle NVARCHAR(40) NOT NULL,
	StartDate DATE NOT NULL
)
GO 
CREATE TABLE Milestones 
(
	MilestonId INT PRIMARY KEY,
	Title NVARCHAR(30) NOT NULL,
	CompletionDate DATE NOT NULL,
	ProjectId INT NOT NULL REFERENCES Projects(ProjectId) 
)
GO