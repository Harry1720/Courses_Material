/*****************************QUAN LY SINH VIEN****************************/

go
use QUANLYSINHVIEN_B4_MSSV

/****************************XOA KHOA NGOAI******************************/
ALTER TABLE  SVIEN
		DROP CONSTRAINT FK_SVIEN_MAKH 

/****************************XOA KHOA CHINH *******************************/

ALTER TABLE  SVIEN
		DROP CONSTRAINT PK_SVIEN 

ALTER TABLE  KHOA
		DROP CONSTRAINT PK_KHOA 

/***********************XOA DU LIEU CUA BANG******************************/
delete SVIEN
delete KHOA

/***********************XOA BANG******************************/
drop table SVIEN
drop table KHOA

/*******************XOA DATABASE*********************/
go
use master

drop database QUANLYSINHVIEN_B4_MSSV

