create table Category
( 
	CategoryId char(3) primary key,
	CategoryName varchar(30) 
)
insert into Category
values
('C01','Cong Nghe'),
('C02','My Pham'),
('C03','Hang Tieu Dung'),
('C04','Thoi Trang'),
('C05','Thuc Pham')
select * from Category
delete from Category

drop table Category
-----------------------
create table Product
( 
	ProductID char(3) primary key, 
	ProductName char(30), 
	UnitPrice int,
	CategoryId char(3)
)
insert into Product
values
	('P01','Điện thoại ',12000000,'C01'),
	('P02','Ti vi',15000000,'C01'),
	('P03','laptop',20000000,'C01'),
	('P04','Macbook',40000000,'C02'),
	('P05','IPad',13000000,'C02'),
	('P06','Tai nghe',12000000,'C02'),
	('P07','Son',120000,'C02'),
	('P08','Kem nền',300000,'C02'),
	('P09','Phấn mắt',160000,'C02'),
	('P10','Kem che khuyết điểm',200000,'C02'),
	('P11','Nước tẩy trang',240000,'C02'),
	('P12','Son Dưỡng',100000,'C02'),
	('P13','Bột Giặt',120000,'C03'),
	('P14','Nước rửa chén',30000,'C03'),
	('P15','Nước tẩy',40000,'C03'),
	('P16','Nước rửa tay',120000,'C03'),
	('P17','Dầu gội ',80000,'C03'),
	('P18','Dầu xả',100000,'C03'),
	('P19','Quần ống rộng',120000,'C04'),
	('P20','Quần jean',300000,'C04'),
	('P21',' Áo phông',150000,'C04'),
	('P22','Áo polo',250000,'C04'),
	('P23','Áo sơ mi ',200000,'C04'),
	('P24','Áo khoác ',400000,'C04'),
	('P25','Bánh bao nhân thịt',40000,'C04'),
	('P26','Lẩu Thái',300000,'C04'),
	('P27','Cá viên ',40000,'C04'),
	('P28','Gạo',150000,'C05'),
	('P29','Bột mì',30000,'C05'),
	('P30','Nấm ',40000,'C05')

select * from Product
delete from Product

drop table Product
------------------------------------
create table customer
(
	customerid char(3) primary key,
	customername varchar(30),
	customeraddress varchar(30)
)
insert into customer
values
('M01','cong nguyen doan','binh duong'),
('M02','tran bang bang','thu duc'),
('M03','ngo van khoi','tp ho chi minh'),
('M04','tran thi ngoc tram','ca mau'),
('M05','do xuan chien','ben cac'),
('M06','ngo minh khoi','dak lak'),
('M07','hoang ha','dak nog'),
('M08','bich tram','meme so dark'),
('M09','tran kim loan','hue'),
('M10','ong noi nguyen','ca mau'),
('M11','bing chingling','trung quoc'),
('M12','pham hoang long','thu dau mot')


select * from customer
delete from customer

drop table customer
-------------------------------------
create table Orders
(
	Ordersid char(3),
	Ordersdate date,
	Requiredate date,
	Customerid char(3),
	primary key(ordersid,customerid)
)
insert into Orders
values
('R01','12-11-2020','20-11-2020','M01'),
('R02','12-11-2020','20-11-2020','M01'),
('R03','12-11-2020','20-11-2020','M01'),
('R04','12-06-2020','20-11-2020','M01'),
('R05','03-02-2020','10-02-2021','M04'),
('R06','01-03-2020','01-04-2021','M04'),
('R07','02-07-2020','01-01-2023','M07'),
('R08','12-02-2020','20-02-2021','M05'),
('R09','20-01-2020','19-02-2021','M09'),
('R10','19-05-1890','30-04-1975','M11')
select * from Orders
delete from Orders

drop table Orders


create table OrderDetail 
(
	OrderID char(3),
	ProductID char(3),
	OrderQuantity int,
	primary key(OrderID,ProductID)
)
drop table OrderDetail

insert into OrderDetail 
values 
     ('R01','P01',3),
	 ('R01','P02',3),
	 ('R01','P03',3),
	 ('R02','P04',3),
	 ('R02','P05',3),
	 ('R02','P06',3),
	 ('R03','P07',3),
	 ('R03','P08',3),
	 ('R03','P09',3),
	 ('R04','P10',3),
	 ('R04','P11',3),
	 ('R04','P12',3),
	 ('R05','P13',3),
	 ('R05','P14',3),
	 ('R05','P15',3),
	 ('R06','P16',3),
	 ('R06','P17',3),
	 ('R06','P18',3),
	 ('R07','P19',3),
	 ('R07','P20',3),
	 ('R07','P21',3),
	 ('R08','P22',3),
	 ('R08','P23',3),
	 ('R08','P24',3),
	 ('R09','P25',3),
	 ('R09','P26',3),
	 ('R09','P27',3),
	 ('R10','P03',3),
	 ('R10','P02',3),
	 ('R10','P01',3)
select * from OrderDetail
delete from OrderDetail


create table Delivery 
(
	DeliveryID char(3) primary key, 
	DeliveryDate date,
	OrderID char(3) 
)
drop table Delivery
insert into Delivery
values
     ('L01','2023-12-12','R01'),
	 ('L02','2023-12-13','R01'),
	 ('L03','2023-12-14','R01'),
	 ('L04','2023-12-12','R02'),
	 ('L05','2023-8-12','R02'),
	 ('L06','2023-9-12','R02'),
	 ('L07','2023-10-12','R05'),
	 ('L08','2023-11-12','R06'),
	 ('L09','2023-11-13','R07'),
	 ('L10','2023-12-1','R10'),
	 ('L11','2023-9-2','R09'),
	 ('L12','2023-11-20','R08')
	 
select * from Delivery
delete from Delivery

create table DeliveryDetail 
(
	DeliveryID char(3),
	ProductID char(3),
	DeliveryQuantity int,
	primary key(DeliveryID,ProductID)
)
drop table DeliveryDetail
insert into DeliveryDetail
values
     ('L01','P01','3'),
	 ('L02','P02','3'),
	 ('L03','P03','3'),
	 ('L04','P03','3'),
	 ('L05','P04','3'),
	 ('L06','P05','3'),
	 ('L07','P13','3'),
	 ('L08','P18','3'),
	 ('L09','P21','3'),
	 ('L10','P30','3'),
	 ('L11','P27','3'),
	 ('L12','P24','3')
	 
select * from DeliveryDetail
delete from DeliveryDetail

5.1. All the products of category ID = "C02".

select *
from Product
where CategoryID='C02'

5.2. List of customers who took order with date from d1 to d2.

select *
from Orders
where date_part('day',OrdersDate) >= 1
and date_part('day',OrdersDate) <= 3
	 
5.3. List of customers (ID, name, address) who took order in year = 2021.

select Y.CustomerID,Y.CustomerName,Y.CustomerAddress
from Orders X,Customer Y
where X.CustomerID=Y.CustomerID
and date_part('year',OrdersDate)=2021

5.4. List of products (ID) ordered in order ID = "O01".

select ProductID
from OrderDetail
where OrderID='R01'

5.5. List of products (*) ordered in order ID = "O01".

select Y.*
from OrderDetail X, Product Y
where X.ProductID=Y.ProductID
and OrderID='R01'

5.6. List of products (*) ordered in order date = d.

select Y.*
from Orders X, Product Y, Orderdetail Z
where X.OrdersID = Z.OrderID
and Y.ProductID = Z.ProductID
and date_part('day',Ordersdate) = 2

5.7. Calculating total of quantities for each order (ID).

select OrderID,sum(Orderquantity)
from OrderDetail
group by OrderID

5.8. Calculating total of quantities for each order (ID), it took in year = 2021.

select OrderID,sum(Orderquantity)
from OrderDetail X, Orders Y
where X.OrderID=Y.OrdersID
and date_part('year',OrdersDate)=2021
group by OrderID

5.9. With orders (ID) have the largest total cost.

select Y.OrderID, sum(X.UnitPrice*OrderQuantity)
from  Product X ,OrderDetail Y
where X.ProductID=Y.ProductID
group by Y.OrderID
having sum(X.UnitPrice*OrderQuantity)>= all(select sum(X.UnitPrice*OrderQuantity)
from  Product X ,OrderDetail Y
where X.ProductID=Y.ProductID
group by Y.OrderID)

5.10. In year = 2021, with orders (ID) have the most total cost.

select Y.OrderID, sum(X.UnitPrice*Y.OrderQuantity)
from  Product X ,OrderDetail Y,Orders Z
where X.ProductID=Y.ProductID
and Y.OrderID=Z.OrdersID
and date_part('year',OrdersDate)=2021
group by Y.OrderID
having sum(X.UnitPrice*Y.OrderQuantity)>= all( select sum(X.UnitPrice*Y.OrderQuantity)
from  Product X ,OrderDetail Y,Orders Z
where X.ProductID=Y.ProductID
and Y.OrderID=Z.OrdersID
and date_part('year',OrdersDate)=2021
group by Y.OrderID)

///////
select*
from OrderDetail
where OrderID not in
(select OrderID
from Orders)

/////

select *
from Orders
where OrdersDate > Requiredate

////

select *
from Orders A, Delivery B
where A.OrdersID=B.OrderID
and OrdersDate > DeliveryDate

///

select date_part('quarter',OrdersDate), sum(Orderquantity*unitprice)
from Product X, Orders Y, OrderDetail Z
where X.ProductID =Z.ProductID
and Y.OrdersID=Z.OrderID
and date_part('year',OrdersDate)=2020
group by  date_part('quarter',OrdersDate)

///

select distinct orderID
from orderdetail X
where not exists
(select *
from product
where categoryid = 'C01'g
and productid not in (select productid
			   		  from orderdetail
			   		  where X.orderid = orderid))











