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

create table Customer
(
	CustomerID char (3) primary key,
	CustomerName char (30),
	CustomerAddress char (30)
)
drop table Customer
INSERT into Customer
values
	('M01','AN','HCM'),
	('M02','ANH','HCM'),
	('M03','BINH','HCM'),
	('M04','CHAU','HCM'),
	('M05','CUONG','HCM'),
	('M06','DIEU','HCM'),
	('M07','GIANG','HCM'),
	('M08','HUNG','HCM'),
	('M09','HOANG','HCM'),
	('M10','KIEN','HCM'),
	('M11','LINH','HCM'),
	('M12','MINH','HCM'),
	('M13','TU','HCM'),
	('M14','UYEN','HCM'),
	('M15','VY','HCM');
SELECT * FROM Customer
delete from customer

create table Orders
(
	OrderID char (3) primary key,
	OrderDate date,
	RequiredDate date,
	CustomerID char (20)
)
drop table Orders
insert into orders
values
	('R01','2023-04-01','2023-04-03','M01'),
	('R02','2023-04-02','2023-04-04','M01'),
	('R03','2023-04-02','2023-04-04','M02'),
	('R04','2023-04-03','2023-04-05','M03'),
	('R05','2023-04-04','2023-04-06','M03'),
	('R06','2023-04-04','2023-04-06','M03'),
	('R07','2023-04-05','2023-04-07','M02'),
	('R08','2023-04-06','2023-04-08','M04'),
	('R09','2023-04-06','2023-04-08','M05'),
	('R10','2023-04-07','2023-04-09','M06');
select * from Orders
delete from Orders

create table OrderDetail
(
	OrderID char (3),
	ProductID char (3),
	OrderQuantity int,
	primary key (OrderID, ProductID)
)
drop table OrderDetail
insert into OrderDetail
values
	('R01','A1',10),
	('R01','A2',10),
	('R01','A3',10),
	('R01','A4',10),
	('R01','A5',10),
	('R01','A6',10),
	('R01','B1',10),
	('R02','C1',20),
	('R02','D1',20),
	('R02','E1',20),
	('R02','A2',20),
	('R03','A6',30),
	('R04','A1',40),
	('R04','B1',40),
	('R04','C1',40),
	('R04','D1',40),
	('R04','E1',40),
	('R05','D4',50),
	('R06','A3',60),
	('R06','C3',60),
	('R07','A4',70),
	('R07','B4',70),
	('R08','A3',80),
	('R09','A5',90),
	('R09','B5',90),
	('R09','C5',90),
	('R10','D5',100),
	('R10','E5',100);
select * from OrderDetail
delete from OrderDetail

create table Delivery
(
	DeliveryID char (10) primary key,
	DeliveryDate date,
	OrderID char (3)
)
drop table Delivery
insert into Delivery
values
	('D01','2023-04-02','R01'),
	('D02','2024-04-04','R02'),
	('D03','2024-04-04','R03'),
	('D05','2023-04-26','R05'),
	('D06','2023-04-16','R06'),
	('D07','2024-04-07','R07'),
	('D08','2024-04-08','R08'),
	('D09','2023-04-28','R09'),
	('D10','2023-04-29','R10'),
	('D11','2023-06-02','R01'),
	('D12','2023-07-02','R01'),
	('D13','2023-05-20','R10');
SELECT * from Delivery
delete from Delivery

create table DeliveryDetail
(
	DeliveryID char (10),
	ProductID char (3),
	DeliveryQuantity int,
	primary key (DeliveryID, ProductID)
)
drop table DeliveryDetail
insert into DeliveryDetail
values
	('D01','A1',10),
	('D01','A2',10),
	('D01','A3',10),
	('D01','A4',10),
	('D01','A5',5),
	('D11','A6',5),
	('D12','B1',10),
	('D02','C1',20),
	('D02','D1',20),
	('D02','E1',15),
	('D02','A2',10),
	('D03','A6',30),
	('D04','A1',40),
	('D04','B1',40),
	('D04','C1',40),
	('D04','D1',40),
	('D04','E1',40),
	('D05','D4',50),
	('D06','A3',50),
	('D06','C3',60),
	('D07','A4',70),
	('D07','B4',70),
	('D08','A3',80),
	('D09','A5',90),
	('D09','B5',90),
	('D09','C5',80),
	('D10','D5',50),
	('D13','E5',100);
select * from DeliveryDetail
delete from DeliveryDetail

--ĐK_NOTNULL_UNIQUE
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

alter table customer
alter column customername
set not null
alter table customer
alter column customeraddress
set not null

alter table orders
alter column orderdate
set not null
alter table orders
alter column requireddate
set not null
alter table orders
alter column customerid
set not null
alter table orders
add constraint ktdate
check (orderdate <= requireddate)

--drop:
alter table orders drop constraint ktdate

alter table orderdetail
alter column orderquantity
set not null
Alter table orderdetail
add constraint KTorderquantity
Check (orderquantity > 0)

alter table delivery
alter column deliverydate
set not null
alter table delivery
alter column orderid
set not null

alter table deliverydetail
alter column deliveryquantity
set not null
Alter table deliverydetail
add constraint KTdeliveryquantity
Check (deliveryquantity > 0)

select A.DeliveryID, B.OrderID
From Delivery A, Orders B
where A.OrderID = B.OrderID
	and A.deliveryDate < B.orderdate
	
Select orderID, count(*) as SoDotGiao
from Delivery
Group by OrderID

select *
from DeliveryDetail
where deliveryID not in
	(select deliveryID
	from delivery)
	
Select customerID, count (*) as SoLanDat
from Orders
Group by CustomerID
Order by CustomerID

--Tính trị giá của từng đơn đặt hàng:
select B.orderid, sum(unitprice * orderquantity)
from Product A, OrderDetail B
where A.ProductID = B.ProductID
group by B.orderid

--Đơn đặt hàng nào chứa tất cả các mặt hàng của loại C01
-- (update để có ít nhất 2 đơn KQ)
select distinct A
from R1 X
where not Exists
	(select *
	from R4
	where B not in (select B
				   From R1
				   Where X.A = A))