USE QLBanHang;

CREATE TABLE Hangsx
(
	Mahangsx nchar(10),
	Tenhang nvarchar(20),
	Diachi nvarchar(30),
	Sodt nvarchar(20),
	email nvarchar(30),
	PRIMARY KEY (Mahangsx)
);

CREATE TABLE Sanpham 
(
	masp nchar(10),
	mahangsx nchar(10),
	tensp nvarchar(20),
	soluong int,
	mausac nvarchar(20),
	giaban money,
	donvitinh nchar(10),
	mota nvarchar(max),
	PRIMARY KEY (masp),
	FOREIGN KEY (mahangsx) REFERENCES Hangsx(mahangsx)
);

CREATE TABLE Nhanvien
(
	Manv nchar(10),
	Tennv nvarchar(20),
	Gioitinh nchar(10),
	Diachi nvarchar(30),
	Sodt nvarchar(20),
	email nvarchar(30),
	Phong nvarchar(30),
	PRIMARY KEY (Manv)
);

CREATE TABLE Nhap
(
	Sohdn nchar(10),
	Masp nchar(10),
	Manv nchar(10),
	Ngaynhap date,
	soluongN int,
	dongiaN money,
	PRIMARY KEY (Sohdn),
	FOREIGN KEY (Masp) REFERENCES Sanpham(masp),
	FOREIGN KEY (Manv) REFERENCES Nhanvien(manv),
);

CREATE TABLE Xuat
(
	Sohdx nchar(10),
	Masp nchar(10),
	Manv nchar(10),
	Ngayxuat date,
	soluongX int,
	PRIMARY KEY (sohdx, masp),
	FOREIGN KEY (Masp) REFERENCES Sanpham(masp),
	FOREIGN KEY (Manv) REFERENCES Nhanvien(manv),
)