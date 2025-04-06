/*****************************QUAN LY SINH VIEN****************************/

GO
USE QUANLYDAOTAO_B8_MSSV

/****************************XOA KHOA NGOAI******************************/
ALTER TABLE  KQUA
		DROP CONSTRAINT FK_KQUA_MASV 

ALTER TABLE  KQUA
		DROP CONSTRAINT FK_KQUA_MAHP 
			         
ALTER TABLE  DKIEN
		DROP CONSTRAINT FK_DKIEN_MAMH 

ALTER TABLE  DKIEN
		DROP CONSTRAINT FK_DKIEN_MAMH_TRUOC 

/****************************XOA KHOA CHINH *******************************/

ALTER TABLE  SVIEN
		DROP CONSTRAINT PK_SVIEN 

ALTER TABLE  KHOA
		DROP CONSTRAINT PK_KHOA 

ALTER TABLE  MHOC
		DROP CONSTRAINT PK_MHOC 

ALTER TABLE  HPHAN
		DROP CONSTRAINT PK_HPHAN 

/***********************XOA DU LIEU CUA BANG******************************/
delete KQUA
delete HPHAN
delete DKIEN
delete MHOC
delete SVIEN
delete KHOA

/***********************XOA BANG******************************/
drop table KQUA
drop table HPHAN
drop table DKIEN
drop table MHOC
drop table SVIEN
drop table KHOA

/*******************XOA DATABASE*********************/
go
use master

drop database QUANLYDAOTAO_B8_MSSV

