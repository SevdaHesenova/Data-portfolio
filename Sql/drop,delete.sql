
﻿/*Tapşırıq 1

Yeni bir database yarat:
Adı: StudentManagement

CREATE DATABASE StudentManagement;
USE StudentManagement;

Tapşırıq 2
Students adlı cədvəl yarat və aşağıdakı sütunları əlavə et:
StudentID (tam ədəd)
FullName (mətn)
BirthDate (tarix)
Email (mətn)
IsActive (bit)

CREATE TABLE Students(
StudentID INT PRIMARY KEY,
FullName NVARCHAR(50),
BirthDate DATE,
Email NVARCHAR(50),
IsActive BIT DEFAULT 0
)

Tapşırıq 3
Faculties adlı cədvəl yarat:
FacultyID
FacultyName

CREATE TABLE Faculties (
    FacultyID INT PRIMARY KEY,
    FacultyName NVARCHAR(100)
);

Tapşırıq 4
Students cədvəlinə yeni sütun əlavə et:
EnrollmentDate (tarix)

ALTER TABLE Students 
ADD
COLUMN EnrollmentDate DATE
 

Tapşırıq 5
Email sütununun ölçüsünü dəyiş:
əvvəl: 50 simvol
sonra: 100 simvol


ALTER TABLE Students
ALTER COLUMN Email NVARCHAR(100);


Tapşırıq 6
Students cədvəlindən IsActive sütununu sil


ALTER TABLE Students
DROP COLUMN IsActive


Tapşırıq 7
Students cədvəlinə aşağıdakı qaydanı tətbiq et:
BirthDate 2005-dən böyük ola bilməz


ALTER TABLE Students
ADD 
CONSTRAINT S_BirthDate
CHECK (BirthDate <= '2005-12-31');


Tapşırıq 8
Yuxarıda yaratdığın qaydanı cədvəldən sil

ALTER TABLE Students
DROP CONSTRAINT S_BirthDate;


Tapşırıq 9
Faculties cədvəlinə 3 fakültə əlavə et:
IT
Economics
Engineering


INSERT INTO Faculties (FacultyName)
VALUES 
('IT'),
('Economics'),
('Engineering');


Tapşırıq 10
Students cədvəlinə ən azı 5 tələbə əlavə et:
fərqli adlar
fərqli doğum tarixləri
fərqli fakültələr

SELECT * FROM Students
INSERT INTO Students (StudentID, FullName, BirthDate, Email)
VALUES
(1, 'Ali Mammadov', '2003-05-10', 'ali@mail.com'),
(2, 'Veli Hasanov', '2001-03-15', 'veli@mail.com'),
(3, 'Aysel Karimova', '2004-07-20', 'aysel@mail.com'),
(4, 'Murad Aliyev', '2002-01-12', 'murad@mail.com'),
(5, 'Nigar Huseynova', '2003-11-25', 'nigar@mail.com');


Tapşırıq 11
Adı “Ali” olan tələbənin email ünvanını dəyiş


UPDATE Students
SET Email = 'ali_new@mail.com'
WHERE FullName LIKE 'Ali%';


Tapşırıq 12
2000-ci ildən əvvəl doğulan tələbələri sil


DELETE FROM Students
WHERE BirthDate < '2000-01-01';

Tapşırıq 13
Faculties cədvəlindəki bütün məlumatları:
Əvvəl DELETE ilə sil
Sonra eyni cədvəli TRUNCATE ilə təmizlə: --Fərqi yazılı şəkildə izah et


DELETE FROM Faculties;

TRUNCATE TABLE Faculties; 


Tapşırıq 14
Tələbələri yeni bir cədvələ köçür
Yeni cədvəl: ActiveStudents

SELECT * INTO ActiveStudents FROM Students;


Tapşırıq 15
Aşağıdakıları mərhələli şəkildə sil:
ActiveStudents cədvəlini
Faculties cədvəlini
Students cədvəlini


DROP TABLE ActiveStudents;
DROP TABLE Faculties;
DROP TABLE Students;


Tapşırıq 16
Aşağıdakı suallara cavab ver: 
DELETE və TRUNCATE arasındakı fərqlər 
ALTER nə zaman istifadə olunur? sütun əlavə etmək,sütun silmək,datatype dəyişmək
Hansı əmrlər DDL, hansılar DML-dir?

DDL-CREATE,ALTER,DROP,TRUNCATE - CEDVELDE DEYISIKLIK

DML-INSERT,UPDATE,DELETE,SELECT - MELUMATLARDA DEYISIKLIK