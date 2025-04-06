create table Country
(
	CountryID char(3) primary key,
	CountryName char (30)
)
drop table Country

insert into Country -- * mean all, take everything
values
	('+84', 'Vietnam');	
select * from Country
delete from Country

create table Province
(
	ProvinceID char(3)primary key, --number on map 
	ProvinceName char (30),
	Population int,
	Area char (30),
	CountryID char(3)
)
insert into Province -- * mean all, take everything
values
	('1','Ha Noi',8146000 , 'North', '+84'),
	('2','Tp HCM', 9125000 , 'South', '+84'),
	('29','Thanh Hoa',3689000, 'Central', '+84'),
	('19','Bac Ninh',1447000 , 'North', '+84'),
	('13','Tuyen Quang',1056000, 'North', '+84'),
	('3','Hai Phong',2138000, 'North', '+84'),
	('4','Da Nang',1294000, 'Central', '+84'),
	('5','Can Tho',1456000, 'South', '+84'),
	('9','Ha Giang',910000, 'North', '+84'),
	('10','Cao Bang',576000, 'North', '+84'),
	('30','Nghe An',3399000, 'Central', '+84'),
	('34','Hue',1257000, 'Central', '+84'),
	('41','Dak Lak',2016000, 'Central', '+84')
	('15','Thai Nguyen',1356000, 'North', '+84')
	('24','Hai Duong',2003000, 'North', '+84')
	('28','Ninh Binh',1102000, 'North', '+84')
	('38','Gia Lai',1586000 , 'Central', '+84')
	('43','Khanh Hoa', 1371000  , 'Central', '+84');	
select * from Province
delete from Province;

create table Border
(
	ProvinceID char(3),
	NationID char (3) primary key
)

create table Neighbor 
(
	ProvinceID char(3),
	NeighborID char (3)primary key
)