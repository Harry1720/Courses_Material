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
ProductName varchar(30), 
UnitPrice int,
CategoryId char(3)
)
insert into Product
values
('P01','Điện thoại ',12000000,'C01'),
('P02','Ti vi',15000000,'C01'),
('P03','laptop',20000000,'C01'),
('P04','Macbook',40000000,'C01'),
('P05','IPad',13000000,'C01'),
('P06','Tai nghe',12000000,'C01'),
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
('P25','Bánh bao nhân thịt',40000,'C05'),
('P26','Lẩu Thái',300000,'C05'),
('P27','Cá viên ',40000,'C05'),
('P28','Gạo',150000,'C05'),
('P29','Bột mì',30000,'C05'),
('P30','Nấm ',40000,'C05')

select * from Product
delete from Product

drop table Product
create table  Invoice 
( 
InvoiceID char(3) primary key, 
	InvoiceDate  date, 
	Description varchar(100)
)
insert into  Invoice 
values
('I01','2023-02-02','Hóa đơn không bao gồm thuế'),
('I02','2023-02-01','Hóa đơn không bao gồm thuế'),
('I03','2023-03-02','Hóa đơn không bao gồm thuế'),
('I04','2023-05-01','Hóa đơn không bao gồm thuế'),
('I05','2023-04-16','Hóa đơn không bao gồm thuế'),
('I06','2013-04-15','Hóa đơn không bao gồm thuế'),
('I07','2013-05-01','Hóa đơn không bao gồm thuế'),
('I08','2023-05-23','Hóa đơn không bao gồm thuế'),
('I09','2023-04-01','Hóa đơn không bao gồm thuế'),
('I10','2023-04-01','Hóa đơn không bao gồm thuế')

select * from  Invoice
delete from  Invoice 

drop table  Invoice 

create table  InvoiceDetail
( 
	InvoiceID char(3), 
	ProductID char(3), 
	Quantity int,
	primary key(InvoiceID, ProductID)
)
insert into InvoiceDetail
values
('I01','P01',2),
('I01','P02',1),
('I01','P03',1),
('I01','P04',2),
('I01','P05',3),
('I01','P06',4),
('I02','P01',3),
('I02','P02',2),
('I02','P03',1),
('I02','P04',1),
('I02','P05',2),
('I02','P06',3),
('I03','P07',2),
('I03','P08',1),
('I03','P09',1),
('I04','P13',2),
('I04','P15',3),
('I05','P19',6),
('I05','P20',5),
('I05','P21',3),
('I06','P25',3),
('I06','P26',3),
('I06','P28',1),
('I06','P29',5),
('I06','P30',5)

select * from InvoiceDetail
delete from InvoiceDetail

drop table  InvoiceDetail
	 
	 
	select distinct invoiceid
	from invoicedetail X, product Y
	where categoryid ='C01'and X.productid = Y.productid
	     and not exists (select *
						from category= 'C01'
						 and productid not in
						     (select productid from invoicedetail 
							 where X.invoiceid =invoiceid))
	 
5.1. Find products of the category ID = "CO1".

select X.categoryid, productname
from category X, product Y
where X.categoryid = Y.categoryid
and X.categoryid = 'C01'

5.2. Find products (ID, name and price) of the category ID = "CO2

select X.categoryid, productname, unitprice
from category X, product Y
where X.categoryid = Y.categoryid
and X.categoryid = 'C02'

5.3. Find products (*) with unit price from 10 to 50.

select *
from product 
where unitprice>100000
and unitprice<500000

5.4. Show invoices, it created at date = d.

select *
from invoice
where invoicedate='2023-05-01'

5.5. Show invoices, it created on year = 2021.

select *
from invoice
where date_part('year',invoicedate) = '2023'


5.6. Find products (ID, name, unit price and quantity), it belong to the invoice at date = d.

select X.productid,X.productname,X.unitprice,Z.quantity
from product X,invoice Y,invoicedetail Z
where X.productid=Z.productid 
and Y.invoiceid=Z.invoiceid
and Y.invoicedate='2023-05-01'

5.7. Total quantity of each invoice.

select X.invoiceid, sum(quantity)
from invoice X, invoicedetail Y
where X.invoiceid = Y.invoiceid
group by X.invoiceid

5.8. Total quantity of each invoice in date = d.

select X.invoiceid, sum(quantity)
from invoice X, invoicedetail Y
where X.invoiceid = Y.invoiceid
and X.invoicedate='2023-05-01'
group by X.invoiceid


5.9. Total cost (= quantity times to unit price) of each invoice.

select Y.invoiceid, sum(quantity*unitprice)
from product X, invoicedetail Y
where X.productid = Y.productid
group by Y.invoiceid


5.10. With invoices have the largest total quantity.


select invoiceid ,sum(quantity)
from invoicedetail
group by invoiceid
having sum(quantity)>= all(select sum(quantity)
from invoicedetail
group by invoiceid)


5.11. In date = d, with invoices have the largest total quantity.


select X.invoiceid ,sum(quantity)
from invoice X,invoicedetail Y
where X.invoiceid=Y.invoiceid
and X.invoicedate='2023-05-01'
group by X.invoiceid
having sum(quantity)>= all( select sum(quantity)
from invoice X,invoicedetail Y
where X.invoiceid=Y.invoiceid
and X.invoicedate='2023-05-01'
group by X.invoiceid)

5.12. With invoices have the largest total cost


select Y.invoiceid,

from product X, invoicedetail Y,sum(quantity*unitprice)
where X.productid = Y.productid
group by Y.invoiceid
having sum(quantity*unitprice)>= all(select sum(quantity*unitprice)
from product X, invoicedetail Y
where X.productid = Y.productid
group by Y.invoiceid)

5.13. In date = d, with invoices have the largest total cost.


select Y.invoiceid, sum(quantity*unitprice)
from product X,invoice Y, invoicedetail Z
where X.productid = Z.productid
and Y.invoiceid =Z.invoiceid
and Y.invoicedate='2023-05-01'
group by Y.invoiceid
having sum(quantity*unitprice)>= all(select sum(quantity*unitprice)
from product X, invoice Y, invoicedetail Z
where X.productid = Z.productid
and Y.invoiceid =Z.invoiceid
and Y.invoicedate='2023-05-01'
group by Y.invoiceid)

5.14. Find years have the largest total cost.

select Y.invoiceid, sum(quantity*unitprice)
from product X,invoice Y, invoicedetail Z
where X.productid = Z.productid
and Y.invoiceid =Z.invoiceid
and date_part('year',invoicedate) = '2023'
group by Y.invoiceid
having sum(quantity*unitprice)>= all(select sum(quantity*unitprice)
from product X,invoice Y, invoicedetail Z
where X.productid = Z.productid
and Y.invoiceid =Z.invoiceid
and date_part('year',invoicedate) = '2023'
group by Y.invoiceid)


5.9.2

select Y.invoiceid, sum(unitprice*quantity) 
from product X, invoice Y, invoicedetail Z
where X.productid=Z.productid
and Z.invoiceid=Z.invoiceid
and date_part('month',invoicedate) >= '01'
and date_part('month',invoicedate) <= '03'
and date_part('year',invoicedate) = '2023'
group by Y.invoiceid
having sum(unitprice*quantity)>= all(select sum(unitprice*quantity) 
from product X, invoice Y, invoicedetail Z
where X.productid=Z.productid
and Z.invoiceid=Z.invoiceid
and date_part('month',invoicedate) >= '01'
and date_part('month',invoicedate) <= '03'
and date_part('year',invoicedate) = '2023'
group by Y.invoiceid)

5.9.3


select date_part('month',invoicedate), sum(quantity*unitprice)
from product X, invoice Y, invoicedetail Z
where X.productid = Z.productid
and Y.invoiceid = Z.invoiceid
and date_part('year',invoicedate) = '2023'
group by date_part('month',invoicedate)
 
15 quy nao trong nam 2023 co tong gia tri cac hoa don lon nhat

select date_part('quarter',invoicedate), sum(quantity*unitprice)
from product X, invoice Y, invoicedetail Z
where X.productid = Z.productid
and Y.invoiceid= Z.invoiceid
and date_part('year',invoicedate) = '2023'
group by Y.invoiceid, date_part('quarter',invoicedate)
having sum(quantity*unitprice)>= all(select sum(quantity*unitprice)
from product X, invoice Y, invoicedetail Z
where X.productid = Z.productid
and Y.invoiceid= Z.invoiceid
and date_part('year',invoicedate) = '2023'
group by Y.invoiceid, date_part('quarter',invoicedate))




alter table category
alter column CategoryName
set not null

alter table Product
alter column ProductName
set not null

alter table Product
alter column UnitPrice
set not null

alter table Invoice
alter column InvoiceDate
set not null

alter table InvoiceDetail
alter column Quantity
set not null


 alter table Category
 add unique(CategoryName)
 alter table Product
 add unique(ProductName)
 alter table product
 add constraint KTUnitPrice
 check(unitPrice>0)
  alter table InvoiceDetail
 add constraint KTquantity
 check(quantity>0)

5.2. Provinces(*) it neighbored with province have area larger than 15000 square kilometers.
// cac tinh mien trung(ma tinh,ten tinh) langs gieng voi cac tinh mien bac

select Distinct X.*
from Province X,Neighbor Y
where X.ProvinceId=Y.ProvinceId
and CountryID='C02'
and NeighborID in 
(select provinceid
from province
where CountryID='C01')







	 
	 
	 