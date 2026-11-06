/*1.Hər BRANCH üzrə:

ümumi satış məbləğini ,
satılan sətir sayını hesabla.

SELECT 
    BRANCH,
    SUM(LINENETTOTAL) AS TOTAL,
    COUNT(*) AS ROW_COUNT
FROM SALES
GROUP BY BRANCH;

2.Hər CITY üzrə satılan fərqli məhsul sayını tap.

SELECT 
    DISTINCT CITY,
    COUNT(DISTINCT ITEMNAME) AS Product_COUNT
FROM SALES
GROUP BY CITY;


3.Hər REGION üzrə ümumi satış məbləğini hesabla
və nəticəni satış məbləzinə görə azalan sırala.

SELECT 
   REGION,
   SUM(LINENETTOTAL) AS TOTAL
FROM SALES
GROUP BY REGION
ORDER BY TOTAL DESC

4.Yalnız CATEGORY_NAME1 = 'GIDA' olan sətirlər üçün
hər CATEGORY_NAME2 üzrə ümumi satış məbləğini tap.

SELECT 
   CATEGORY_NAME2,
   SUM(LINENETTOTAL) AS TOTAL
FROM SALES
WHERE CATEGORY_NAME1 = 'GIDA'
GROUP BY CATEGORY_NAME2

5.Hər BRANCH üzrə orta satış qiymətini hesabla.

SELECT 
   BRANCH,
   AVG(PRICE) AS AVG
FROM SALES
GROUP BY BRANCH

6.Ümumi satış məbləği 50.000-dən böyük olan branch-ləri tap.

SELECT 
   BRANCH,
   SUM(LINENETTOTAL) AS TOTAL
FROM SALES
GROUP BY BRANCH
HAVING SUM(LINENETTOTAL)>50000


7.Hər CLIENTNAME üzrə:
neçə fərqli FICHENO olduğunu tap.

SELECT 
   CLIENTNAME,
   COUNT(DISTINCT FICHENO) AS TOTAL
FROM SALES
GROUP BY CLIENTNAME

8.CATEGORY_NAME1 = 'DETERJAN TEMİZLİK' olan məhsullar üçün
hər BRAND üzrə satılan məhsul sayını hesabla.

SELECT 
   BRANCH,
   COUNT(LINENETTOTAL) AS TOTAL
FROM SALES
WHERE CATEGORY_NAME1 = 'DETERJAN TEMİZLİK'
GROUP BY BRANCH

9.Hər CITY + CATEGORY_NAME1 kombinasiyası üzrə
ümumi satış məbləğini tap.

SELECT 
    CITY,
    CATEGORY_NAME1,
    SUM(LINENETTOTAL) AS TOTAL
FROM SALES
GROUP BY CITY, CATEGORY_NAME1;

10.Orta satış qiyməti 30 dan böyük olan ITEMNAME-ləri tap.

SELECT 
   ITEMNAME,
   AVG(PRICE) AS AVG
FROM SALES
GROUP BY ITEMNAME
HAVING AVG(PRICE)>30

11.Hər BRANCH üzrə:
ümumi satılan miqdarı  hesabla
,yalnız miqdarı 30.000 dən böyük olanları göstər.

SELECT 
   BRANCH,
   SUM(AMOUNT) AS TOTAL
FROM SALES
GROUP BY BRANCH
HAVING SUM(AMOUNT)>30000

12.Hər CATEGORY_NAME1 üzrə:
minimum qiyməti ,maksimum qiyməti tap.

SELECT 
   CATEGORY_NAME1,
   MAX(PRICE) AS MAX,
   MIN(PRICE) AS MIN
FROM SALES
GROUP BY CATEGORY_NAME1

13.Yalnız REGION = 'Marmara' olan sətirlər üçün
hər CITY üzrə ümumi satış məbləğini hesabla.

SELECT 
   CITY,
   SUM(LINENETTOTAL) AS TOTAL
FROM SALES
WHERE REGION = 'Marmara'
GROUP BY CITY

14.Hər BRANCH + CATEGORY_NAME1 üzrə:
ümumi satış məbləğini tap
nəticəni əvvəl BRANCH, sonra satış məbləği DESC üzrə sırala.

SELECT 
   BRANCH,
   CATEGORY_NAME1,
   SUM(LINENETTOTAL) AS TOTAL
FROM SALES
GROUP BY BRANCH,CATEGORY_NAME1
ORDER BY BRANCH DESC, CATEGORY_NAME1 DESC

15.Eyni ITEMNAME-in
ən azı 2 fərqli CITY-də satıldığı məhsulları tap.

SELECT 
    ITEMNAME
FROM SALES
GROUP BY ITEMNAME
HAVING COUNT(DISTINCT CITY) >= 2;

