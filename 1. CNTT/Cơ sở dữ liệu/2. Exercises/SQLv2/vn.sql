create table Country
( 
	CountryId char(3) primary key,
	CountryName varchar(30) 
	
)
insert into Country
values
('C01','Mien Bac'),
('C02','Mien Trung'),
('C03','Mien Nam')

select * from Country
delete from Country

drop table Country

create table Province
( 
	ProvinceId char(3) primary key,
	ProvinceName varchar(30),
	Population int,
	Area float,
	Countryid char(3)
	
	
)
insert into Province
values
('P01','Ha Giang',883388,7929.5,'C01'),
('P02','Lao Cai',756083,6364,'C01'),
('P03','Lai Châu',480588,9068.8,'C01'),
('P04','Cao Bang',535098,6700.3,'C01'),
('P05','Tuyen Quang',797392,5867.9,'C01'),
('P06','Bac Kan',318083,4860,'C01'),
('P07','Yen Bai',838181,6887,'C01'),
('P08','Dien Bien',6243295,9541,'C01'),
('P09','Son La',1286068,14123.5,'C01'),
('P10','Lang Son ',791872,8310.2,'C01'),
('P11','Thai Nguyen',1322235,3536.4,'C01'),
('P12','Phu Tho',1495116,3534.6,'C01'),
('P13','Bac Giang',1858540,3851.4,'C01'),
('P14','Quang Ninh',1358490,6177.7,'C01'),
('P15','Bac Ninh',1450518,822.7,'C01'),
('P16','Ha Nam ',867258,860.9,'C01'),
('P17','Ha Noi',8418883,3358.9,'C01'),
('P18','Hai Duong',1932090,1668.2,'C01'),
('P19','Hai Phong',2069110,1561.8,'C01'),
('P20','Hung Yen',1279308,930.2,'C01'),
('P21','Nam Dinh',1771000,1668,'C01'),
('P22','Ninh Binh',1000093,1387,'C01'),
('P23','Thai Binh',1876579,1570.5,'C01'),
('P24','Vinh Phuc',1184074,1235.2,'C01'),
('P25','Thanh Hoa',3690022,11114.7,'C02'),
('P26','Hoa Binh',868623,4591,'C01'),
('P27','Nghe An',3417809,16493.7,'C02'),
('P28','Ha Tinh',1301601,5990.7,'C02'),
('P29','Quang Binh',905895,8065.3,'C02'),
('P30','Quang Tri',639414,4739.8,'C02'),
('P31','Thua Thien Hue',1137045,5048.2,'C02'),
('P32','Da Nang',1191381,1284.9,'C02'),
('P33','Quang Nam',1510960,10574.7,'C02'),
('P34','Quang Ngai',1234704,5135.2,'C02'),
('P35','Binh Dinh',1487009,6066.2,'C02'),
('P36','Phu Yen',875127,5023.4,'C02'),
('P37','Khanh Hoa',1246358,5137.8,'C02'),
('P38','Ninh Thuan',595698,3355.3,'C02'),
('P39','Binh Thuan',1243977,7812.8,'C02'),
('P40','Kom Tum',565865,9674.2,'C02'),
('P41','Gia Lai',1566882,15510.8,'C02'),
('P42','Dac Lac',1897710,13030.5,'C02'),
('P43','Dac Nong',652766,6509.3,'C02'),
('P44','Lam Dong',1319952,9783.2,'C02'),
('P45','Binh Phuoc',1020839,6877,'C03'),
('P46','Binh Duong',2678220,2694.7,'C03'),
('P47','Dong Nai',3236248,5905.7,'C03'),
('P48','Tay Ninh',1190852,4041.4,'C03'),
('P49','Ba Ria Vung Tau',1181302,1980.8,'C03'),
('P50','TP HCM',9411805,2061,'C03'),
('P51','Long An',1744138,4490.2,'C03'),
('P52','Dong Thap',1586438,3383.8,'C03'),
('P53','Tien Giang',1783165,2510.5,'C03'),
('P54','An Giang',1864651,3536.7,'C03'),
('P55','Ben Tre',1295067,2394.6,'C03'),
('P56','Vinh Long',1022408,1235.2,'C03'),
('P57','Tra Vinh',10100404,2358.2,'C03'),
('P58','Hau Giang',728255,1621.8,'C03'),
('P59','Kien Giang',1730117,6348.8,'C03'),
('P60','Soc Trang',1181835,3311.8,'C03'),
('P61','Bac Lieu',917734,2669,'C03'),
('P62','Ca Mau',1191999,5294.8,'C03'),
('P63','Can Tho',1244736,1439.2,'C03')




select * from Province
delete from Province

drop table Province

create table Border
( 
	ProvinceId char(3),
	 NationID char(3),
	primary key(ProvinceId, NationID )
	
)
insert into Border
values
('P01','CHN'),
('P02','CHN'),
('P03','CHN'),
('P04','CHN'),
('P08','CHN'),
('P10','CHN'),
('P14','CHN'),

('P08','LAO'),
('P09','LAO'),
('P25','LAO'),
('P27','LAO'),
('P28','LAO'),
('P29','LAO'),
('P30','LAO'),
('P31','LAO'),
('P33','LAO'),

('P40','CPC'),
('P41','CPC'),
('P42','CPC'),
('P43','CPC'),
('P45','CPC'),
('P48','CPC'),
('P51','CPC'),
('P52','CPC'),
('P54','CPC'),
('P59','CPC')


select * from Border
delete from Border

drop table Border

create table Neighbor
( 
	ProvinceId char(3),
	NeighborID char(3),
	primary key(ProvinceId, NeighborID )
	
)
insert into Neighbor
values
('P01','P04'),
('P01','P02'),
('P01','P05'),
('P01','P07'),

('P02','P01'),
('P02','P07'),
('P02','P03'),

('P03','P02'),
('P03','P07'),
('P03','P08'),
('P03','P09'),

('P04','P01'),
('P04','P06'),
('P04','P10'),

('P05','P01'),
('P05','P06'),
('P05','P07'),
('P05','P12'),
('P05','P24'),
('P05','P11'),

('P06','P04'),
('P06','P10'),
('P06','P11'),
('P06','P05'),

('P07','P05'),
('P07','P01'),
('P07','P02'),
('P07','P03'),
('P07','P09'),
('P07','P12'),
('P07','P13'),

('P08','P03'),
('P08','P09'),

('P09','P08'),
('P09','P03'),
('P09','P07'),
('P09','P12'),
('P09','P26'),
('P09','P25'),

('P10','P04'),
('P10','P06'),
('P10','P11'),
('P10','P13'),
('P10','P14'),

('P11','P05'),
('P11','P06'),
('P11','P10'),
('P11','P13'),
('P11','P17'),
('P11','P24'),

('P12','P07'),
('P12','P05'),
('P12','P24'),
('P12','P09'),
('P12','P26'),
('P12','P17'),

('P13','P10'),
('P13','P11'),
('P13','P14'),
('P13','P07'),
('P13','P17'),
('P13','P18'),
('P13','P15'),

('P14','P10'),
('P14','P13'),
('P14','P18'),
('P14','P19'),

('P15','P13'),
('P15','P18'),
('P15','P17'),
('P15','P20'),

('P16','P17'),
('P16','P20'),
('P16','P23'),
('P16','P21'),
('P16','P22'),
('P16','P26'),

('P17','P11'),
('P17','P12'),
('P17','P13'),
('P17','P16'),
('P17','P24'),
('P17','P15'),
('P17','P20'),
('P17','P26'),

('P18','P13'),
('P18','P24'),
('P18','P15'),
('P18','P20'),
('P18','P23'),
('P18','P19'),
('P18','P14'),

('P19','P14'),
('P19','P18'),
('P19','P23'),

('P20','P15'),
('P20','P18'),
('P20','P23'),
('P20','P17'),
('P20','P16'),

('P21','P23'),
('P21','P22'),
('P21','P16'),

('P22','P21'),
('P22','P16'),
('P22','P26'),
('P22','P25'),

('P23','P19'),
('P23','P18'),
('P23','P21'),
('P23','P20'),
('P23','P16'),

('P24','P11'),
('P24','P05'),
('P24','P12'),
('P24','P17'),
('P24','P18'),

('P25','P22'),
('P25','P26'),
('P25','P27'),
('P25','P09'),

('P26','P12'),
('P26','P09'),
('P26','P25'),
('P26','P22'),
('P26','P17'),
('P26','P16'),

('P27','P25'),
('P27','P28'),

('P28','P27'),
('P28','P29'),

('P29','P28'),
('P29','P30'),

('P30','P29'),
('P30','P31'),

('P31','P30'),
('P31','P32'),
('P31','P33'),

('P32','P31'),
('P32','P33'),

('P33','P32'),
('P33','P31'),
('P33','P34'),
('P33','P40'),

('P34','P33'),
('P34','P40'),
('P34','P35'),
('P34','P41'),

('P35','P34'),
('P35','P41'),
('P35','P36'),

('P36','P35'),
('P36','P41'),
('P36','P42'),
('P36','P37'),

('P37','P36'),
('P37','P42'),
('P37','P44'),
('P37','P38'),

('P38','P37'),
('P38','P44'),
('P38','P39'),

('P39','P38'),
('P39','P44'),
('P39','P47'),
('P39','P49'),

('P40','P33'),
('P40','P34'),
('P40','P41'),

('P41','P40'),
('P41','P34'),
('P41','P35'),
('P41','P36'),
('P41','P42'),

('P42','P41'),
('P42','P36'),
('P42','P37'),
('P42','P44'),
('P42','P43'),

('P43','P42'),
('P43','P44'),
('P43','P45'),

('P44','P42'),
('P44','P37'),
('P44','P38'),
('P44','P39'),
('P44','P47'),
('P44','P45'),
('P44','P43'),

('P45','P43'),
('P45','P44'),
('P45','P47'),
('P45','P46'),
('P45','P48'),

('P46','P45'),
('P46','P47'),
('P46','P50'),
('P46','P48'),

('P47','P45'),
('P47','P44'),
('P47','P39'),
('P47','P49'),
('P47','P50'),
('P47','P46'),

('P48','P45'),
('P48','P46'),
('P48','P50'),
('P48','P51'),

('P49','P47'),
('P49','P50'),
('P49','P39'),

('P50','P46'),
('P50','P48'),
('P50','P49'),
('P50','P47'),
('P50','P51'),
('P50','P53'),

('P51','P50'),
('P51','P48'),
('P51','P52'),
('P51','P53'),

('P52','P56'),
('P52','P63'),
('P52','P54'),
('P52','P51'),
('P52','P53'),

('P53','P51'),
('P53','P55'),
('P53','P56'),
('P53','P50'),
('P53','P52'),

('P54','P52'),
('P54','P59'),
('P54','P63'),
('P54','P54'),

('P55','P56'),
('P55','P57'),
('P55','P53'),

('P56','P52'),
('P56','P53'),
('P56','P58'),
('P56','P60'),
('P56','P63'),
('P56','P57'),
('P56','P55'),

('P57','P56'),
('P57','P55'),
('P57','P60'),

('P58','P63'),
('P58','P61'),
('P58','P56'),
('P58','P59'),
('P58','P60'),

('P59','P62'),
('P59','P61'),
('P59','P54'),
('P59','P63'),
('P59','P58'),

('P60','P58'),
('P60','P56'),
('P60','P61'),
('P60','P57'),

('P61','P58'),
('P61','P59'),
('P61','P60'),
('P61','P62'),

('P62','P59'),
('P62','P61'),

('P63','P54'),
('P63','P52'),
('P63','P58'),
('P63','P59'),
('P63','P56')

select * from Neighbor
delete from Neighbor

drop table Neighbor


select *
from neighbor 
where provinceid not in (select provinceid
						from province)
or neighborid not in (select provinceid from province)

select *
from neighbor A
where not exists
(select *
from neighbor
where A.provinceid = neighborid
and A.neighborid = provinceid)

5.1. Provinces with an area larger than 15000 square kilometers.

select provincename
from province
where area > 15000

5.2. Provinces(*) it neighbored with province have area larger than 15000 square kilometers.
select distinct *
from province X, neighbor Y
where X.provinceid = Y.provinceid
and neighborID in 
(select provinceid
from province
where area > 15000)
order by X.provinceid

5.3. Provinces (*) in the country name = "North"
select X.*
from province X, country Y
where X.countryid = Y.countryid
and X.countryid = 'C01'

5.4. Which Nation bordering the northern provinces.
select distinct nationid
from border X, province Y
where X.provinceid = Y.provinceid
and countryid = 'C01'

5.5. Average area of the southern provinces.
select avg(area) as Southern_Average
from province 
where countryid = 'C03'

5.6. Population density of the central country
select avg(population/area) as Southern_Average, provinceid, provincename
from province 
where countryid = 'C02'
group by provinceid
order by provinceid

5.7. Provinces with the largest population density.
select avg(population/area) as Southern_Average, provinceid, provincename
from province 
where countryid = 'C02'
group by provinceid
having avg(population/area) >= all
(select avg(population/area)
from province 
where countryid = 'C02'
group by provinceid)

5.8. Provinces with the largest area.
select provinceid, provincename
from province
group by provinceid
having area >= all
(select area
from province
group by provinceid)

5.9. In southern country, provinces with the largest area.
select provinceid, provincename
from province
where countryid = 'C03'
group by provinceid
having area >= all
(select area
from province
where countryid = 'C03'
group by provinceid)

5.10. Provinces that have borders with two or more nations.
select X.provinceid, provincename
from province X, border Y
where X.provinceid = Y.provinceid
group by X.provinceid
having count(nationid) > 1
order by provinceid

5.11. List of Countries with the number of its provinces
select countryid, count(provinceid)
from province
group by countryid

5.12. Provinces with the largest total neighbor
select X.*, count(neighborid)
from province X, neighbor Y
where X.provinceid = Y.provinceid
group by X.provinceid
having count(neighborid) >= all
(select count(neighborid)
from province X, neighbor Y
where X.provinceid = Y.provinceid
group by X.provinceid)

5.13. Provinces that are area larger than area of their neighboring provinces.
select A.provinceid, provincename, area
from province A
where area >= all
(select area
from province X, neighbor Y
where X.provinceid = Y.provinceid
and neighborid = A.provinceid
group by area)

5.14. For each country, list the provinces with largest area.
select provinceid, provincename, X.countryid
from province X
where area >= all (select area
				  from province 
				  where countryid = X.countryid
				  group by countryid,area)
group by provinceid, provincename, X.countryid

5.15. For each country, list the provinces with population larger than the average population of that
country
select provinceid, provincename, X.countryid
from province X
where population > (select avg(population) 
					from province
					where countryid = X.countryid)
group by provinceid, provincename, X.countryid

5.16. Countries with the largest total area.
select countryid, sum(area) as area
from province
group by countryid
having sum(area) >= all (select sum(area)
					 	from province
					 	group by countryid)
						
5.17. Countries with the largest total population
select countryid, sum(population) as population
from province
group by countryid
having sum(population) >= all (select sum(population)
					 			from province
					 			group by countryid)



// cac tinh mien trung(ma tinh,ten tinh) langs gieng voi cac tinh mien bac

select Distinct X.*
from Province X,Neighbor Y
where X.ProvinceId=Y.ProvinceId
and CountryID='C02'
and NeighborID in 
(select provinceid
from province
where CountryID='C01')


select CountryID, count(*)
from Province
group by CountryID
order by CountryID

// tinh thanh nao co mat doo dan cu lon nhat

select ProvinceId,ProvinceName,sum(Polutation/Area)
from Province
group by ProvinceId
having sum(Polulation/Area)>=all(select sum(Polulation/Area)
from Province
group by ProvinceId )

// tinh thanh nao(*) dan so > tong dan cac tinh thanh lang gieng cua nos

select *
from Province X
where Area>
(select avg(Area)
from Neighbor Y, Province Z
where Y.Neighborid=Z.provinceid
and X.provinceID=Y.provinceid)  
// dien tich cua cac mien
select provinceid,provincename,sum(Area)
from province
where countryid='C01'
group by provinceid
having sum(Area)>=all(select sum(Area)
from province
where countryid='C01'
group by provinceid)

select provinceid,provincename,sum(Area)
from province
where countryid='C02'
group by provinceid
having sum(Area)>=all(select sum(Area)
from province
where countryid='C02'
group by provinceid)

select provinceid,provincename,sum(Area)
from province
where countryid='C03'
group by provinceid
having sum(Area)>=all(select sum(Area)
from province
where countryid='C03'
group by provinceid)

// ung voi cac mien in ra cac tinh co dien tich lon nhat

select countryid,provinceid,provincename,area
from province A
where area>=all(select Area
			   from province
			   where A.countryid=countryid)
// trong cac tinh giap giap voi nc ngoai tinh nao co dyich lon nhat

select X.*
from province X,border Y
where X.provinceid=Y.provinceid
and area>=all(select area
			 from province X,border Y
			 where X.provinceid=Y.provinceid )
// tinh nao cua MN co mat doo dan co> mat doo dan cu tb cac tinh MB
select X.*
from province X
where X.countryid='C03'
and (polulation/area)>=all(select avg(polulation/area)
							 from country Y,province Z
							 where Y.countryid=Z.countryid
							 and Y.countryid='C01'
							 )