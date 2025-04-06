create table Category
(
	CategoryID char (3) primary key,
	CategoryName char (30)
)
drop table Category
insert into Category
values
	('C01','A'),
	('C02','B'),
	('C03','C'),
	('C04','D'),
	('C05','E');
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
	('A1','AA',10,'C01'),
	('A2','AB',20,'C01'),
	('A3','AC',10,'C01'),
	('A4','AD',30,'C01'),
	('A5','AE',10,'C01'),
	('A6','AF',20,'C01'),
	('B1','BA',10,'C02'),
	('B2','BB',20,'C02'),
	('B3','BC',40,'C02'),
	('B4','BD',30,'C02'),
	('B5','BE',10,'C02'),
	('B6','BF',20,'C02'),
	('C1','CA',50,'C03'),
	('C2','CB',20,'C03'),
	('C3','CC',30,'C03'),
	('C4','CD',10,'C03'),
	('C5','CE',20,'C03'),
	('C6','CF',20,'C03'),
	('D1','DA',10,'C04'),
	('D2','DB',10,'C04'),
	('D3','DC',10,'C04'),
	('D4','DD',70,'C04'),
	('D5','DE',30,'C04'),
	('D6','DF',50,'C04'),
	('E1','EA',10,'C05'),
	('E2','EB',20,'C05'),
	('E3','EC',10,'C05'),
	('E4','ED',30,'C05'),
	('E5','EE',10,'C05'),
	('E6','EF',20,'C05');
SELECT * FROM Product
DELETE FROM Product

create table Warehouse
(
	WarehouseID char (3) primary key,
	WarehouseAddress char (50),
	CategoryID char (3)
)
drop table Warehouse
INSERT INTO Warehouse
VALUES
	('W01','Q1','C01'),
	('W02','Q2','C01'),
	('W03','Q3','C02'),
	('W04','Q4','C03'),
	('W05','Q5','C04'),
	('W06','Q6','C04'),
	('W07','Q7','C05');
SELECT * FROM Warehouse
DELETE FROM Warehouse

create table Instock
(
	WarehouseID char (3),
	ProductID char (3),
	Quantity int,
	primary key (WarehouseID, ProductID)
)
drop table Instock
insert into Instock
values
	('W01','A1',20),
	('W01','A2',90),
	('W01','A3',10),
	('W01','A4',20),
	('W01','A5',10),
	('W01','A6',20),
	('W03','B6',110),
	('W03','B1',10),
	('W03','B2',10),
	('W03','B3',80),
	('W03','B4',50),
	('W03','B5',80),
	('W04','C1',110),
	('W04','C2',110),
	('W04','C3',110),
	('W04','C4',10),
	('W04','C6',70),
	('W05','D1',60),
	('W05','D2',40),
	('W05','D3',30),
	('W05','D4',10),
	('W05','D5',80),
	('W05','D6',90),
	('W06','D1',100),
	('W06','D2',100),
	('W06','D3',100),
	('W06','D6',10),
	('W07','E1',40),
	('W07','E2',50),
	('W07','E3',90),
	('W07','E4',70),
	('W07','E5',30);
SELECT * FROM Instock
DELETE FROM Instock

--NOT NULL _ UNIQUE _ CHECK
alter table category
alter column categoryname
set not null
Alter Table category
Add Unique (categoryName)

alter table product
alter column productname
set not null
alter table product
alter column unitprice
set not null
Alter table product
add constraint KTunitp
Check (UnitPrice > 0)
alter table product
alter column categoryid
set not null

alter table warehouse
alter column warehouseaddress
set not null
alter table warehouse
alter column categoryid
set not null

alter table instock
alter column quantity
set not null
Alter table instock
add constraint KTquantity
Check (quantity > 0)

--Câu a : Những mặt hàng chưa phân phối vào kho
Select *
from product
where productid not in
	(select productid
	From instock)
	
--Câu b: Kho không chứa hàng
Select *
From Warehouse
where WarehouseID not in
	(Select WarehouseID
	From Instock)

--Câu c: Kiểm tra mặt hàng nào đưa vào kho sai (kho có loại hàng này nhưng đưa sản phẩm loại khác vào)
Select *
From Instock A
where ProductID not in
	(Select productID
	from warehouse B, product C
	where A.warehouseID = B.warehouseID
		and B.categoryID = C.CategoryID)
		
--Câu 5.1
select * from Product
where categoryID = 'C02'

--Câu 5.2
select * from Warehouse
where categoryID = 'C02'

--Câu 5.3
select C.*
from Product A, Instock B, Warehouse C
where A.ProductID = B.ProductID
	and B.WarehouseID = C.WarehouseID
	and ProductName = 'AA'

--Câu 5.4
select A.*
from Product A, Warehouse B
where A.categoryID = B. CategoryID
	and warehouseID = 'W01'
	
--Câu 5.5
select A.warehouseID, sum(quantity)
from Warehouse A, Instock B
where A.warehouseid = B.warehouseid
group by A.warehouseid

--Câu 5.6
select A.warehouseID, sum(quantity)
from Warehouse A, Instock B
where A.warehouseid = B.warehouseid
group by A.warehouseid
having Sum(quantity) >= all(select sum(quantity)
						  from Warehouse A, Instock B
							where A.warehouseid = B.warehouseid
							group by A.warehouseid)

--Câu 5.7
select 

/*Cho biết kho nào hiện chứa tất cả các loại hàng mà kho đó được phép chứa
(Chỉnh dữ liệu để có 2 kho)*/
select distinct 0

SELECT  CategoryID,  Count( * )

FROM   Product

GROUP  BY   CategoryID



SELECT  ProductID,  Sum( Quantity )

FROM   Instock

GROUP  BY   ProductID


SELECT  Sum(Quantity)

FROM    Instock

GROUP BY   WareHouseID

SELECT   *

FROM    Product

WHERE   UnitPrice   =   (  SELECT  Max( UnitPrice )

                                                   FROM  Product   )


SELECT   ProductID,  Sum( Quantity )  AS  Total

FROM   Instock

GROUP  BY   ProductID

HAVING  Sum( Quantity )   >=   All (  SELECT   Sum( Quantity )

                                                 FROM   Instock

                                                  GROUP  BY   ProductID   )
