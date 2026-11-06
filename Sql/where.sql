Update CUSTOMER
set AGE=null
Where AGE between 43 and 51 --Sorgusunu yazin ve tasklarin icrasina davam

select * from CUSTOMER

1.CUSTOMERNAME dəyəri YA ilə başlayan müştəriləri tapın ve default olaraq Citye esasen siralayin?

Select * from CUSTOMER
where CUSTOMERNAME like 'YA%'
order by CITY

2.Soyadı OĞLU ilə bitməyən müştəriləri seçin?

SELECT * FROM CUSTOMER
WHERE CUSTOMERNAME NOT LIKE '%OĞLU' --and CUSTOMERNAME NOT LIKE '%OGLU'

3.AGE dəyəri 25 ilə 80 arasında olan ve ID si 16,26,36,46 olmayan müştəriləri seçən SQL sorğusunu yazın.

SELECT * FROM CUSTOMER
where AGE between 25 and 80 and ID not in (16,26,36,46) 
order by AGE

4.Yaşı 30 ilə 60 aralığında olmayan müştəriləri ve ID si 20 ilə 30 arasinda olan müştəriləri seçən SQL sorğusunu yazın.

select * from CUSTOMER
where AGE not between 30 and 60 and ID between 20 and 30
order by AGE

5.CITY sahəsi Erzincan və Isparta olan müştəriləri seçmək üçün SQL sorğusunu yazın.

select * from CUSTOMER
where CITY='Erzincan' or CITY='Isparta'

6.DISTRICT dəyəri Artvin və Gelendost olmayan müştəriləri seçmək üçün  SQL sorğusunu yazın.

select * from CUSTOMER
where DISTRICT!='Artvin' and DISTRICT!='Gelendost'

7.DISTRICT sahəsi boş (NULL) olan müştəriləri tapmaq üçün SQL sorğusunu yazın.

select * from CUSTOMER
where DISTRICT is null 

8.BIRTHDATE   (NULL) olmayan müştəriləri tapmaq üçün SQL sorğusunu yazın.

select * from CUSTOMER
where BIRTHDATE is not null

9.CITY - Ordu, GENDER - ERKEK və DISTRICT - Çatalpınar olan müştəriləri tapmaq üçün SQL sorğusu yazın.

select * from CUSTOMER
where CITY='Ordu' and GENDER='ERKEK' and DISTRICT='Çatalpınar'

10.GENDER - ERKEKolan  və ya AGE boyuk  50 olan müştəriləri tapmaq üçün  SQL sorğusu yazın.

select * from CUSTOMER
where GENDER='ERKEK' or AGE>50

11.DISTRICT dəyərində Artvin olan  və  CITY Artvin  olan müştəriləri seçmək üçün  SQL sorğusunu yazın.

select * from CUSTOMER
where DISTRICT like '%Artvin' and CITY='Artvin'

12.ID si 7 -22 araliginda ve Age i null olmayan musterileri secin.

select * from CUSTOMER
where ID between 7 and 22 and AGE is not null

13. Şəhəri Şanlıurfa ,Rize,Burdur ve Tunceli olan , xanim olmayan ve Yaşı null olanları seç.

select * from CUSTOMER
where CITY in('Şanlıurfa' ,'Rize','Burdur','Tunceli') and GENDER not in ('KADIN') and AGE is null

14.Yaşı 25 dən çox olan(az olan+),Adında Hazal olan və istanbulda yaşamayan  müştəriləri tapın.

select * from CUSTOMER
where AGE <= 25 and CUSTOMERNAME like 'Hazal%' and CITY<>'İstanbul'

15.İstanbulda yaşayan ,yaşı 35-65 arasında olan bütün kişiləri tapın.

select * from CUSTOMER
where CITY='İstanbul'  and AGE between 35 and 65


