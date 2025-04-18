create table Country
(
	CountryID char (3) primary key,
	CountryName char (30)
)
drop table Country
insert into Country
values
	('C01', 'Bac'),
	('C02', 'Trung'),
	('C03', 'Nam');
select * from Country
delete from Country

create table Province
(
	ProvinceID char (3) primary key,
	ProvinceName char (30),
	Population int,
	Area real,
	CountryID char (3)
)
drop table Province
insert into Province
values
	('P01','Ha Noi'     	,8146000	,3358.60	,'C01'),
	('P02','Bac Ninh'   	,1447000 	,822.71		,'C01'),
	('P03','Tuyen Quang'	,1056000	,5867.90	,'C01'),
	('P04','Hai Phong'  	,2138000	,1561.76	,'C01'),
	('P05','Ha Giang'   	,9100007	,929.48 	,'C01'),
	('P06','Lao Cai'    	,898000		,6364.03	,'C01'),
	('P07','Cao Bang'   	,576000		,6700.26	,'C01'),
	('P08','Thai Nguyen'	,1356000	,3526.64	,'C01'),
	('P09','Hai Duong'  	,2003000	,1668.24	,'C01'),
	('P10','Vinh Phuc'  	,1102000	,1235.87	,'C01'),
	('P11','Hung Yen'   	,1340000  	,930.22		,'C01'),
	('P12','Ha Nam'  		,883927		,861.9		,'C01'),
	('P13','Thai Binh'  	,1934000 	,1586.35	,'C01'),
	('P14','Nam Dinh'   	,1852000 	,1668.57 	,'C01'),
	('P15','Ninh Binh'  	,1102000  	,1386.79 	,'C01'),
	('P16','Phu Tho'    	,1586000 	,3534.56	,'C01'),
	('P17','Bac Kan'    	,338000 	,4859.96 	,'C01'),
	('P18','Lang Son'   	,828000 	,8310.09	,'C01'),
	('P19','Bac Giang'  	,1884000	,3895.59	,'C01'),
	('P20','Quang Ninh' 	,1387000	,6178.21	,'C01'),
	('P21','Yen Bai'    	,950000		,6887.46	,'C01'),
	('P22','Lai Chau'   	,527000 	,9068.79	,'C01'),
	('P23','Dien Bien'  	,705000 	,9541.25	,'C01'),
	('P24','Son La'     	,1356000  	,14123.49	,'C01'),
	('P25','Hoa Binh'   	,979000 	,4590.57	,'C01'),
	('P26','THANH HOA'		,3689000	,11164.65	,'C02'),
	('P27','NGHE AN'		,3399000	,16481.41	,'C02'),
	('P28','HA TINH'		,1402000	,5990.97	,'C02'),
	('P29','QUANG BINH'		,992000		,8065.3		,'C02'),
	('P30','QUANG TRI'		,687000		,4621.72	,'C02'),
	('P31','THUA THIEN HUE'	,1257000	,4902.44	,'C02'),
	('P32','DA NANG'		,1294000	,1284.88	,'C02'),
	('P33','QUANG NAM'		,1697000	,10574.74	,'C02'),
	('P34','QUANG NGAI'		,1355000	,5155.78	,'C02'),
	('P35','BINH DINH'		,1679000	,6066.21	,'C02'),
	('P36','PHU YEN'		,1056000	,5023.42	,'C02'),
	('P37','KHANH HOA'		,1371000	,5137.79	,'C02'),
	('P38','NINH THUAN'		,720000		,3355.34	,'C02'),
	('P39','BINH THUAN'		,1498000	,7943.93	,'C02'),
	('P40','KON TUM'		,589000		,9674.18	,'C02'),
	('P41','GIA LAI'		,1586000	,15510.99	,'C02'),
	('P42','DAK LAK'		,2016000	,13030.50	,'C02'),
	('P43','DAK NONG'		,670000		,6509.27	,'C02'),
	('P44','LAM DONG'		,1390000	,9783.34	,'C02'),
	('P45','Soc Trang'		,1256000	,3311.88	,'C03'),
	('P46','Tien Giang'		,1898000	,2510.61	,'C03'),
	('P47','Tra Vinh'		,1067000	,2358.26	,'C03'),
	('P48','Vinh Long'		,1100000	,1525.73	,'C03'),
	('P49','Can Tho'		,1456000	,1438.96	,'C03'),
	('P50','Ba Ria-Vung Tau',1303000	,1980.98	,'C03'),
	('P51','Binh Duong'		,2564000	,2694.64	,'C03'),
	('P52','Binh Phuoc'		,1313000	,6876.76	,'C03'),
	('P53','Dong Nai'		,3227000	,5863.6		,'C03'),
	('P54','Tay Ninh'		,1207000	,4041.25	,'C03'),
	('P55','TP.HCM'			,9125000	,2061.41	,'C03'),
	('P56','An Giang'		,2057000	,3536.68	,'C03'),
	('P57','Bac Lieu'		,1105000	,2669.01	,'C03'),
	('P58','Ben Tre'		,1331000	,2394.81	,'C03'),
	('P59','Ca Mau'			,1369000	,5221.19	,'C03'),
	('P60','Dong Thap'		,1838000	,3383.85	,'C03'),
	('P61','Hau Giang'		,853000		,1621.7		,'C03'),
	('P62','Kien Giang'		,1789000	,6348.78	,'C03'),
	('P63','Long An'		,1730000	,4494.94	,'C03');
SELECT * FROM PROVINCE
DELETE FROM PROVINCE

create table Border
(
	ProvinceID char (3),
	NationID char (3), 
	primary key (ProvinceID, NationID)
)
drop table Border
insert into Border
values
	('P23','CHN'),
	('P22','CHN'),
	('P06','CHN'),
	('P05','CHN'),
	('P07','CHN'),
	('P18','CHN'),
	('P20','CHN'),
	('P40','CBC'),
	('P41','CBC'),
	('P42','CBC'),
	('P43','CBC'),
	('P52','CBC'),
	('P54','CBC'),
	('P63','CBC'),
	('P60','CBC'),
	('P56','CBC'),
	('P62','CBC'),
	('P23','LAO'),
	('P24','LAO'),
	('P26','LAO'),
	('P27','LAO'),
	('P28','LAO'),
	('P29','LAO'),
	('P30','LAO'),
	('P31','LAO'),
	('P33','LAO'),
	('P40','LAO');
SELECT * FROM BORDER
create table Neighbor
(
	ProvinceID char (20),
	NeighborID char (20), 
	primary key (provinceid, neighborid)
)
drop table Neighbor
insert into Neighbor
values
--Miền Bắc
	('P01','P08' ), -- HA NOI
	('P01','P10' ),
	('P01', 'P12'),
	('P01', 'P25'),
	('P01','P19' ),
	('P01', 'P02'),
	('P01', 'P16'),
	('P01', 'P11'),

	('P02','P01'), -- BAC NINH
	('P02','P11'),
	('P02','P19'),
	('P02','P09'),

	('P03','P05'), -- TUYEN QUANG
	('P03','P07'),
	('P03','P17'),
	('P03','P08'),
	('P03','P10'),
	('P03','P16'),
	('P03','P21'),

	('P04','P20'), -- HAI PHONG
	('P04','P09'),
	('P04','P13'),

	('P05','P03'), --HA GIANG
	('P05','P07'),
	('P05','P06'),
	('P05','P21'),

	('P06','P22'),
	('P06','P24'), --LAO CAI  
	('P06','P21'),
	('P06','P05'),

	('P07','P05'), -- CAO BANG
	('P07','P03'),
	('P07','P17'),
	('P07','P18'),

	('P08','P01'), --THAI NGUYEN
	('P08','P10'),
	('P08','P19'),
	('P08','P03'),
	('P08','P17'),
	('P08','P18'),

	('P09','P02'), -- HAI DUONG
	('P09','P19'),
	('P09','P20'),
	('P09','P04'),
	('P09','P11'),
	('P09','P13'),

	('P10','P01'), --VINH PHUC
	('P10','P03'),
	('P10','P16'),
	('P10','P08'),

	('P11','P01'), -- HUNG YEN
	('P11','P02'),
	('P11','P09'),
	('P11','P13'),
	('P11','P12'),

	('P12','P15'), --HA NAM
	('P12','P01'),
	('P12','P25'),
	('P12','P14'),
	('P12','P11'),
	('P12','P13'),

	('P13','P11'), -- THAI BINH
	('P13','P12'),
	('P13','P14'),
	('P13','P04'),
	('P13','P09'),

	('P14','P13'), -- NAM DINH
	('P14','P12'),
	('P14','P15'),

	('P15','P26'), --NINH BINH
	('P15','P12'),
	('P15','P14'),
	('P15','P25'),

	('P16','P24'), -- PHU THO
	('P16','P21'),
	('P16','P25'),
	('P16','P10'),
	('P16','P03'),
	('P16','P01'),

	('P17','P03'), -- BAC KAN
	('P17','P07'),
	('P17','P08'),
	('P17','P18'),

	('P18','P07'), -- LANG SON
	('P18','P17'),
	('P18','P08'),
	('P18','P19'),
	('P18','P20'),

	('P19','P01'), --BAC GIANG
	('P19','P02'),
	('P19','P08'),
	('P19','P09'),
	('P19','P20'),
	('P19','P18'),

	('P20','P18'), -- QUANG NINH
	('P20','P19'),
	('P20','P09'),
	('P20','P04'),

	('P21','P06'), --YEN BAI
	('P21','P24'),
	('P21','P16'),
	('P21','P03'),
	('P21','P05'),

	('P22','P06'), --LAI CHAU
	('P22','P24'),
	('P22','P23'),

	('P23','P24'), -- DIEN BIEN
	('P23','P22'),

	('P24','P26'),-- SON LA 
	('P24','P25'),
	('P24','P16'),
	('P24','P21'),
	('P24','P06'),
	('P24','P22'), 
	('P24','P23'),

	('P25','P26'), --HOA BINH
	('P25','P01'),
	('P25','P12'),
	('P25','P15'),
	('P25','P24'),
	('P25','P16'),

--Miền Trung
	('P26','P15'),
	('P26','P25'),
	('P26','P24'),
	('P26','P27'),
	
	('P27','P26'),
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
	
	('P33','P31'),
	('P33','P32'),
	('P33','P34'),
	('P33','P40'),
	
	('P34','P33'),
	('P34','P40'),
	('P34','P41'),
	('P34','P35'),
	
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
	('P39','P53'),
	('P39','P50'),

	('P40','P34'),
	('P40','P33'),
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
	('P43','P52'),
	
	('P44','P52'),
	('P44','P43'),
	('P44','P42'),
	('P44','P37'),
	('P44','P38'),
	('P44','P39'),
	('P44','P53'),
--Miền Nam
	('P45', 'P47'),
	('P45', 'P57'),
	('P45', 'P61'),
	('P46', 'P55'),
	('P46', 'P63'),
	('P46', 'P60'),
	('P46', 'P48'),
	('P46', 'P58'),
	('P47', 'P45'),
	('P47', 'P48'),
	('P47', 'P58'),
	('P48', 'P45'),
	('P48', 'P61'),
	('P48', 'P49'),
	('P48', 'P60'),
	('P48', 'P46'),
	('P48', 'P58'),
	('P48', 'P47'),
	('P49', 'P60'),
	('P49', 'P48'),
	('P49', 'P61'),
	('P49', 'P62'),
	('P49', 'P56'),
	('P50', 'P39'),
	('P50', 'P53'),
	('P50', 'P55'),
	('P51', 'P53'),
	('P51', 'P55'),
	('P51', 'P52'),
	('P51', 'P54'),
	('P52', 'P43'),
	('P52', 'P44'),
	('P52', 'P51'),
	('P52', 'P53'),
	('P52', 'P54'),
	('P53', 'P39'),
	('P53', 'P44'),
	('P53', 'P50'),
	('P53', 'P51'),
	('P53', 'P52'),
	('P53', 'P55'),
	('P54', 'P51'),
	('P54', 'P52'),
	('P54', 'P55'),
	('P54', 'P63'),
	('P55', 'P50'),
	('P55', 'P53'),
	('P55', 'P51'),
	('P55', 'P54'),
	('P55', 'P46'),
	('P55', 'P63'),
	('P56', 'P60'),
	('P56', 'P62'),
	('P56', 'P49'),
	('P57', 'P45'),
	('P57', 'P59'),
	('P57', 'P61'),
	('P57', 'P62'),
	('P58', 'P46'),
	('P58', 'P47'),
	('P58', 'P48'),
	('P59', 'P57'),
	('P59', 'P62'),
	('P60', 'P46'),
	('P60', 'P48'),
	('P60', 'P63'),
	('P60', 'P49'),
	('P60', 'P56'),
	('P61', 'P49'),
	('P61', 'P57'),
	('P61', 'P45'),
	('P61', 'P61'),
	('P61', 'P62'),
	('P62', 'P56'),
	('P62', 'P49'),
	('P62', 'P57'),
	('P62', 'P59'),
	('P62', 'P61'),
	('P63', 'P54'),
	('P63', 'P55'),
	('P63', 'P46'),
	('P63', 'P60');
select * from Neighbor
delete from Neighbor

5.7
Select ProvinceID, (Population)/(Area) as "MDDS"
From Province
Group by ProvinceID
Having (Population)/(Area) >= all (Select (Population)/(Area) as "MDDS"
                                         			From Province
						Group by ProvinceID
						)
						
5.10
select A.provinceid, A.provincename, count (nationid)
from province as A, border as B
where A.provinceid = B. provinceid
group by A.provinceid
having count (nationid)>1