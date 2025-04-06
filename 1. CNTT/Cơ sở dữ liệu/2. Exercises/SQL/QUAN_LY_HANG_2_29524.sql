CREATE TABLE HANG (
    ID_Hang CHAR(3) PRIMARY KEY,
    Ten_Hang CHAR(30),
    SL_Ton INT NOT NULL
);
DROP TABLE HANG

INSERT INTO HANG (ID_Hang, Ten_Hang, SL_Ton)  
VALUES
    ('H01', 'Lifebuoy', 0),
    ('H02', 'SafeGuard', 0),
    ('H03', 'NoBrand', 0),
    ('H04', 'SGC', 0),
    ('H05', 'Only1', 0);
SELECT * FROM HANG

CREATE TABLE NHAP(
    ID_Nhap CHAR(3) PRIMARY KEY NOT NULL,
    Ngay_Nhap DATE NOT NULL
);
DROP TABLE NHAP

INSERT INTO NHAP (ID_Nhap, Ngay_Nhap)  
VALUES
    ('N01', '2024-05-01'),
    ('N02', '2024-05-03'),
    ('N03', '2024-05-05'),
    ('N04', '2024-05-07'),
    ('N05', '2024-05-09'),
    ('N06', '2024-05-11'),
    ('N07', '2024-05-13'),
    ('N08', '2024-05-15'),
    ('N09', '2024-05-17'),
    ('N10', '2024-05-19');
SELECT * FROM NHAP

CREATE TABLE CT_Nhap (
    ID_Nhap CHAR(3) NOT NULL,
    ID_Hang CHAR(3) NOT NULL,
    SL_Nhap INT NOT NULL,
    PRIMARY KEY(ID_Nhap, ID_Hang)
);
DROP TABLE CT_Nhap

INSERT INTO CT_Nhap (ID_Nhap, ID_Hang, SL_Nhap)  
VALUES
    ('N01', 'H01', 20),
    ('N01', 'H03', 30),
    ('N02', 'H02', 50),
    ('N03', 'H01', 10),
    ('N03', 'H04', 40),
    ('N04', 'H05', 25),
    ('N05', 'H02', 35),
    ('N05', 'H03', 15),
    ('N06', 'H01', 25),
    ('N06', 'H02', 30),
    ('N07', 'H03', 20),
    ('N08', 'H04', 15),
    ('N09', 'H05', 10),
    ('N10', 'H01', 35);
SELECT * FROM CT_Nhap

CREATE TABLE XUAT (
    ID_Xuat CHAR(3) PRIMARY KEY NOT NULL,
    Ngay_Xuat DATE NOT NULL
);
DROP TABLE XUAT

INSERT INTO XUAT (ID_Xuat, Ngay_Xuat)  
VALUES
    ('X01', '2024-05-01'),
    ('X02', '2024-05-02'),
    ('X03', '2024-05-03'),
    ('X04', '2024-05-04'),
    ('X05', '2024-05-05'),
    ('X06', '2024-05-06'),
    ('X07', '2024-05-07'),
    ('X08', '2024-05-08'),
    ('X09', '2024-05-09'),
    ('X10', '2024-05-10'),
    ('X11', '2024-05-11'),
    ('X12', '2024-05-12'),
    ('X13', '2024-05-13');
SELECT * FROM XUAT

CREATE TABLE CT_Xuat (
    ID_Xuat CHAR(3) NOT NULL,
    ID_Hang CHAR(3) NOT NULL,
    SL_Xuat INT NOT NULL,
    PRIMARY KEY(ID_Xuat, ID_Hang)
);
DROP TABLE CT_Xuat


INSERT INTO CT_Xuat (ID_Xuat, ID_Hang, SL_Xuat)  
VALUES
    ('X01', 'H01', 15),
    ('X01', 'H02', 25),
    ('X02', 'H03', 10),
    ('X03', 'H04', 20),
    ('X03', 'H05', 30),
    ('X04', 'H01', 10),
    ('X05', 'H02', 20),
    ('X05', 'H03', 15),
    ('X06', 'H01', 5),
    ('X06', 'H02', 10),
    ('X07', 'H03', 25),
    ('X08', 'H04', 30),
    ('X09', 'H05', 20),
    ('X10', 'H01', 20),
    ('X11', 'H02', 25),
    ('X12', 'H03', 15),
    ('X13', 'H04', 10);
SELECT * FROM CT_Xuat

CREATE TABLE NGAY(
	ngay date PRIMARY KEY
);
DROP TABLE NGAY

INSERT INTO NGAY
	SELECT Ngay_Nhap
	FROM NHAP
	
	UNION
	
	SELECT Ngay_Xuat
	FROM XUAT;
SELECT * FROM NGAY

CREATE TABLE BAOCAONX(
	ngay date,
	id_hang char(3),
	SL_Nhap int default 0,
	SL_Xuat int default 0	
);
DROP TABLE BAOCAONX

INSERT INTO BAOCAONX(ngay, id_hang)
	SELECT ngay, id_hang
	FROM NGAY, HANG
	GROUP BY ngay, id_hang
	ORDER BY ngay, id_hang
SELECT * FROM BAOCAONX

update BAOCAONX K
set SL_Nhap = (select sum (SL_Nhap)
			  from NHAP A, CT_Nhap B
			  where A.ID_Nhap = B.ID_Nhap
			  group by Ngay_Nhap, ID_Hang
			  having K.ngay = Ngay_Nhap and K.ID_Hang = B.ID_Hang),
	SL_Xuat = (select sum (SL_Xuat)
			  from XUAT A, CT_Xuat B
			  where A.ID_Xuat = B.ID_XUAT
			  group by Ngay_Xuat, ID_Hang
			  having K.ngay = Ngay_Xuat and K.ID_Hang = B.ID_Hang)

UPDATE HANG H
SET SL_Ton = SL_Ton + (
	SELECT SUM(SL_Nhap) 
	FROM CT_Nhap CTN
	JOIN NHAP NK 
	ON CTN.ID_Nhap = NK.ID_Nhap
	WHERE H.ID_Hang = CTN.ID_Hang
) - (
	SELECT SUM(SL_Xuat) 
	FROM CT_Xuat CTX
	JOIN XUAT XK
	ON CTX.ID_Xuat = XK.ID_Xuat
	WHERE H.ID_Hang = CTX.ID_Hang
);

SELECT * FROM HANG
select id_hang, sum(SL_Nhap)
from CT_Nhap
group by id_hang;

select id_hang, sum(SL_Xuat)
from CT_Xuat
group by id_hang;

do $$
declare 
	d DATE := '2024-05-02';
begin
	RETURN QUERY
	select id_hang, sum (SL_Nhap) as Vet_Nhap, sum (SL_Xuat) as Vet_Xuat
	from BAOCAONX
	where ngay <= d
	group by id_hang
	order by id_hang;
	
end $$;

create table xuatnhapNgay(
	id_hang char(3),
	Vet_Nhap int,
	Vet_Xuat int
);
insert into xuatnhapNgay
select id_hang, sum (SL_Nhap) as Vet_Nhap, sum (SL_Xuat) as Vet_Xuat
	from BAOCAONX
	where ngay <= '2024-05-02'
	group by id_hang
	order by id_hang;

select * from xuatnhapNgay

COPY xuatnhapNgay TO 'C:\Desktop\xuatnhapngay_db.csv' DELIMITER ',' CSV HEADER;