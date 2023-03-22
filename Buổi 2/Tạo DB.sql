USE QuanLyDeAn2;

CREATE TABLE PHANCONG 
(
MaNV varchar(9) NOT NULL,
MaDA varchar(2) NOT NULL,
ThoiGian numeric(18, 0) NULL,
PRIMARY KEY (MaNV, MaDA)
)

CREATE TABLE DEAN
(
MaDA varchar(2) NOT NULL,
TenDA nvarchar(50) NULL,
DDiemDA varchar(20) NULL,
PRIMARY KEY (MaDA)
)

CREATE TABLE PHONGBAN
(
MaPhg varchar(2) NOT NULL,
TenPhg nvarchar(20) NULL,
PRIMARY KEY (MaPhg)
)

CREATE TABLE NHANVIEN
(
MaNV varchar(9) NOT NULL,
HoNV nvarchar(15) NULL,
TenLot nvarchar(30) NULL,
TenNV nvarchar(30) NULL,
NgSinh smalldatetime NULL,
DiaChi nvarchar(150) NULL,
Phai nvarchar(3) NULL,
Luong numeric(18, 0) NULL,
Phong varchar(2) NULL,
PRIMARY KEY (MANV)
)

CREATE TABLE THANNHAN
(
MaNV varchar(9) NOT NULL,
TenTN varchar(20) NOT NULL,
NgaySinh smalldatetime NULL,
Phai varchar(3) NULL,
QuanHe varchar(15) NULL,
PRIMARY KEY ( MaNV, TenTN)
)