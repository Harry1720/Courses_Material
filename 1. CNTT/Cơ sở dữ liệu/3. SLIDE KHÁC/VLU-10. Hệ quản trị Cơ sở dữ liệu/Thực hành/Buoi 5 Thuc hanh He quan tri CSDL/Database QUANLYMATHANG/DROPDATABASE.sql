/*********************Drop Database***********************************/
go
use QUANLYMATHANG_B5_MSSV

/*****************************XOA BANG****************************/

DELETE CHITIETGIAOHANG
DELETE CHITIETDATHANG
DELETE LICHSUGIA
DELETE PHIEUGIAOHANG
DELETE DONDATHANG
DELETE KHACHHANG
DELETE HANGHOA

drop table CHITIETGIAOHANG
drop table CHITIETDATHANG
drop table LICHSUGIA
drop table PHIEUGIAOHANG
drop table DONDATHANG
drop table KHACHHANG
drop table HANGHOA

go
use master

drop database QUANLYMATHANG_B5_MSSV



