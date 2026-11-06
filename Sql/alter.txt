
﻿/*1)Employees cədvəli yarat:

EmployeeID (PK)
FirstName (NVARCHAR 50)
Salary (DECIMAL)
HireDate (DATE)

Şərt: Salary > 2000 olanları göstər, Salary  alias ilə.

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

SELECT Salary AS SalaryAlias FROM Employees
WHERE Salary > 2000;


2)Products cədvəli:
ProductID (PK)
Name (VARCHAR 100)
Price (DECIMAL)

Şərt: Price 50–200 arası olanları çıxart və qiymətə görə azalan sırala.


CREATE TABLE Products(
ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10,2)
);

SELECT * FROM Products
WHERE Price BETWEEN 50 AND 200
ORDER BY Price DESC;


3)Customers:

CustomerID (PK)
Email (UNIQUE + CHECK '%@%')

Şərt: Email-i olmayanları göstər .

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Email nVARCHAR(100) UNIQUE CHECK (Email LIKE '%@%')
);

SELECT * FROM Customers
WHERE Email IS NULL;

4)Orders:

OrderID (PK)
OrderDate (DATETIME)
TotalAmount (DECIMAL)

Şərt: 5-ci səhifəni gətir (page size = 10) 

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2)
);

SELECT * FROM Orders
ORDER BY OrderID
OFFSET 40 ROWS 
FETCH NEXT 10 ROWS ONLY;

5)Students:

StudentID (PK)
Age (INT CHECK Age >= 18)

Şərt: Age > 20 olanları alias ilə göstər.


CREATE TABLE Students(
StudentID INT IDENTITY(1,1) PRIMARY KEY,
Age INT CHECK(Age >= 18)
)

SELECT Age AS YASH FROM Students
WHERE Age > 20

6)Books:

BookID (PK)
Title
Price

Şərt: Ən ucuz 3 kitabı gətir


CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(100),
    Price DECIMAL(10,2)
);

SELECT TOP 3 * FROM Books
ORDER BY Price ASC;


7)Employees cədvəlinə:

Email sütunu əlavə et (UNIQUE constraint ilə)

ALTER TABLE Employees
ADD 
Email VARCHAR(100) UNIQUE;

8)Payments:

PaymentID (PK)
Amount (DECIMAL CHECK > 0)

Şərt: Amount-a görə sıralayıb ilk 5 nəticəni göstər.

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    Amount DECIMAL(10,2) CHECK (Amount > 0)
);

SELECT TOP 5 * FROM Payments
ORDER BY Amount ASC;


9)Users:

Username (UNIQUE)
IsActive (DEFAULT 1)

Şərt: Aktiv istifadəçiləri WHERE ilə çıxart.

CREATE TABLE Users (
    Username NVARCHAR(50) UNIQUE,
    IsActive BIT DEFAULT 1
);

SELECT * FROM Users
WHERE IsActive = 1;

10)Products:

Stock (INT CHECK >= 0)

Şərt: Stock < 10 olanları göstər, Stock AS AzQaliq kimi alias ver.


ALTER TABLE Products
ADD 
Stock INT CHECK (Stock >= 0);

SELECT Stock AS Qaliq FROM Products
WHERE Stock < 10;


11)Orders:

Status (VARCHAR CHECK ('Pending','Shipped','Cancelled'))

Şərt: 'Pending' olanları gətir.

ALTER TABLE Orders
ADD 
Status VARCHAR(20) CHECK (Status IN ('Pending','Shipped','Cancelled'));

SELECT * FROM Orders
WHERE Status = 'Pending';


12)Employees:

Salary sütununun data type-ni dəyiş → INT → DECIMAL(10,2)

ALTER TABLE Employees
ALTER COLUMN Salary DECIMAL(10,2);

*/