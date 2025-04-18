--------------------------CREATE DATABASE QUANLYMATHANG--------------------------

CREATE DATABASE QUANLYDONHANG_B4_MSSV
GO
USE QUANLYDONHANG_B4_MSSV

-- Tạo bảng Nhà cung cấp
CREATE TABLE nhacungcap 
( 
	manhacungcap VARCHAR(10) NOT NULL, 
	tennhacungcap NVARCHAR(40) NOT NULL, 
	tengiaodich NVARCHAR(30) NULL, 
	diachi NVARCHAR(60) NULL, 
	dienthoai NVARCHAR(20) NULL, 
	fax NVARCHAR(20) NULL, 
	email NVARCHAR(50) NULL 
) 

-- Tạo bảng Loại hàng 
CREATE TABLE loaihang 
( 
	maloaihang INT NOT NULL, 
	tenloaihang NVARCHAR(15) NOT NULL 
) 

-- Tạo bảng Mặt hàng
CREATE TABLE mathang 
( 
	mahang VARCHAR(10) NOT NULL, 
	tenhang NVARCHAR(50) NOT NULL, 
	manhacungcap VARCHAR(10) NULL , 
	maloaihang INT NULL , 
	soluong INT NULL, 
	donvitinh NVARCHAR(20) NULL , 
	giahang INT NULL
) 

-- Tạo bảng Nhân viên
CREATE TABLE nhanvien 
( 
	manhanvien VARCHAR(10) NOT NULL, 
	ho NVARCHAR(20) NOT NULL , 
	ten NVARCHAR(10) NOT NULL , 
	ngaysinh DATETIME NULL , 
	ngaylamviec DATETIME NULL , 
	diachi NVARCHAR(50) NULL , 
	dienthoai VARCHAR(15) NULL , 
	luongcoban MONEY NULL , 
	phucap MONEY NULL 
) 
 
-- Tạo bảng khách hàng
CREATE TABLE khachhang 
( 
	makhachhang VARCHAR(10) NOT NULL, 
	tenkhachhang NVARCHAR(50) NOT NULL , 
	tengiaodich NVARCHAR(30) NOT NULL , 
	diachi NVARCHAR(50) NULL , 
	email VARCHAR(30) NULL , 
	dienthoai VARCHAR(15) NULL , 
	fax VARCHAR(15) NULL 
) 

-- Tạo bảng đơn đặt hàng
CREATE TABLE dondathang 
( 
	sohoadon INT NOT NULL, 
	makhachhang VARCHAR(10) NULL , 
	manhanvien VARCHAR(10) NULL , 
	ngaydathang SMALLDATETIME NULL , 
	ngaygiaohang SMALLDATETIME NULL , 
	ngaychuyenhang SMALLDATETIME NULL , 
	noigiaohang NVARCHAR(50) NULL 
) 

-- Tạo bảng chi tiết đơn hàng 
CREATE TABLE chitietdathang 
( 
	sohoadon INT NOT NULL , 
	mahang VARCHAR(10) NOT NULL , 
	giaban MONEY NOT NULL , 
	soluong SMALLINT NOT NULL , 
	mucgiamgia REAL NOT NULL 
) 
---Tạo bảng điều kiện nhập hàng
CREATE TABLE dieukiennhaphang
(
	mahang VARCHAR(10) NOT NULL,
	mahang_truoc VARCHAR(10) NOT NULL
)
-------------------------------------------------------
ALTER TABLE NHACUNGCAP
ADD CONSTRAINT PK_NHACUNGCAP
	PRIMARY KEY (MANHACUNGCAP)

ALTER TABLE LOAIHANG
ADD CONSTRAINT PK_LOAIHANG
	PRIMARY KEY (MALOAIHANG)
ALTER TABLE MATHANG
ADD CONSTRAINT PK_MATHANG
	PRIMARY KEY (MAHANG)

ALTER TABLE NHANVIEN
ADD CONSTRAINT PK_NHANVIEN
	PRIMARY KEY (MANHANVIEN)
ALTER TABLE KHACHHANG
ADD CONSTRAINT PK_KHACHHANG
	PRIMARY KEY (MAKHACHHANG)

ALTER TABLE DONDATHANG
ADD CONSTRAINT PK_DONDATHANG
	PRIMARY KEY (SOHOADON)

ALTER TABLE CHITIETDATHANG
ADD CONSTRAINT PK_CHITIETDATHANG
	PRIMARY KEY (SOHOADON, MAHANG)

ALTER TABLE DIEUKIENNHAPHANG
ADD CONSTRAINT PK_DIEUKIENNHAPHANG
	PRIMARY KEY (MAHANG, MAHANG_TRUOC)

ALTER TABLE MATHANG
ADD CONSTRAINT FK_MATHANG_LOAIHANG
	FOREIGN KEY (MALOAIHANG)
	REFERENCES LOAIHANG(MALOAIHANG), 
	CONSTRAINT FK_MATHANG_NHACUNGCAP
	FOREIGN KEY (MANHACUNGCAP)
	REFERENCES NHACUNGCAP(MANHACUNGCAP)

ALTER TABLE DONDATHANG
ADD CONSTRAINT FK_DONDATHANG_KHACHANG
	FOREIGN KEY (MAKHACHHANG)
	REFERENCES KHACHHANG(MAKHACHHANG),
	CONSTRAINT FK_DONDATHANG_NHANVIEN
	FOREIGN KEY (MANHANVIEN)
	REFERENCES NHANVIEN(MANHANVIEN)


--ALTER TABLE CHITIETDATHANG
--ADD CONSTRAINT FK_CHITIETDATHANG_DONDATHANG
--	FOREIGN KEY (SOHOADON)
--	REFERENCES DONDATHANG(SOHOADON),
--	CONSTRAINT FK_CHITIETDATHANG_MATHANG
--	FOREIGN KEY (MAHANG)
--	REFERENCES MATHANG(MAHANG)

ALTER TABLE DIEUKIENNHAPHANG
ADD CONSTRAINT FK_DIEUKIENNHAPHANG_MATHANG1
	FOREIGN KEY (MAHANG)
	REFERENCES MATHANG(MAHANG),
	CONSTRAINT FK_DIEUKIENNHAPHANG_MATHANG2
	FOREIGN KEY (MAHANG_TRUOC)
	REFERENCES MATHANG(MAHANG)
	   