/******************************CREATE DATABASE********************************/

CREATE DATABASE QUANLYSINHVIEN_B4_MSSV
GO 
USE QUANLYSINHVIEN_B4_MSSV

/************************TAO BANG KHOA QUAN LY SINH VIEN*************************/
CREATE TABLE KHOA(MAKHOA VARCHAR(4) NOT NULL ,
			TENKHOA NVARCHAR(30) NOT NULL,
			      NAMTHANHLAP INT NOT NULL)

/************************TAO BANG SVIEN QUAN LY SINH VIEN*************************/
CREATE TABLE SVIEN(TEN NVARCHAR(30) NOT NULL,
			MASV INT NOT NULL,
				NGAYSINH DATE,
					GIOITINH BIT,
						NAM INT NULL,
							MAKH VARCHAR(4) NULL)

/*************************KHOA CHINH **********************************/
ALTER TABLE SVIEN
		ADD CONSTRAINT PK_SVIEN 
			PRIMARY KEY (MASV)
ALTER TABLE KHOA
		ADD CONSTRAINT PK_KHOA 
			PRIMARY KEY (MAKHOA)

/***************************KHOA NGOAI***************************/
ALTER TABLE SVIEN 
		ADD CONSTRAINT FK_SVIEN_MAKH FOREIGN KEY (MAKH)
			REFERENCES KHOA (MAKHOA)
