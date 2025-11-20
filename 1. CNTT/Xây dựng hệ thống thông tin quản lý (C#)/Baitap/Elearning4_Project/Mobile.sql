-- Tạo Database
CREATE DATABASE MobileShoppeDB;
GO

-- Sử dụng Database vừa tạo
USE MobileShoppeDB;
GO

-- Bảng 1: tbl_Company (Lưu thông tin hãng sản xuất)
CREATE TABLE tbl_Company (
    CompID INT PRIMARY KEY,
    CName VARCHAR(50) NOT NULL UNIQUE
);
GO

-- Bảng 2: tbl_Model (Lưu thông tin mẫu điện thoại)
CREATE TABLE tbl_Model (
    ModelID INT PRIMARY KEY,
    CompID INT,
    ModelNum VARCHAR(50) NOT NULL,
    AvailableQty INT DEFAULT 0,
    FOREIGN KEY (CompID) REFERENCES tbl_Company(CompID)
);
GO

-- Bảng 3: tbl_Transaction (Lịch sử nhập kho)
CREATE TABLE tbl_Transaction (
    TransID INT PRIMARY KEY,
    ModelID INT,
    Quantity INT,
    [Date] DATETIME,
    Amount DECIMAL(18, 2),
    FOREIGN KEY (ModelID) REFERENCES tbl_Model(ModelID)
);
GO

-- Bảng 4: tbl_Mobile (Lưu thông tin chi tiết từng chiếc điện thoại với IMEI)
CREATE TABLE tbl_Mobile (
    IMEINO VARCHAR(50) PRIMARY KEY,
    ModelID INT,
    [Status] VARCHAR(20) DEFAULT 'Not Sold', -- Trạng thái: Not Sold, Sold
    Price DECIMAL(18, 2),
    Warranty NVARCHAR(50),
    FOREIGN KEY (ModelID) REFERENCES tbl_Model(ModelID)
);
GO

-- Bảng 5: tbl_Customer (Lưu thông tin khách hàng)
CREATE TABLE tbl_Customer (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(100),
    MobileNumber VARCHAR(20),
    EmailID VARCHAR(100),
    [Address] VARCHAR(MAX)
);
GO

-- Bảng 6: tbl_Sales (Lưu thông tin bán hàng)
CREATE TABLE tbl_Sales (
    SalesID INT PRIMARY KEY,
    IMEINO VARCHAR(50),
    PurchaseDate DATETIME,
    Price DECIMAL(18, 2),
    CustID INT,
    FOREIGN KEY (IMEINO) REFERENCES tbl_Mobile(IMEINO),
    FOREIGN KEY (CustID) REFERENCES tbl_Customer(CustID)
);
GO

-- Bảng 7: tbl_User (Lưu thông tin người dùng: Admin và Employee)
CREATE TABLE tbl_User (
    UserName VARCHAR(50) PRIMARY KEY,
    PWD VARCHAR(50) NOT NULL,
    EmployeeName VARCHAR(100),
    [Address] VARCHAR(MAX),
    MobileNumber VARCHAR(20),
    Hint VARCHAR(100) -- Gợi ý để khôi phục mật khẩu
);
GO

-- Thêm một tài khoản Admin mặc định để đăng nhập lần đầu
INSERT INTO tbl_User (UserName, PWD, EmployeeName, Hint) VALUES ('admin', 'admin', 'Shop Owner', 'admin');
GO