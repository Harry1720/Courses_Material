CREATE DATABASE QUANLYTHUVIEN_B8_MSSV
GO
USE QUANLYTHUVIEN_B8_MSSV
--create table
CREATE TABLE [DocGia] (
	[ma_docgia] [smallint] NOT NULL ,
	[ho] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tenlot] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ten] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
	, NgaySinh smalldatetime
) ON [PRIMARY] 
GO

CREATE TABLE [NguoiLon] (
	[ma_docgia] [smallint] NOT NULL ,
	[sonha] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[duong] [nvarchar] (63) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[quan] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dienthoai] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[han_sd] [smalldatetime] NOT NULL 	
) ON [PRIMARY]
GO

CREATE TABLE [TreEm] (
	[ma_docgia] [smallint] NOT NULL ,
	[ma_docgia_nguoilon] [smallint] NOT NULL	
) ON [PRIMARY]
GO

CREATE TABLE [CuonSach] (
	[isbn] [int] NOT NULL ,
	[Ma_CuonSach] [smallint] NOT NULL ,
	[TinhTrang] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [DangKy] (
	[isbn] [int] NOT NULL ,
	[ma_docgia] [smallint] NOT NULL ,
	[ngaygio_dk] [smalldatetime] ,
	[ghichu] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS 
) ON [PRIMARY]
GO

CREATE TABLE [DauSach] (
	[isbn] [int] NOT NULL ,
	[ma_tuasach] [int] NOT NULL ,
	[ngonngu] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS ,
	[bia] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS  ,
	[trangthai] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS not null
) ON [PRIMARY]
GO

CREATE TABLE [Muon] (
	[isbn] [int] NOT NULL ,
	[ma_cuonsach] [smallint] NOT NULL ,
	[ma_docgia] [smallint] NOT NULL ,
	[ngayGio_muon] [smalldatetime] NOT NULL ,
	[ngay_hethan] [smalldatetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [QuaTrinhMuon] (
	[isbn] [int] NOT NULL ,
	[ma_cuonsach] [smallint] NOT NULL ,
	[ngayGio_muon] [smalldatetime] NOT NULL ,
	[ma_docgia] [smallint] NOT NULL ,
	[ngay_hethan] [smalldatetime] NULL ,
	[ngayGio_tra] [smalldatetime] NULL ,
	[tien_muon] [money] NULL ,
	[tien_datra] [money] NULL ,
	[tien_datcoc] [money] NULL ,
	[ghichu] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TuaSach] (
	[ma_tuasach] [int] NOT NULL ,
	[TuaSach] [nvarchar] (63) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tacgia] [nvarchar] (31) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[tomtat] varchar(222) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

------------------------------------------------------------
--create PK
ALTER TABLE [CuonSach] WITH NOCHECK ADD 
	CONSTRAINT [PK_cuonsach] PRIMARY KEY  CLUSTERED 
	(
		[isbn],
		[ma_cuonsach]
	)  ON [PRIMARY] 
GO

ALTER TABLE [DangKy] WITH NOCHECK ADD 
	CONSTRAINT [PK_dangky] PRIMARY KEY  CLUSTERED 
	(
		[isbn],
		[ma_docgia]
	)  ON [PRIMARY] 
GO

ALTER TABLE [DauSach] WITH NOCHECK ADD 
	CONSTRAINT [PK_dausach] PRIMARY KEY  CLUSTERED 
	(
		[isbn]
	)  ON [PRIMARY] 
GO

ALTER TABLE [DocGia] WITH NOCHECK ADD 
	CONSTRAINT [PK_docgia] PRIMARY KEY  CLUSTERED 
	(
		[ma_docgia]
	)  ON [PRIMARY] 
GO

ALTER TABLE [Muon] WITH NOCHECK ADD 
	CONSTRAINT [PK_muon] PRIMARY KEY  CLUSTERED 
	(
		[isbn],
		[ma_cuonsach]
	)  ON [PRIMARY]
GO

ALTER TABLE [NguoiLon] WITH NOCHECK ADD 
	CONSTRAINT [PK_nguoilon] PRIMARY KEY  CLUSTERED 
	(
		[ma_docgia]
	)  ON [PRIMARY]
GO

ALTER TABLE [QuaTrinhMuon] WITH NOCHECK ADD 
	CONSTRAINT [PK_QuaTrinhMuon] PRIMARY KEY  CLUSTERED 
	(
		[isbn],
		[ma_cuonsach],
		[ngayGio_muon]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TreEm] WITH NOCHECK ADD 
	CONSTRAINT [PK_treem] PRIMARY KEY  CLUSTERED 
	(
		[ma_docgia]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TuaSach] WITH NOCHECK ADD 
	CONSTRAINT [PK_tuasach] PRIMARY KEY  CLUSTERED 
	(
		[ma_tuasach]
	)  ON [PRIMARY] 
GO

------------------------------------------------------------
--create FK
ALTER TABLE [CuonSach] ADD 
	CONSTRAINT [FK_cuonsach_dausach] FOREIGN KEY 
	(
		[isbn]
	) REFERENCES [DauSach] (
		[isbn]
	)
GO

ALTER TABLE [DangKy] ADD 
	CONSTRAINT [FK_dangky_dausach] FOREIGN KEY 
	(
		[isbn]
	) REFERENCES [DauSach] (
		[isbn]
	),
	CONSTRAINT [FK_dangky_docgia] FOREIGN KEY 
	(
		[ma_docgia]
	) REFERENCES [DocGia] (
		[ma_docgia]
	)
GO

alter table Muon add
	constraint fkMuon_DocGia 
	foreign key(ma_docgia)
	references DocGia(ma_docgia)
go

alter table QuaTrinhMuon add
	constraint fkQuaTrinhMuon_DocGia 
	foreign key(ma_docgia)
	references DocGia(ma_docgia)
go

ALTER TABLE [DauSach] ADD 
	CONSTRAINT [FK_dausach_tuasach] FOREIGN KEY 
	(
		[ma_tuasach]
	) REFERENCES [TuaSach] (
		[ma_tuasach]
	)
GO

ALTER TABLE [Muon] ADD 
	CONSTRAINT [FK_muon_cuonsach] FOREIGN KEY 
	(
		[isbn],
		[ma_cuonsach]
	) REFERENCES [CuonSach] (
		[isbn],
		[ma_cuonsach]
	)
GO

ALTER TABLE [NguoiLon] ADD 
	CONSTRAINT [FK_nguoilon_docgia] FOREIGN KEY 
	(
		[ma_docgia]
	) REFERENCES [DocGia] (
		[ma_docgia]
	)
GO

ALTER TABLE [QuaTrinhMuon] ADD 
	CONSTRAINT [FK_QuaTrinhMuon_cuonsach] FOREIGN KEY 
	(
		[isbn],
		[ma_cuonsach]
	) REFERENCES [CuonSach] (
		[isbn],
		[ma_cuonsach]
	)
GO

ALTER TABLE [TreEm] ADD 
	CONSTRAINT [FK_treem_docgia] FOREIGN KEY 
	(
		[ma_docgia]
	) REFERENCES [DocGia] (
		[ma_docgia]
	),
	CONSTRAINT [FK_treem_nguoilon] FOREIGN KEY 
	(
		[ma_docgia_nguoilon]
	) REFERENCES [NguoiLon] (
		[ma_docgia]
	)
GO

