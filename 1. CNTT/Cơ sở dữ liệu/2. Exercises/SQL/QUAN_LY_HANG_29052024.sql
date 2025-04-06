CREATE TABLE HANG(
	hang_id CHAR(20) PRIMARY KEY,
	hang_name CHAR (30),
	quantity INT
);
DROP TABLE HANG

CREATE TABLE LOAIHANG(
	hang_id CHAR(20),
	loai_hang_id CHAR(20) PRIMARY KEY,
	loai_hang_name CHAR(30)
);
DROP TABLE LOAIHANG

CREATE TABLE PRICE(
	price_id CHAR(10),
	price int,
	price_date date,
	hang_id CHAR(20)
);
DROP TABLE PRICE
