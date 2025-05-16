Drop table KHACHHANG;
Drop table DONDATHANG;
Drop table SANPHAM;
Drop table CHITIETDATHANG;

-- table KHACHHANG
CREATE TABLE KHACHHANG (
    MAKH VARCHAR(20) PRIMARY KEY, 
    TENKH NVARCHAR(50) NOT NULL, 
    DIACHI NVARCHAR(100), 
    DIENTHOAI VARCHAR(15) 
);

-- table DONDATHANG
CREATE TABLE DONDATHANG (
    MADDH VARCHAR(20) PRIMARY KEY, 
    NGAYDH DATE NOT NULL, 
    MAKH VARCHAR(20) FOREIGN KEY REFERENCES KHACHHANG(MAKH), 
    TINHTRANG VARCHAR(20) CHECK (TINHTRANG IN ('DA GIAO', 'CHUA GIAO', 'Da HUY'))
);

-- table SANPHAM
CREATE TABLE SANPHAM (
    MASP VARCHAR(20) PRIMARY KEY, 
    TENSP NVARCHAR(50) NOT NULL,
    DVT NVARCHAR(10) NOT NULL, -- Don vi tinh 
    SLCON INT NOT NULL, 
    DONGIA DECIMAL(18,2) NOT NULL
);

-- Table CHITIETDATHANG
CREATE TABLE CHITIETDATHANG (
    MADDH VARCHAR(20) FOREIGN KEY REFERENCES DONDATHANG(MADDH), -- Composite key 
    MASP VARCHAR(20) FOREIGN KEY REFERENCES SANPHAM(MASP), 
    SL INT NOT NULL, 
    PRIMARY KEY (MADDH, MASP) -- PK la su ket hop  MADDH va MASP
);


INSERT INTO KHACHHANG (MAKH, TENKH, DIACHI, DIENTHOAI) VALUES
('KH001', 'Nguyễn Văn A', 'Hà Nội', '0912345678'),
('KH002', 'Trần Thị B', 'Hồ Chí Minh', '0987654321'),
('KH003', 'Lê Văn C', 'Đà Nẵng', '0901234567');

-- Dữ liệu cho bảng SANPHAM
INSERT INTO SANPHAM (MASP, TENSP, DVT, SLCON, DONGIA) VALUES
('SP001', 'Máy tính xách tay', 'Chiếc', 100, 15000000),
('SP002', 'Điện thoại di động', 'Chiếc', 200, 8000000),
('SP003', 'Máy in', 'Chiếc', 50, 5000000),
('SP004', 'Bàn phím', 'Chiếc', 150, 500000);

-- Dữ liệu cho bảng DONDATHANG
INSERT INTO DONDATHANG (MADDH, NGAYDH, MAKH, TINHTRANG) VALUES
('DDH001', '2023', 'KH001', 'DA GIAO'),
('DDH002', '2023', 'KH002', 'CHUA GIAO'),
('DDH003', '2022', 'KH003', 'DA HUY'),
('DDH004', '2024', 'KH001', 'CHUA GIAO');

-- Dữ liệu cho bảng CHITIETDATHANG
INSERT INTO CHITIETDATHANG (MADDH, MASP, SL) VALUES
('DDH001', 'SP001', 2),
('DDH001', 'SP002', 1),
('DDH002', 'SP003', 3),
('DDH003', 'SP004', 5),
('DDH004', 'SP001', 1);

GO
----------------------------------------------------------------------------------------------------------------
-- 1a. Create view for customer has order in 2023 
-- View không lưu trữ dữ liệu mà chỉ lưu trữ câu lệnh SELECT
DROP VIEW KhachHangDatHang2023;
GO

CREATE VIEW KhachHangDatHang2023 AS
	SELECT kh.MAKH, kh.TENKH, kh.DIACHI, kh.DIENTHOAI
	FROM KHACHHANG kh
	JOIN DONDATHANG ddh ON kh.MAKH = ddh.MAKH
	WHERE YEAR(ddh.NGAYDH) = 2023;
GO

-- 1b.Store Procedure (dạng Transaction) cho việc lập 1 order
-- Tạo kiểu dữ liệu bảng cho chi tiết đơn hàng

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_MaxSLHang')
BEGIN
    DROP PROCEDURE sp_LapDonHang;
END;

GO
-- Tạo stored procedure
CREATE PROCEDURE sp_LapDonHang
    @MADDH VARCHAR(20),
    @NGAYDH DATE,
    @MAKH VARCHAR(20),
    @MASP VARCHAR(20),
    @SL INT
AS
BEGIN
    -- Kiểm tra xem khách hàng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM KHACHHANG WHERE MAKH = @MAKH)
    BEGIN
        RAISERROR ('Khách hàng không tồn tại.', 16, 1)
        RETURN
    END

        -- Kiểm tra xem sản phẩm có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM SANPHAM WHERE MASP = @MASP)
    BEGIN
        RAISERROR ('Sản phẩm không tồn tại.', 16, 1)
        RETURN
    END

    -- Bắt đầu Transaction
    BEGIN TRANSACTION
    
    BEGIN TRY
        -- Thêm đơn đặt hàng mới
        INSERT INTO DONDATHANG (MADDH, NGAYDH, MAKH, TINHTRANG)
        VALUES (@MADDH, @NGAYDH, @MAKH, 'CHUA GIAO'); -- Mặc định là CHUA GIAO

        -- Thêm chi tiết đơn đặt hàng
        INSERT INTO CHITIETDATHANG (MADDH, MASP, SL)
        VALUES (@MADDH, @MASP, @SL);

                -- Cập nhật số lượng sản phẩm còn lại
                UPDATE SANPHAM
                SET SLCON = SLCON - @SL
                WHERE MASP = @MASP;

        -- Commit Transaction nếu thành công
        COMMIT TRANSACTION
                PRINT 'Lập đơn hàng thành công.'
    END TRY
    BEGIN CATCH
        -- Rollback Transaction nếu có lỗi
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION
        
        -- In ra thông tin lỗi
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO


EXEC sp_LapDonHang 'DDH006', '2024', 'KH003', 'SP002', 3; -- TH: commit duoc don hang 
EXEC sp_LapDonHang 'DDH009', '2024', 'KH002', 'SP003', 1000; 

-- cac truong hop loi --> proc rollback 
EXEC sp_LapDonHang 'DDH007', '2024', 'KH005', 'SP001', 1; -- TH khach hang khong ton tai 
EXEC sp_LapDonHang 'DDH008', '2024', 'KH001', 'SP005', 2; -- TH: khong co san pham
EXEC sp_LapDonHang 'DDH009', '2024', 'KH002', 'SP003', 1000; -- TH: so luong dat qua ton kho 
EXEC sp_LapDonHang 'DDH088', '2024', 'KH002', 'SP003', 100000000; -- TH: so luong dat qua ton kho 

GO
----------------------------------------------------------------------------------------------------------------
-- Bai 2

-- Bảng KHACHHANG_ 
CREATE TABLE KHACHHANG_ (
    MAKH VARCHAR(20) PRIMARY KEY,
    TENKH NVARCHAR(50) NOT NULL,
    ĐCKH NVARCHAR(100), -- Địa chỉ khách 
    ĐTKH VARCHAR(15)   -- Điện thoại khách hàng
);

-- Bảng TAIKHOAN
CREATE TABLE TAIKHOAN (
    MATK VARCHAR(20) PRIMARY KEY,
    SODU DECIMAL(18,2) NOT NULL DEFAULT 0, -- Số dư hiện tại
    SODUCO DECIMAL(18,2) NOT NULL DEFAULT 0, -- Số dư có (tiền vào)
    SODUNO DECIMAL(18,2) NOT NULL DEFAULT 0, -- Số dư nợ (tiền ra)
    MAKH VARCHAR(20) FOREIGN KEY REFERENCES KHACHHANG_(MAKH) -- Khóa ngoại tham chiếu đến KHACHHANG_
);

-- Bảng GIAODICH
CREATE TABLE GIAODICH (
    MAGD VARCHAR(20) PRIMARY KEY,
    NGAYGD DATETIME NOT NULL DEFAULT GETDATE(), -- Ngày giao dịch, mặc định là ngày hiện tại
    TKNO VARCHAR(20) FOREIGN KEY REFERENCES TAIKHOAN(MATK), -- Tài khoản nợ (rút tiền/chuyển đi)
    TKCO VARCHAR(20) FOREIGN KEY REFERENCES TAIKHOAN(MATK), -- Tài khoản có (nhận tiền/gửi vào)
    SOTIEN DECIMAL(18,2) NOT NULL
);


-- Dữ liệu cho bảng KHACHHANG_
INSERT INTO KHACHHANG_ (MAKH, TENKH, ĐCKH, ĐTKH) VALUES
('KH001', 'Nguyễn Văn A', 'Hà Nội', '0912345678'),
('KH002', 'Trần Thị B', 'Hồ Chí Minh', '0987654321');

-- Dữ liệu cho bảng TAIKHOAN
INSERT INTO TAIKHOAN (MATK, SODU, SODUCO, SODUNO, MAKH) VALUES
('TK001', 1000000, 1000000, 0, 'KH001'),
('TK002', 500000, 500000, 0, 'KH002');
---

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_MaxSLHang')
BEGIN
    DROP PROCEDURE sp_GuiTien;
END;
GO

--a) Gửi tiền (Deposit): 
GO
CREATE PROCEDURE sp_GuiTien
    @MATK VARCHAR(20),
    @SOTIEN DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON; -- Ngăn chặn trả về số dòng bị ảnh hưởng
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE TAIKHOAN SET SODU = SODU + @SOTIEN, SODUCO = SODUCO + @SOTIEN WHERE MATK = @MATK;
        IF @@ROWCOUNT = 0 -- Kiểm tra xem có dòng nào được cập nhật không
        BEGIN
            RAISERROR('Tài khoản không tồn tại.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;
        INSERT INTO GIAODICH (MAGD, TKCO, SOTIEN) VALUES (NEWID(), @MATK, @SOTIEN);
        COMMIT TRANSACTION;
        PRINT 'Gửi tiền thành công.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW; -- Re-throw lỗi để xử lý ở mức cao hơn nếu cần
    END CATCH;
END;
GO

EXEC sp_GuiTien 'TK001', 500000;
EXEC sp_GuiTien 'TK999', 100000;  -- VD tai khoan khong co thuc 





-- b.  Rút tiền (Withdrawal):


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_MaxSLHang')
BEGIN
    DROP PROCEDURE sp_RutTien;
END;

GO

CREATE PROCEDURE sp_RutTien
    @MATK VARCHAR(20),
    @SOTIEN DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        IF (SELECT SODU FROM TAIKHOAN WHERE MATK = @MATK) < @SOTIEN
        BEGIN
            RAISERROR('Số dư không đủ.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;
                UPDATE TAIKHOAN SET SODU = SODU - @SOTIEN, SODUNO = SODUNO + @SOTIEN WHERE MATK = @MATK;
        IF @@ROWCOUNT = 0 -- Kiểm tra xem có dòng nào được cập nhật không
        BEGIN
            RAISERROR('Tài khoản không tồn tại.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;
        INSERT INTO GIAODICH (MAGD, TKNO, SOTIEN) VALUES (NEWID(), @MATK, @SOTIEN);
        COMMIT TRANSACTION;
        PRINT 'Rút tiền thành công.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

EXEC sp_RutTien 'TK001', 2000000; --VD rut tien qua tai khoan 




--c. Chuyển tiền (Transfer):
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_MaxSLHang')
BEGIN
    DROP PROCEDURE sp_ChuyenTien;
END;
GO


CREATE PROCEDURE sp_ChuyenTien
    @TKNO VARCHAR(20),
    @TKCO VARCHAR(20),
    @SOTIEN DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        IF (SELECT SODU FROM TAIKHOAN WHERE MATK = @TKNO) < @SOTIEN
        BEGIN
            RAISERROR('Số dư tài khoản gửi không đủ.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;
                UPDATE TAIKHOAN SET SODU = SODU - @SOTIEN, SODUNO = SODUNO + @SOTIEN WHERE MATK = @TKNO;
        IF @@ROWCOUNT = 0 -- Kiểm tra xem có dòng nào được cập nhật không
        BEGIN
            RAISERROR('Tài khoản gửi không tồn tại.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;
                UPDATE TAIKHOAN SET SODU = SODU + @SOTIEN, SODUCO = SODUCO + @SOTIEN WHERE MATK = @TKCO;
        IF @@ROWCOUNT = 0 -- Kiểm tra xem có dòng nào được cập nhật không
        BEGIN
            RAISERROR('Tài khoản nhận không tồn tại.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;
        INSERT INTO GIAODICH (MAGD, TKNO, TKCO, SOTIEN) VALUES (NEWID(), @TKNO, @TKCO, @SOTIEN);
        COMMIT TRANSACTION;
        PRINT 'Chuyển tiền thành công.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO