USE QLBanHang;

/*1
SELECT * FROM Hangsx;
SELECT * FROM Nhanvien;
SELECT * FROM Nhap;
SELECT * FROM Sanpham;
SELECT * FROM Xuat;
*/

/*2
SELECT * FROM Sanpham 
ORDER BY giaban DESC
*/

/*3
SELECT * FROM Sanpham 
INNER JOIN Hangsx on Hangsx.Mahangsx = Sanpham.mahangsx
WHERE Hangsx.Tenhang = 'Samsung'
*/

/*4
SELECT * FROM Nhanvien
WHERE Gioitinh = 'nữ' AND Phong = 'kế toán'
*/

/* 5
SELECT n.sohdn, sp.masp, sp.tensp, hsx.tenhang, n.soluongN, n.dongiaN, n.soluongN * n.dongiaN as tiennhap, sp.mausac, sp.donvitinh, n.ngaynhap, nv.tennv, nv.phong
FROM Nhap n
INNER JOIN Sanpham sp ON n.masp = sp.masp
INNER JOIN Hangsx hsx ON sp.mahangsx = hsx.mahangsx
INNER JOIN Nhanvien nv ON n.manv = nv.manv
ORDER BY tiennhap ASC
*/

/* 6
SELECT x.Sohdx, sp.masp, sp.tensp, sx.tenhang, x.soluongX, sp.giaban, x.soluongX*giaban as tienxuat, sp.mausac, sp.donvitinh, x.ngayxuat, nv.tennv, nv.phong
FROM Xuat x
INNER JOIN Sanpham sp ON x.Masp = sp.masp
INNER JOIN Hangsx sx ON sp.mahangsx = sx.Mahangsx
INNER JOIN Nhanvien nv ON x.Manv = nv.Manv
WHERE MONTH(X.ngayxuat) = 10 AND YEAR(X.ngayxuat) = 2018
ORDER BY tienxuat DESC
*/

/* 7
SELECT n.sohdn, n.masp, sp.tensp, n.soluongN, n.dongiaN, n.ngaynhap, nv.tennv, nv.phong
FROM Hangsx sx
INNER JOIN Sanpham sp ON sp.mahangsx =  sx.Mahangsx
INNER JOIN Nhap n ON n.Masp = sp.masp
INNER JOIN Nhanvien nv ON  nv.Manv = n.Manv
WHERE sx.Tenhang = 'Samsung' AND YEAR(n.ngaynhap) = 2017
*/

/* 8
SELECT TOP 10 *
FROM Xuat
WHERE YEAR(ngayxuat) = 2020
ORDER BY soluongX DESC
*/

/* 9
SELECT TOP 10 *
FROM Sanpham
ORDER BY giaban DESC;
*/

/* 10
SELECT *
FROM Sanpham sp
INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
WHERE sx.Tenhang = 'Samsung' AND giaban BETWEEN 100000 AND 500000
*/

/* 11
SELECT SUM(n.soluongN*n.dongiaN) as N'Tổng tiền'
FROM Nhap n
INNER JOIN Sanpham sp ON n.masp = sp.masp
INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
WHERE YEAR(n.ngaynhap) = 2020 AND sx.Tenhang = 'Samsung'
*/

/*
SELECT SUM(x.soluongX*sp.giaban) as N'Tổng tiền xuất'
FROM Xuat x
INNER JOIN Sanpham sp ON sp.masp = x.Masp
WHERE DAY(x.ngayxuat) = 2 AND MONTH(x.ngayxuat) = 9 AND YEAR(x.ngayxuat) = 2018
*/

SELECT sohdn, ngaynhap, tiennhap = soluongN*dongiaN
FROM Nhap
WHERE YEAR(ngaynhap) = 2020;