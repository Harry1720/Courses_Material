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
create table Product
( 
ProductID char(3) primary key, 
ProductName char(30), 
UnitPrice real,
CategoryId char(3)
)
insert into Product
values
('P01','Điện thoại ',120000,'C01'),
('P02','Ti vi',120000,'C01'),
('P03','laptop',120000,'C01'),
('P04','Macbook',40000,'C01'),
('P05','IPad',13000,'C01'),
('P06','Tai nghe',120000,'C01'),
('P07','Son',120000,'C02'),
('P08','Kem nền',300000,'C02'),
('P09','Phấn mắt',160000,'C02'),
('P10','Kem che khuyết điểm',200000,'C02'),
('P11','Nước tẩy trang',240000,'C02'),
('P12','Son Dưỡng',100000,'C02'),
('P13','Bột Giặt',120000,'C03'),
('P14','Nước rửa chén',120000,'C03'),
('P15','Nước tẩy',120000,'C03'),
('P16','Nước rửa tay',120000,'C03'),
('P17','Dầu gội ',120000,'C03'),
('P18','Dầu xả',120000,'C03'),
('P19','Quần ống rộng',120000,'C04'),
('P20','Quần jean',120000,'C04'),
('P21',' Áo phông',120000,'C04'),
('P22','Áo polo',120000,'C04'),
('P23','Áo sơ mi ',120000,'C04'),
('P24','Áo khoác ',120000,'C04'),
('P25','Bánh bao nhân thịt',120000,'C05'),
('P26','Lẩu Thái',120000,'C05'),
('P27','Cá viên ',120000,'C05'),
('P28','Gạo',120000,'C05'),
('P29','Bột mì',30000,'C05'),
('P30','Nấm ',40000,'C05')

select * from Product
delete from Product

drop table Product

create table  Warehouse
( 
	WarehouseID char(3) primary key, 
	WarehouseAddress varchar(10),
	CategoryID char(3)
)
insert into  Warehouse
values
('W01','301/5','C01'),
('W02','302/5','C01'),
('W03','307/7','C02'),
('W04','301/5','C03'),
('W05','304/5','C04'),
('W06','301/6','C05'),
('W07','302/5','C05')

select * from  Warehouse
delete from  Warehouse

drop table  Warehouse

create table  Instock
( 
	WarehouseID char(3), 
	ProductID char(3), 
	Quantity int,
	primary key(WarehouseID, ProductID)
)
insert into Instock
values
('W01','P01',2),
('W01','P02',1),
('W01','P03',1),
('W02','P04',2),
('W02','P05',3),
('W02','P06',4),
('W03','P07',3),
('W03','P08',2),
('W03','P09',1),
('W03','P10',1),
('W03','P11',2),
('W03','P12',3),
('W04','P13',2),
('W04','P14',1),
('W04','P15',1),
('W04','P16',2),
('W04','P17',3),
('W04','P18',6),
('W05','P19',5),
('W05','P20',3),
('W05','P21',6),
('W05','P22',5),
('W05','P23',3),
('W06','P24',8),
('W06','P25',2),
('W06','P26',2),
('W07','P27',2),
('W06','P28',5),
('W07','P29',6),
('W07','P30',6),
('W01','P04',5),
('W01','P05',2),
('W06','P27',2),
('W02','P01',2),
('W02','P02',8)


select * from Instock
delete from Instock

drop table  Instock

5.1. All the products of category ID = "C02".

select *
from Category
where CategoryID='C02'

5.2. All the warehouses (*) that store category ID = "C01".

select *
from Category
where CategoryID='C01'

5.3. All the warehouses (*) in now store product name = "beverage"

select *
from Product
where productname='Điện thoại'

5.4. All the products, it can be store in warehouse ID = "W01".

select X.ProductID,X.Productname
from Product X, Warehouse Y
where X.CategoryID=Y.CategoryID
and WarehouseID='W01'

5.5. Calculating sum of quantity for each warehouses.

select X.WarehouseID,sum(quantity)
from Warehouse X, Instock Y
where X.WarehouseID=Y.WarehouseID
group by X.WarehouseID


5.6. Find warehouse have the largest total quantities

select X.WarehouseID,sum(quantity)
from Warehouse X, Instock Y
where X.WarehouseID=Y.WarehouseID
group by X.WarehouseID
having sum(quantity)>=all(select sum(quantity)
from Warehouse X, Instock Y
where X.WarehouseID=Y.WarehouseID
group by X.WarehouseID )

5.7. Calculating count of product for each warehouse.

select X.productID,sum(quantity*unitprice)
from Product X,Instock Y
where X.ProductID=Y.ProductID
group by X.ProductID
having sum(quantity*unitprice)>=all(select sum(quantity*unitprice)
from Product X,Instock Y
where X.ProductID=Y.ProductID
group by X.ProductID )


a: 
select warehouseid,count(*)
from Instock
group by warehouseid
order by warehouseid

b:
select warehouseID,Sum(unitprice*quantity)
from Instock A,Product B
where A.ProductID=B.ProductID
group by WarehouseID
having sum(unitprice*quantity)>=all(select Sum(unitprice*quantity)
from Instock A,Product B
where A.ProductID=B.ProductID
group by WarehouseID)


c:
select *
from Instock A
where productID Not in
 (select productID
 from warehouse B, product C
 where B.categoryid=C.categoryid
 and A.warehouseid=B.warehouseid)

d:
select Distinct warehouseID
From Instock A
where not exists
(select *
from product B, warehouse C
 where B.categoryID= C.categoryid
and A .WarehouseID= C.warehouseID
and productid not in
(select productid 
from instock
where A.Warehouseid=warehouseid))

5.8. Find warehouses have the largest number of product.

select warehouseid, count(productid)
from instock
group by warehouseid
having count(productid)>= all(select count(productid)
from instock
group by warehouseid)

5.9. Calculating sum of quantity for each product.

select productname, sum(quantity) as quantity
from instock X, product Y
where X.productid = Y.productid
group by Y.productid, productname

5.10. Show products have the largest total of quantities.

select productname, sum(quantity) as quantity
from instock X, product Y
where X.productid = Y.productid
group by Y.productid, productname
having sum(quantity) >= all(select sum(quantity)
							from instock X, product Y
							where X.productid = Y.productid)
							
							
							
select distinct WarehouseID
from Instock X
where not exists
(select *
  from product A, Warehouse B
  where A.categoryID = B.categoryID
  and B.warehouseID=X.warehouseID
   and productID not in (select productid
						        from Instock
						         where X.warehouseid=warehouseid))




alter table Category
 add unique(CategoryName)
 alter table Product
 add unique(ProductName)
 
 alter table category
alter column CategoryName
set not null

alter table Product
alter column ProductName
set not null

alter table Product
alter column UnitPrice
set not null

alter table Warehouse
alter column WarehouseAddress
set not null

alter table Instock
alter column Quantity
set not null
 
  alter table product
 add constraint KTUnitPriceW
 check(unitPrice>0)
 
   alter table instock
 add constraint KTquantityW
 check(quantity>0)
