CREATE VIEW cau1_lab21 AS
SELECT sp.masp, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota, sx.Mahangsx, sx.Tenhang, sx.Diachi, sx.Sodt, sx.email, nv.Manv AS Ma,
nv.Tennv, nv.Gioitinh, nv.Diachi AS DChi, nv.Sodt AS SDT, nv.email AS EmailNV, nv.Phong, n.Ngaynhap, n.soluongN, n.dongiaN, x.Sohdx, x.Manv,x.Ngayxuat, x.soluongX
FROM Sanpham sp
JOIN Hangsx sx ON sp.mahangsx = sx.mahangsx
JOIN Nhap n ON sp.masp = n.masp
JOIN Xuat x ON sp.masp = x.masp
JOIN Nhanvien nv ON n.manv = nv.manv AND x.manv = nv.manv;
GO

CREATE VIEW cau2_lab21 AS
SELECT TOP 100 * 
FROM Sanpham 
ORDER BY giaban DESC
GO

CREATE VIEW cau3_lab21 AS
SELECT sp.masp AS MaSP,sp.tensp AS TenSP, sp.soluong AS SL, sp.mausac AS Mau, sp.giaban AS Gia, sp.donvitinh AS DVT, sp.mota AS MoTa,
sx.mahangsx AS MaHSX, sx.Tenhang AS TenHang, sx.Diachi AS DChi, sx.Sodt AS SDT, sx.email AS Email
FROM Sanpham sp
INNER JOIN Hangsx sx on sx.Mahangsx = sp.mahangsx
WHERE sx.Tenhang = 'Samsung'
GO

CREATE VIEW cau4_lab21 AS
SELECT nv.Manv AS MaNV, nv.Tennv AS Ten, nv.Gioitinh AS GioiTinh, nv.Diachi AS DChi, nv.Sodt AS SDT, nv.email AS Email, nv.Phong AS Phong
FROM Nhanvien nv
WHERE nv.Gioitinh = 'nữ' AND nv.Phong = 'kế toán'
GO

CREATE VIEW cau5_lab21 AS
SELECT TOP 100 n.sohdn, sp.masp, sp.tensp, hsx.tenhang, n.soluongN, n.dongiaN, n.soluongN * n.dongiaN as tiennhap,
sp.mausac, sp.donvitinh, n.ngaynhap, nv.tennv, nv.phong
FROM Nhap n
INNER JOIN Sanpham sp ON n.masp = sp.masp
INNER JOIN Hangsx hsx ON sp.mahangsx = hsx.mahangsx
INNER JOIN Nhanvien nv ON n.manv = nv.manv
ORDER BY tiennhap ASC
GO

CREATE VIEW cau6_lab21 AS
SELECT TOP 100 x.Sohdx, sp.masp, sp.tensp, sx.tenhang, x.soluongX, sp.giaban, x.soluongX*giaban as tienxuat, sp.mausac, sp.donvitinh, x.ngayxuat, nv.tennv, nv.phong
FROM Xuat x
INNER JOIN Sanpham sp ON x.Masp = sp.masp
INNER JOIN Hangsx sx ON sp.mahangsx = sx.Mahangsx
INNER JOIN Nhanvien nv ON x.Manv = nv.Manv
WHERE MONTH(X.ngayxuat) = 10 AND YEAR(X.ngayxuat) = 2018
ORDER BY tienxuat DESC
GO

CREATE VIEW cau7_lab21 AS
SELECT n.sohdn, n.masp, sp.tensp, n.soluongN, n.dongiaN, n.ngaynhap, nv.tennv, nv.phong
FROM Hangsx sx
INNER JOIN Sanpham sp ON sp.mahangsx =  sx.Mahangsx
INNER JOIN Nhap n ON n.Masp = sp.masp
INNER JOIN Nhanvien nv ON  nv.Manv = n.Manv
WHERE sx.Tenhang = 'Samsung' AND YEAR(n.ngaynhap) = 2017
GO

CREATE VIEW cau8_lab21 AS
SELECT TOP 10 *
FROM Xuat
WHERE YEAR(ngayxuat) = 2020
ORDER BY soluongX DESC
GO

CREATE VIEW cau9_lab21 AS
SELECT TOP 10 *
FROM Sanpham
ORDER BY giaban DESC;
GO

CREATE VIEW cau10_lab21 AS
SELECT sp.masp, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota, sx.Mahangsx, sx.Tenhang, sx.Diachi, sx.Sodt, sx.email
FROM Sanpham sp
INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
WHERE sx.Tenhang = 'Samsung' AND giaban BETWEEN 100000 AND 500000
GO

CREATE VIEW cau11_lab21 AS
SELECT SUM(n.soluongN*n.dongiaN) as N'Tổng tiền'
FROM Nhap n
INNER JOIN Sanpham sp ON n.masp = sp.masp
INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
WHERE YEAR(n.ngaynhap) = 2020 AND sx.Tenhang = 'Samsung'
GO

CREATE VIEW cau12_lab21 AS
SELECT SUM(x.soluongX*sp.giaban) as N'Tổng tiền xuất'
FROM Xuat x
INNER JOIN Sanpham sp ON sp.masp = x.Masp
WHERE  x.ngayxuat = '2018-09-02'
GO

CREATE VIEW cau13_lab21 AS
SELECT TOP 1 sohdn, ngaynhap, tiennhap = soluongN*dongiaN
FROM Nhap
WHERE YEAR(ngaynhap) = 2018
ORDER BY tiennhap DESC
GO 

CREATE VIEW cau14_lab21 AS
SELECT TOP 10 sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota, n.Sohdn,n.Masp, n.Manv, n.Ngaynhap, n.soluongN, n.dongiaN
FROM Sanpham sp
INNER JOIN Nhap n ON n.Masp = sp.masp
ORDER BY n.soluongN DESC
GO

CREATE VIEW cau15_lab21 AS
SELECT sp.masp, sp.tensp
FROM Sanpham sp
INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
INNER JOIN Nhap n ON n.Masp = sp.masp
INNER JOIN Nhanvien nv ON nv.Manv = n.Manv
WHERE sx.Tenhang = 'Samsung' AND nv.Manv = 'NV01'
GO

CREATE VIEW cau16_lab21 AS
SELECT n.sohdn, sp.masp, n.soluongN,  n.ngaynhap
FROM Nhap n
INNER JOIN Sanpham sp ON sp.masp = n.Masp
INNER JOIN Xuat x ON x.Masp = sp.masp
INNER JOIN Nhanvien nv ON nv.Manv = x.Manv
WHERE sp.masp = 'SP05' AND nv.Manv = 'NV01'
GO

CREATE VIEW cau17_lab21 AS
SELECT nv.manv, nv.tennv
FROM Nhanvien nv
INNER JOIN Xuat x ON x.Manv = nv.Manv	
WHERE x.Masp = 'SP02' AND x.Ngayxuat = '2020-02-03'
GO

CREATE VIEW cau1_lab22 AS
SELECT sx.tenhang, COUNT(DISTINCT sp.masp) as N'Số loại'
FROM Hangsx sx
INNER JOIN Sanpham sp ON sx.mahangsx = sp.mahangsx
GROUP BY sx.tenhang
GO

CREATE VIEW cau2_lab22 AS
SELECT sp.tensp, SUM(n.soluongN*n.dongiaN) as tiennhap
FROM Nhap n
INNER JOIN Sanpham sp ON n.Masp = sp.masp
WHERE YEAR(n.ngaynhap) = '2018'
GROUP BY sp.tensp
GO

CREATE VIEW cau3_lab22 AS
SELECT sp.tensp, SUM(x.soluongX) as tongxuat
FROM Xuat x 
INNER JOIN Sanpham  sp ON x.masp = sp.masp JOIN Hangsx sx ON sx.mahangsx = sp.mahangsx 
WHERE YEAR(ngayxuat) = 2018 AND sx.tenhang = 'Samsung'
GROUP BY SP.masp, SP.tensp
HAVING SUM(soluongX) > 10000 
GO

CREATE VIEW cau4_lab22 AS
SELECT phong , COUNT(DISTINCT gioitinh) AS NVNAM
FROM Nhanvien 
WHERE gioitinh like N'%Nam%'
GROUP BY phong
GO

CREATE VIEW cau5_lab22 AS
SELECT sx.tenhang , SUM(DISTINCT n.soluongN) as Soluongnhap
FROM Hangsx sx 
INNER JOIN Sanpham sp ON sx.mahangsx = sp.mahangsx 
INNER JOIN Nhap n ON sp.masp = n.masp
WHERE YEAR(ngaynhap) = '2018'
GROUP BY tenhang
GO

CREATE VIEW cau6_lab22 AS
SELECT nv.tennv , SUM(sp.giaban * x.soluongX) AS TongXuat
FROM Nhanvien nv 
INNER JOIN Xuat x ON nv.manv = x.manv  
INNER JOIN Sanpham sp ON x.masp = sp.masp
WHERE YEAR(x.ngayxuat) = '2018'
GROUP BY nv.tennv
GO

CREATE VIEW cau7_lab22 AS
SELECT nv.tennv , SUM(n.soluongN * n.dongiaN) AS TongTienNhap
FROM Nhanvien nv
INNER JOIN Nhap n ON nv.manv = n.manv 
INNER JOIN Sanpham sp ON n.masp = sp.masp
WHERE MONTH(n.ngaynhap) = 8 AND YEAR(n.ngaynhap) = '2018'
GROUP BY nv.tennv
HAVING SUM(n.soluongN*n.dongiaN) > 100000
GO

CREATE VIEW cau8_lab22 AS
SELECT sp.tensp 
FROM Sanpham sp
LEFT JOIN Nhap n ON n.masp = sp.masp 
LEFT JOIN Xuat x ON x.masp = sp.masp 
WHERE x.masp IS NULL AND n.masp IS NOT NULL
GROUP BY sp.tensp
GO

CREATE VIEW cau9_lab22 AS
SELECT sp.tensp 
FROM Sanpham sp 
LEFT JOIN Nhap n ON n.masp = sp.masp
LEFT JOIN Xuat x ON x.masp = sp.masp
WHERE YEAR(n.ngaynhap) = 2018 AND YEAR(x.ngayxuat) = 2018
GROUP BY sp.tensp
GO

CREATE VIEW cau10_lab22 AS
SELECT nv.tennv 
FROM Nhap n 
INNER JOIN Xuat x ON n.manv = x.manv
INNER JOIN Nhanvien nv ON nv.manv = n.manv
GROUP BY nv.tennv
GO

CREATE VIEW cau11_lab22 AS
SELECT tennv
FROM Nhanvien nv
JOIN Xuat x ON x.manv = nv.manv 
JOIN Nhap n ON n.manv = nv.manv
WHERE n.manv NOT IN (SELECT DISTINCT manv FROM Nhap) AND x.manv NOT IN (SELECT DISTINCT manv FROM Xuat)
GROUP BY nv.tennv
GO

