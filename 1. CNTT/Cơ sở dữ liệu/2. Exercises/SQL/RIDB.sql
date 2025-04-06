create table Category
(
	CategoryID char (3) primary key,
	CategoryName char (30)
)
drop table Category

insert into Category
values
	('CO1','MyPham'),
	('CO2','Thuoc'),
	('CO3','VanPhongPham'),
	('CO4','ThoiTrang'),
	('CO5','DoChoi');
select * from Category
delete from Category

create table Product
(
	ProductID char (3) primary key,
	ProductName char (30),
	UnitPrice int,
	CategoryID char (3)
)
drop table Product
insert into Product
values
	('P01', 'A1', 10, 'C01'),
	('P02', 'A2', 10, 'C01'),
	('P03', 'A3', 10, 'C01'),
	('P04', 'A4', 10, 'C01'),
	('P05', 'A5', 20, 'C01'),
	('P06', 'A6', 30, 'C01'),
	('P07', 'B1', 20, 'C02'),
	('P08', 'B2', 40, 'C02'),
	('P09', 'B3', 10, 'C02'),
	('P10', 'B4', 50, 'C02'),
	('P11', 'B5', 30, 'C02'),
	('P12', 'B6', 20, 'C02'),
	('P13', 'C1', 60, 'C03'),
	('P14', 'C2', 20, 'C03'),
	('P15', 'C3', 20, 'C03'),
	('P16', 'C4', 10, 'C03'),
	('P17', 'C5', 20, 'C03'),
	('P18', 'C6', 10, 'C03'),
	('P19', 'D1', 20, 'C04'),
	('P20', 'D2', 40, 'C04'),
	('P21', 'D3', 90, 'C04'),
	('P22', 'D4', 10, 'C04'),
	('P23', 'D5', 80, 'C04'),
	('P24', 'D6', 40, 'C04'),
	('P25', 'E1', 70, 'C05'),
	('P26', 'E2', 50, 'C05'),
	('P27', 'E3', 40, 'C05'),
	('P28', 'E4', 10, 'C05'),
	('P29', 'E5', 50, 'C05'),
	('P30', 'E6', 30, 'C05');
select * from Product
delete from Product

create table Invoice
(
	InvoiceID char (3) primary key,
	InvoiceDate date,
	Description char (50)
)
drop table Invoice
insert into Invoice
values
	('I01','2021-03-01',''),
	('I02','2021-03-01',''),
	('I03','2022-03-02',''),
	('I04','2022-03-02',''),
	('I05','2021-03-03',''),
	('I06','2020-03-03',''),
	('I07','2021-03-04',''),
	('I08','2022-03-04',''),
	('I09','2021-03-05',''),
	('I10','2022-03-05','');
select * from Invoice
delete from Invoice

create table InvoiceDetail
(
	InvoiceID char (3),
	ProductID char (3),
	Quantity int,
	primary key (InvoiceID, ProductID) 
)
drop table InvoiceDetail
insert into InvoiceDetail
values
	('I01','P01',2),
	('I01','P02',5),
	('I01','P03',8),
	('I01','P04',1),
	('I01','P05',5),
	('I01','P06',4),
	('I01','P07',7),
	('I01','P08',3),
	('I01','P09',2),
	('I01','P10',8),
	('I01','P11',1),
	('I01','P12',6),
	('I02','P01',1),
	('I02','P05',5),
	('I03','P02',8),
	('I03','P20',7),
	('I04','P18',5),
	('I04','P15',2),
	('I04','P03',10),
	('I04','P10',8),
	('I05','P02',5),
	('I05','P28',5),
	('I06','P14',2),
	('I06','P06',5),
	('I06','P20',6),
	('I07','P10',5),
	('I08','P01',2),
	('I08','P24',6),
	('I08','P12',12),
	('I08','P02',21),
	('I08','P08',8),
	('I08','P11',5),
	('I09','P19',4),
	('I09','P25',7),
	('I10','P01',2),
	('I10','P25',7),
	('I10','P27',6);
select * from InvoiceDetail
delete from InvoiceDetail

--Unique - NOT NULL
alter table category
add unique (categoryName)
alter table category
alter column categoryName
set not null

alter table product
alter column productname
set not null
alter table product
alter column unitprice
set not null
alter table product
alter column categoryid
set not null

alter table invoice
alter column invoicedate
set not null

alter table invoicedetail
alter column quantity
set not null

Alter table Product
add constraint KTunitprice
Check (unitprice > 0)
insert into product
values ('P31', 'E6', -10, 'C05');

Alter table InvoiceDetail
add constraint KTquantity
Check (quantity > 0)
insert into invoicedetail
values ('I10','P01',-6);

select distinct InvoiceID
from InvoiceDetail X, product Y
where CategoryID = 'C01' and X.ProductID = Y.ProductID
	and not exists (select *
				   from product
				   where categoryID  = 'C01'
				   	and productID not in
				   		(select productid from invoiceDetail
							where X.invoiceID = invoiceID))

5.1
SELECT * FROM Product
WHERE CategoryID = 'C01'

5.2
SELECT ProductID, ProductName, UnitPrice FROM Product
WHERE CategoryID = 'C02'

5.3
SELECT * FROM Product
WHERE UnitPrice >= 10 AND UnitPrice <= 50

5.4
SELECT * FROM Invoice
WHERE InvoiceDate = '2022-03-02'

5.5
SELECT * FROM Invoice
WHERE date_part ('year', InvoiceDate) = '2021'

5.6
SELECT A.ProductID, ProductName, U`nitPrice, B.Quantity 
FROM Product A, InvoiceDetail B, Invoice C
WHERE A.ProductID = B.ProductID
	AND B.InvoiceID = C.InvoiceID
	AND C.InvoiceDate = '2022-03-02'

5.7
SELECT InvoiceID, SUM(quantity)
FROM InvoiceDetail
GROUP BY InvoiceID

5.8
SELECT B.InvoiceID, SUM(quantity)
FROM Invoice A, InvoiceDetail B
WHERE A.InvoiceID = B.InvoiceID
	AND InvoiceDate = '2022-03-02'
GROUP BY B.InvoiceID

5.9
SELECT A.InvoiceID, SUM(quantity*UnitPrice)
FROM InvoiceDetail A, Product B
WHERE A.ProductID = B.ProductID
GROUP BY A.InvoiceID

5.10
/*SELECT A.InvoiceID, SUM(Quantity)
FROM InvoiceDetail A, Invoice B
WHERE A.InvoiceID = B.InvoiceID
GROUP BY A.InvoiceID
HAVING SUM(Quantity) >= ALL(SELECT SUM(Quantity)
						   FROM InvoiceDetail A, Invoice B
							WHERE A.InvoiceID = B.InvoiceID
							GROUP BY A.InvoiceID)*/

select InvoiceID, sum(quantity)
from invoicedetail
group by invoiceid
having sum(quantity) >= all (select sum(quantity)
							from invoicedetail
							group by invoiceid)

5.11
SELECT A.InvoiceID, SUM(Quantity)
FROM InvoiceDetail A, Invoice B
WHERE A.InvoiceID = B.InvoiceID
	AND InvoiceDate = '2022-03-02'
GROUP BY A.InvoiceID
HAVING SUM(Quantity) >= ALL(SELECT SUM(Quantity)
						   FROM InvoiceDetail A, Invoice B
							WHERE A.InvoiceID = B.InvoiceID
								AND InvoiceDate = '2022-03-02'
							GROUP BY A.InvoiceID)

5.12
SELECT A.InvoiceID, SUM(quantity*UnitPrice)
FROM InvoiceDetail A, Product B
WHERE A.ProductID = B.ProductID
GROUP BY A.InvoiceID
HAVING SUM(quantity*UnitPrice) >= ALL(SELECT SUM(quantity*UnitPrice)
						   FROM InvoiceDetail A, Product B
							WHERE A.ProductID = B.ProductID
							GROUP BY A.InvoiceID)
							
5.13
SELECT A.InvoiceID, SUM(quantity*UnitPrice)
FROM InvoiceDetail A, Product B, Invoice C
WHERE A.ProductID = B.ProductID
	AND A.InvoiceID = C.InvoiceID
	AND InvoiceDate = '2022-03-02'
GROUP BY A.InvoiceID
HAVING SUM(quantity*UnitPrice) >= ALL(SELECT SUM(quantity*UnitPrice)
						   FROM InvoiceDetail A, Product B, Invoice C
							WHERE A.ProductID = B.ProductID
								AND A.InvoiceID = C.InvoiceID
								AND InvoiceDate = '2022-03-02'
							GROUP BY A.InvoiceID)

/* 5.15(Thêm) Cho biết hóa đơn nào có trị giá lớn nhất. Chỉnh data để có đáp án là 3 invoice */
update InvoiceDetail
set Quantity = 5
where InvoiceID = 'I08'
	and ProductID = 'P01'
	
update InvoiceDetail
set Quantity = 48
where InvoiceID = 'I10'
	and ProductID = 'P01'

SELECT A.InvoiceID, SUM(quantity*UnitPrice)
FROM InvoiceDetail A, Product B
WHERE A.ProductID = B.ProductID
GROUP BY A.InvoiceID
HAVING SUM(quantity*UnitPrice) >= ALL(SELECT SUM(quantity*UnitPrice)
						   FROM InvoiceDetail A, Product B
							WHERE A.ProductID = B.ProductID
							GROUP BY A.InvoiceID)
							
SELECT A.InvoiceID, SUM(quantity*UnitPrice)
FROM InvoiceDetail A, Product B
WHERE A.ProductID = B.ProductID
GROUP BY A.InvoiceID


SELECT     *
FROM    Product
WHERE   ProductID   Not   In  (   SELECT   InvoiceID
                                                         FROM    Invoice   A,   InvoiceDetail   B
                                                          WHERE    InvoiceDate  =  '2023-06-23'
                                                                    AND   A.InvoiceID  =  B.InvoiceID  )
SELECT    *
FROM    Product  X
WHERE    Not   Exists   (   SELECT   B.ProductID
                                              FROM    Invoice  A,   InvoiceDetail   B
                                              WHERE    InvoiceDate  =  '2022-03-01'
                                                       AND   A.InvoiceID  =  B.InvoiceID
                                                       AND   X.ProductID  =  B.ProductID
                                          )
										  
SELECT  Date_part('Quarter',  InvoiceDate), Sum(Quantity * UnitPrice)
FROM     Invoice  A,  InvoiceDetail  B, Product C
WHERE   Date_Part('Year', InvoiceDate)  =  '2022'    
                   AND     A.InvoiceID  =  B.InvoiceID
                   AND   B.ProductID = C.ProductID
GROUP BY   Date_part('Quarter',  InvoiceDate)


SELECT Sum(Quantity * UnitPrice)
FROM     Invoice  A,  InvoiceDetail  B, Product C
WHERE   Date_Part('Year', InvoiceDate)  =  '2022'    
                   AND     A.InvoiceID  =  B.InvoiceID
                   AND   B.ProductID = C.ProductID
GROUP BY   Date_part('Quarter',  InvoiceDate)

SELECT  A.InvoiceID, Sum(Quantity * UnitPrice)
FROM     Invoice  A,  InvoiceDetail  B, Product C
WHERE   Date_Part('Year', InvoiceDate)  =  '2023'    
                   AND     A.InvoiceID  =  B.InvoiceID
                   AND   B.ProductID = C.ProductID
GROUP BY   Date_part('Quarter',  InvoiceDate)


SELECT  Date_part('Month',  InvoiceDate), Sum(Quantity * UnitPrice)
FROM     Invoice  A,  InvoiceDetail  B, Product C
WHERE   Date_Part('Year', InvoiceDate)  =  '2022'    
                   AND     A.InvoiceID  =  B.InvoiceID
                   AND   B.ProductID = C.ProductID
GROUP BY   A.InvoiceID

SELECT  Date_part('Month',  InvoiceDate), Sum(Quantity * UnitPrice)
FROM     Invoice  A,  InvoiceDetail  B, Product C
WHERE   Date_Part('Year', InvoiceDate)  =  '2022'    
                   AND     A.InvoiceID  =  B.InvoiceID
                   AND   B.ProductID = C.ProductID
GROUP BY   Date_part('Month',  InvoiceDate)