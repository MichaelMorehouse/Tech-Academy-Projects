/*	Create an example database with library branches, books, borrowers, and loans
	Populate the database with sample data
	Including user stored procedures
*/

CREATE DATABASE db_library
GO

USE db_library

/* Table Creation */

CREATE TABLE tbl_publisher (
	Name			NVARCHAR(100)	NOT NULL	PRIMARY KEY,
	Address			NVARCHAR(255)	NOT NULL,
	Phone			NVARCHAR(20)	NULL
);

CREATE TABLE tbl_library_branch (
	BranchID		INT				NOT NULL	PRIMARY KEY IDENTITY(1,1),
	BranchName		NVARCHAR(100)	NOT NULL,
	Address			NVARCHAR(255)	NOT NULL
);

CREATE TABLE tbl_book (
	BookID			INT				NOT NULL	PRIMARY KEY IDENTITY(1,1),
	Title			NVARCHAR(255)	NOT NULL,
	PublisherName	NVARCHAR(100)	NOT NULL	FOREIGN KEY REFERENCES tbl_publisher(Name)
);

CREATE TABLE tbl_book_authors (
	BookID			INT				NOT NULL	PRIMARY KEY FOREIGN KEY REFERENCES tbl_book(BookID),
	AuthorName		NVARCHAR(100)	NOT NULL
);

CREATE TABLE tbl_borrower (
	CardNo			INT				NOT NULL	PRIMARY KEY IDENTITY(1001,1),
	Name			NVARCHAR(255)	NOT NULL,
	Address			NVARCHAR(255)	NOT NULL,
	Phone			NVARCHAR(20)	NULL
);

CREATE TABLE tbl_book_loans (
	LoanNo			INT				NOT NULL	PRIMARY KEY IDENTITY(10000,1),
	BookID			INT				NOT NULL	FOREIGN KEY REFERENCES tbl_book(BookID),
	BranchID		INT				NOT NULL	FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	CardNo			INT				NOT NULL	FOREIGN KEY REFERENCES tbl_borrower(CardNo),
	DateOut			DATE			NOT NULL,
	DueDate			DATE			NOT NULL
);

CREATE TABLE tbl_book_copies (
	CopyID			INT				NOT NULL	PRIMARY KEY IDENTITY(1,1),
	BookID			INT				NOT NULL	FOREIGN KEY REFERENCES tbl_book(BookID),
	BranchID		INT				NOT NULL	FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	NoOfCopies		INT				NOT NULL
);

/* Value Insertion */

INSERT INTO tbl_publisher (Name, Address, Phone)
	VALUES
	('Puffin Books', '123 Paper St., New York City, NY', '123-234-3453')
	,('Broadstar Books', '244 Binder Ave., Chicago, IL', '233-255-2555')
	,('Leafline Publishers', '2946 Oak St., San Francisco, CA', '362-662-8852')
	,('Mannlich Brothers Publishing', '786 A St., Los Angeles, CA', '366-455-4777')
	,('Wonder Publishing House', '3785 Washington Ave., Seattle, WA', '253-667-3683')
;

INSERT INTO tbl_library_branch (BranchName, Address)
	VALUES
	('Central', '1245 Main St., Anytown, USA')
	,('Sharpstown', '552 Lookout Dr., Anytown, USA')
	,('Uptown', '6447 Poplar Ave., Anytown, USA')
	,('Southeast', '6629 SE 20th Ave., Anytown, USA')
;

INSERT INTO tbl_book (Title, PublisherName)
	VALUES
	('The Flight Attendant', 'Puffin Books')
	,('Last Ferry Home', 'Puffin Books')
	,('The Life to Come', 'Mannlich Brothers Publishing')
	,('The Neighbors', 'Leafline Publishers')
	,('In Sight of Stars', 'Broadstar Books')
	,('Islandborn', 'Puffin Books')
	,('Census', 'Wonder Publishing House')
	,('The Lost Tribe', 'Mannlich Brothers Publishing')
	,('The Sun Does Shine', 'Broadstar Books')
	,('A Lite Too Bright', 'Broadstar Books')
	,('Only Child', 'Leafline Publishers')
	,('Dear Martin', 'Wonder Publishing House')
	,('Feel Free', 'Broadstar Books')
	,('Laura and Emma', 'Puffin Books')
	,('Brass', 'Wonder Publishing House')
	,('This Will Be My Undoing', 'Leafline Publishers')
	,('The Merry Spinster', 'Mannlich Brothers Publishing')
	,('It', 'Puffin Books')
	,('The Green Mile', 'Puffin Books')
	,('The List', 'Wonder Publishing House')
	,('Sharp', 'Broadstar Books')
	,('The Cost of Living', 'Wonder Publishing House')
;

INSERT INTO tbl_book_authors (BookID, AuthorName)
	VALUES
	(1, 'Deborah Livy')
	,(2, 'Lauren Groff')
	,(3, 'Mark Warren')
	,(4, 'Zoe Ella')
	,(5, 'Sheila Brown')
	,(6, 'Stephen Brooks')
	,(7, 'Melissa Broder')
	,(8, 'Roxane Sittenfeld')
	,(9, 'Curt Gay')
	,(10, 'Helen Dean')
	,(11, 'Michelle Weinzweig')
	,(12, 'Leslie Crosley')
	,(13, 'Sloane Jamison')
	,(14, 'Sarah Wolf')
	,(15, 'Zadie Jones')
	,(16, 'Jasmine Jerkins')
	,(17, 'Mallory Smith')
	,(18, 'Stephen King')
	,(19, 'Stephen King')
	,(20, 'Amy Siskind')
	,(21, 'Julia Karr')
	,(22, 'Simon Drawlin')
;

INSERT INTO tbl_borrower (Name, Address, Phone)
	VALUES
	('Bob Miller', '516 Main St., Anytown, USA', '255-336-3536')
	,('Samuel Baldwin', '2577 B Ave., Anytown, USA','255-562-6622')
	,('Margaret Barrett', '5366 B Ave., Anytown, USA', '255-356-3776')
	,('Owen Estrada', '678 Oregon St., Anytown, USA', NULL)
	,('Angie Rose', '6377 Elm St., Nextown, USA', '288-636-2777')
	,('Leroy Matthews', '4563 Z Ave., Anytown, USA', '255-267-2348')
	,('Wilbert Lee', '267 Ordis Ct., Anytown, USA', '255-636-3777')
	,('Thelma Gomez', '4568 Evergreen Lane, Anytown, USA', '255-366-3345')
	,('Erika Roy', '3902 Zip Ave., Nextown, USA', '288-362-4568')
	,('Angel Cunningham', '112 Silver St., Anytown, USA', '255-836-4899')
;

INSERT INTO tbl_book_loans (BookID, BranchID, CardNo, DateOut, DueDate)
	VALUES
	(15,2,1003,'20180310','20180320')
	,(12,2,1005,'20180318','20180328')
	,(9,3,1005,'20180310','20180320')
	,(17,1,1003,'20180320','20180330')
	,(4,3,1002,'20180316','20180326')
	,(14,1,1001,'20180315','20180325')
	,(7,2,1002,'20180317','20180327')
	,(22,4,1001,'20180315','20180325')
	,(22,3,1009,'20180316','20180326')
	,(17,1,1006,'20180317','20180327')
	,(2,1,1009,'20180320','20180330')
	,(21,3,1009,'20180320','20180330')
	,(12,1,1005,'20180313','20180323')
	,(14,2,1004,'20180314','20180324')
	,(11,4,1003,'20180314','20180324')
	,(16,3,1002,'20180319','20180329')
	,(3,2,1008,'20180317','20180327')
	,(21,1,1001,'20180317','20180327')
	,(3,1,1006,'20180315','20180325')
	,(12,2,1005,'20180320','20180330')
	,(4,2,1005,'20180315','20180325')
	,(5,2,1003,'20180311','20180321')
	,(11,3,1004,'20180319','20180329')
	,(7,3,1009,'20180312','20180322')
	,(13,3,1009,'20180312','20180322')
	,(4,3,1004,'20180320','20180330')
	,(14,4,1008,'20180311','20180321')
	,(12,1,1008,'20180312','20180322')
	,(10,1,1009,'20180313','20180323')
	,(21,2,1005,'20180319','20180329')
	,(7,4,1009,'20180319','20180329')
	,(18,3,1004,'20180314','20180324')
	,(18,3,1001,'20180319','20180329')
	,(12,1,1006,'20180312','20180322')
	,(3,3,1007,'20180312','20180322')
	,(19,2,1002,'20180311','20180321')
	,(10,3,1002,'20180315','20180325')
	,(6,2,1007,'20180316','20180326')
	,(11,4,1004,'20180313','20180323')
	,(5,3,1001,'20180312','20180322')
	,(4,2,1004,'20180314','20180324')
	,(14,1,1001,'20180318','20180328')
	,(1,1,1008,'20180311','20180321')
	,(4,3,1008,'20180316','20180326')
	,(1,4,1007,'20180318','20180328')
	,(15,3,1003,'20180317','20180327')
	,(20,4,1003,'20180318','20180328')
	,(10,1,1006,'20180310','20180320')
	,(13,3,1007,'20180320','20180330')
	,(9,2,1008,'20180313','20180323')
	,(3,4,1002,'20180317','20180327')
	,(10,2,1004,'20180320','20180330')
	,(16,4,1003,'20180313','20180323')
	,(8,1,1005,'20180310','20180320')
	,(20,4,1001,'20180320','20180330')
	,(22,1,1002,'20180319','20180329')
	,(2,3,1007,'20180320','20180330')
	,(20,1,1002,'20180315','20180325')
	,(12,3,1004,'20180316','20180326')
	,(8,1,1002,'20180315','20180325')
	,(7,1,1007,'20180310','20180320')
	,(12,2,1005,'20180310','20180320')
	,(19,3,1009,'20180311','20180321')
	,(8,4,1009,'20180320','20180330')
	,(19,2,1001,'20180314','20180324')
	,(4,3,1001,'20180316','20180326')
;

INSERT INTO tbl_book_copies (BookID, BranchID, NoOfCopies)
	VALUES
	(1,1,5)
	,(2,1,4)
	,(3,1,4)
	,(4,1,7)
	,(5,1,2)
	,(6,1,4)
	,(7,1,2)
	,(8,1,2)
	,(9,1,4)
	,(10,1,4)
	,(11,1,5)
	,(12,1,7)
	,(13,1,2)
	,(14,1,7)
	,(15,1,3)
	,(16,1,6)
	,(17,1,5)
	,(18,1,6)
	,(19,1,6)
	,(20,1,4)
	,(21,1,3)
	,(22,1,5)
	,(1,2,2)
	,(2,2,7)
	,(3,2,5)
	,(4,2,3)
	,(5,2,7)
	,(6,2,7)
	,(7,2,5)
	,(8,2,2)
	,(9,2,4)
	,(10,2,4)
	,(11,2,5)
	,(12,2,3)
	,(13,2,5)
	,(14,2,6)
	,(15,2,7)
	,(16,2,7)
	,(17,2,7)
	,(18,2,6)
	,(19,2,7)
	,(20,2,7)
	,(21,2,3)
	,(22,2,4)
	,(1,3,5)
	,(2,3,7)
	,(3,3,7)
	,(4,3,3)
	,(5,3,3)
	,(6,3,6)
	,(7,3,4)
	,(8,3,4)
	,(9,3,4)
	,(10,3,7)
	,(11,3,7)
	,(12,3,5)
	,(13,3,6)
	,(14,3,7)
	,(15,3,4)
	,(16,3,5)
	,(17,3,2)
	,(18,3,2)
	,(19,3,2)
	,(20,3,7)
	,(21,3,5)
	,(22,3,6)
	,(1,4,2)
	,(2,4,7)
	,(3,4,4)
	,(4,4,2)
	,(5,4,3)
	,(6,4,5)
	,(7,4,2)
	,(8,4,5)
	,(9,4,2)
	,(10,4,3)
	,(11,4,4)
	,(12,4,4)
	,(13,4,5)
	,(14,4,6)
	,(15,4,7)
	,(16,4,2)
	,(17,4,5)
	,(18,4,5)
	,(19,4,6)
	,(20,4,5)
	,(21,4,7)
	,(22,4,4)
;
GO

/* User Stored Procedure Creation */

CREATE PROC dbo.uspGetCopiesLostTribeSharpstown -- list number of copies of book The Lost Tribe at the Sharpstown branch
AS
SELECT 
	B.Title
	,BC.NoOfCopies AS 'Number of Copies'
	,LIB.BranchName AS 'Branch Name'
	FROM tbl_book_copies AS BC
	INNER JOIN tbl_book AS B ON B.BookID = BC.BookID
	INNER JOIN tbl_library_branch AS LIB ON LIB.BranchID = BC.BranchID
	WHERE LIB.BranchName = 'Sharpstown'
	AND B.Title = 'The Lost Tribe'
;
GO

CREATE PROC dbo.uspGetCopiesLostTribeByBranch  -- list number of copies of book The Lost Tribe at all branches
AS
SELECT
	B.Title
	,BC.NoOfCopies AS 'Number of Copies'
	,LIB.BranchName AS 'Branch Name'
	FROM tbl_book_copies AS BC
	INNER JOIN tbl_book AS B ON B.BookID = BC.BookID
	INNER JOIN tbl_library_branch AS LIB ON LIB.BranchID = BC.BranchID
	WHERE B.Title = 'The Lost Tribe'
;
GO

CREATE PROC dbo.uspGetBorrowersNoLoans -- list names of registered borrowers with no books on loan
AS
SELECT
	BOR.Name AS 'Borrower Name'
	FROM tbl_borrower AS BOR
	WHERE BOR.CardNo NOT IN 
	(SELECT LOAN.CardNo
	FROM tbl_book_loans AS LOAN)
; 
GO

CREATE PROC dbo.uspGetLoansDueTodaySharpstown -- list title, borrower's name and address for loans due today at the Sharpstown branch
AS
SELECT
	BOR.Name AS 'Borrower Name'
	,BOR.Address
	,B.Title
	FROM tbl_book_loans AS LOAN
	INNER JOIN tbl_book AS B ON B.BookID = LOAN.BookID
	INNER JOIN tbl_borrower AS BOR ON BOR.CardNo = LOAN.CardNo
	INNER JOIN tbl_library_branch AS LIB ON LIB.BranchID = LOAN.BranchID
	WHERE LIB.BranchName = 'Sharpstown'
	AND LOAN.DueDate = CONVERT(date, GETDATE()) -- due date checked against today's date
;
GO

CREATE PROC dbo.uspGetLoansTotalByBranch -- list the total number of books on loan from each branch
AS
SELECT
	LIB.BranchName AS 'Branch Name'
	,COUNT(LOAN.BookID) AS 'Total Loans'
	FROM tbl_library_branch AS LIB
	INNER JOIN tbl_book_loans AS LOAN ON LOAN.BranchID = LIB.BranchID
	GROUP BY LIB.BranchName
;
GO

CREATE PROC dbo.uspGetBorrowersAboveFiveLoans -- list borrowers with more than 5 books on loan
AS
SELECT
	BOR.Name
	,BOR.Address
	,COUNT(LOAN.CardNo) AS 'Books on Loan'
	FROM tbl_borrower AS BOR
	INNER JOIN tbl_book_loans AS LOAN ON LOAN.CardNo = BOR.CardNo
	GROUP BY BOR.Name, BOR.Address
	HAVING COUNT(LOAN.CardNo) > 5
;
GO

CREATE PROC dbo.uspGetCopiesByStephenKingCentral -- list books authored by Stephen King with copy count at Central branch
AS
SELECT
	B.Title
	,BA.AuthorName AS 'Author Name'
	,BC.NoOfCopies AS 'Number of Copies'
	FROM tbl_book_copies AS BC
	INNER JOIN tbl_book AS B ON B.BookID = BC.BookID
	INNER JOIN tbl_library_branch AS LIB ON LIB.BranchID = BC.BranchID
	INNER JOIN tbl_book_authors AS BA ON BA.BookID = B.BookID
	WHERE LIB.BranchName = 'Central'
	AND BA.AuthorName LIKE '%Stephen King%' -- allows for co-authorship
;
GO