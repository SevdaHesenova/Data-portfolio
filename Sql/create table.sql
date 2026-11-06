 create DAtabase Unique_  --execute et 

 /*Sonra bu cedvelleri icinde yarat
 ---------------------------------


1. İstifadəçi Cədvəli

Users adlı cədvəl yarat:

UserID – unikal və boş ola bilməz

Username – maksimum 50 simvol, unikal

PasswordHash – boş ola bilməz

IsActive – default olaraq aktiv olsun

CreatedDate – sistem tarixi avtomatik yazılsın


CREATE TABLE Users(

UserID INT IDENTITY(1,1) primary key,
Username NVARCHAR(50) not null UNIQUE,
PasswordHash NVARCHAR(256) not null,
IsActive BIT not null DEFAULT 1,
CreatedDate DATETIME not null Default GETDATE())

drop table Users



2. Müştəri Məlumatları

Customers adlı cədvəl yarat:

CustomerID – Primary Key

FirstName, LastName – mətn tipində

Email – unikal olmalıdır

BirthDate – tarix tipində

Gender – yalnız M və ya F qəbul etsin



CREATE TABLE Customers(
CustomerID INT IDENTITY(1,1) primary key,
FirstName NVARCHAR(50) not null,
LastName NVARCHAR(50) not null,
Email NVARCHAR(50) not null unique,
BirthDate Date not null,
Gender Char(1) null check(gender in('f','m')))




3. Məhsullar

Products adlı cədvəl yarat:

ProductID – avtomatik artan

ProductName – boş ola bilməz

Price – 0-dan böyük olmalıdır

StockQuantity – mənfi ola bilməz

CreatedAt – default sistem tarixi


CREATE TABLE Products(
ProductID INT IDENTITY(1,1)  not null Primary key,
ProductName NVARCHAR(50) not null,
Price DECIMAL(10,2) not null CHECK (Price>0),
StockQuantity INT not null CHECK (StockQuantity>0),
CreatedAt DATETIME not null Default GETDATE()
)

drop table Products


4. Sifarişlər

Orders adlı cədvəl yarat:

OrderID – Primary Key

CustomerID – Customers cədvəlinə bağlı olsun

OrderDate – tarix

TotalAmount – 0-dan kiçik ola bilməz

Status – default olaraq Pending


CREATE TABLE Orders(
OrderID INT IDENTITY(1,1) primary key,
CustomerID INT NOT NULL, 
CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
OrderDate Date not null,
TotalAmount Decimal(10,2) not null Check(TotalAmount>0),
Status Nvarchar(20) not null Default 'Pending')



5. İşçilər

Employees adlı cədvəl yarat:

EmployeeID – Primary Key

FullName – boş ola bilməz

Salary – 500-dən az ola bilməz

HireDate – tarix

IsManager – BIT tipində


CREATE TABLE EMPLOYEES(
EmployeeID int identity(1,1) not null Primary key,
FullName NVARCHAR(50) NOT NULL,
Salary decimal(10,2) not null check(Salary>500),
HireDate Date not null,
IsManager bit not null Default 0)

drop table EMPLOYEES


6. Ödənişlər

Payments adlı cədvəl yarat:

PaymentID – unikal

OrderID – Orders cədvəlinə bağlı

PaymentDate – tarix və saat

Amount – 0-dan böyük

PaymentMethod – yalnız Cash, Card, Transfer


CREATE TABLE Payments(
PaymentID int identity(1,1) not null UNIQUE,
OrderID int not null,
CONSTRAINT FK_Payments_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
PaymentDate DATETIME2 not null DEFAULT SYSDATETIME(),
Amount Decimal(10,2) not null check(Amount>0),
PaymentMethod NVARCHAR(20) not null check(PaymentMethod in ('CASH','CARD','TRANSFER')
))



7. Tələbələr

Students adlı cədvəl yarat:

StudentID – Primary Key

StudentNumber – unikal

FullName – boş ola bilməz

Age – 16 ilə 65 arası

EnrollmentDate – tarix



CREATE TABLE Students (
StudentID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
StudentNumber INT NOT NULL UNIQUE,
FullName NVARCHAR(50) NOT NULL,
Age INT NOT NULL CHECK(Age between 16 and 65),
EnrollmentDate DATE NOT NULL
)

drop table Students


8. Kurslar

Courses adlı cədvəl yarat:

CourseID – Primary Key

CourseName – unikal

DurationHours – 0-dan böyük

Price – decimal tipində

IsActive – default olaraq 1


CREATE TABLE Courses (
CourseID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
CourseName NVARCHAR(50) NOT NULL,
DurationHours INT not null CHECK (DurationHours>0),
Price DECIMAL(10,2) not null,
IsActive BIT not null DEFAULT 1
)

drop table Courses

9. Giriş Jurnalı (Log)

UserLogs adlı cədvəl yarat:

LogID – avtomatik artan

UserID – Users cədvəlinə bağlı

LoginTime – tarix və saat

IPAddress – IP formatında saxlanacaq

IsSuccess – BIT


CREATE TABLE UserLogs(
LogID int identity(1,1) not null UNIQUE,
UserID int not null,
CONSTRAINT FK_UserLogs_Users FOREIGN KEY (UserID) REFERENCES Users(UserID),
LoginTime DATETIME2 not null DEFAULT SYSDATETIME(),
IPAddress NVARCHAR(15) not null ,
IsActive BIT not null DEFAULT 1
)




10. Anbar Hərəkətləri

StockMovements adlı cədvəl yarat:

MovementID – Primary Key

ProductID – Products cədvəlinə bağlı

MovementType – yalnız IN və OUT

Quantity – 0-dan böyük

MovementDate – tarix



CREATE TABLE StockMovements (
MovementID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
ProductID INT NOT NULL,
CONSTRAINT FK_StockMovements_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
MovementType NVARCHAR(20) not null check(MovementType in ('IN','OUT')),
Quantity INT NOT NULL CHECK(Quantity>0),
MovementDate DATE NOT NULL
)