/* 2.1
SELECT sx.tenhang, COUNT(DISTINCT sp.masp) as N'Số loại'
FROM Hangsx sx
INNER JOIN Sanpham sp ON sx.mahangsx = sp.mahangsx
GROUP BY sx.tenhang
*/

/* 2.2
SELECT sp.tensp, SUM(n.soluongN*n.dongiaN) as tiennhap
FROM Nhap n
INNER JOIN Sanpham sp ON n.Masp = sp.masp
WHERE YEAR(n.ngaynhap) = '2018'
GROUP BY sp.tensp
*/

/* 2.3
SELECT sp.tensp, SUM(x.soluongX) as tongxuat
FROM Xuat x 
INNER JOIN Sanpham  sp ON x.masp = sp.masp JOIN Hangsx sx ON sx.mahangsx = sp.mahangsx 
WHERE YEAR(ngayxuat) = 2018 AND sx.tenhang = 'Samsung'
GROUP BY SP.masp, SP.tensp
HAVING SUM(soluongX) > 10000 
*/

/* 2.4
SELECT phong , COUNT(DISTINCT gioitinh) AS NVNAM
FROM Nhanvien 
WHERE gioitinh like N'%Nam%'
GROUP BY phong
*/

/* 2.5
SELECT sx.tenhang , SUM(DISTINCT n.soluongN) as Soluongnhap
FROM Hangsx sx 
INNER JOIN Sanpham sp ON sx.mahangsx = sp.mahangsx 
INNER JOIN Nhap n ON sp.masp = n.masp
WHERE YEAR(ngaynhap) = '2018'
GROUP BY tenhang
*/

/* 2.6
SELECT nv.tennv , SUM(sp.giaban * x.soluongX) AS TongXuat
FROM Nhanvien nv 
INNER JOIN Xuat x ON nv.manv = x.manv  
INNER JOIN Sanpham sp ON x.masp = sp.masp
WHERE YEAR(x.ngayxuat) = '2018'
GROUP BY nv.tennv
*/

/* 2.7
SELECT nv.tennv , SUM(n.soluongN * n.dongiaN) AS TongTienNhap
FROM Nhanvien nv
INNER JOIN Nhap n ON nv.manv = n.manv 
INNER JOIN Sanpham sp ON n.masp = sp.masp
WHERE MONTH(n.ngaynhap) = 8 AND YEAR(n.ngaynhap) = '2018'
GROUP BY nv.tennv
HAVING SUM(n.soluongN*n.dongiaN) > 100000
*/

/* 2.8
SELECT sp.tensp 
FROM Sanpham sp
LEFT JOIN Nhap n ON n.masp = sp.masp 
LEFT JOIN Xuat x ON x.masp = sp.masp 
WHERE x.masp IS NULL AND n.masp IS NOT NULL
GROUP BY sp.tensp
*/

/* 2.9
SELECT sp.tensp 
FROM Sanpham sp 
LEFT JOIN Nhap n ON n.masp = sp.masp
LEFT JOIN Xuat x ON x.masp = sp.masp
WHERE YEAR(n.ngaynhap) = 2018 AND YEAR(x.ngayxuat) = 2018
GROUP BY sp.tensp
*/

/* 2.10
SELECT nv.tennv 
FROM Nhap n 
INNER JOIN Xuat x ON n.manv = x.manv
INNER JOIN Nhanvien nv ON nv.manv = n.manv
GROUP BY nv.tennv
*/

/* 2.11
SELECT tennv
FROM Nhanvien nv
JOIN Xuat x ON x.manv = nv.manv 
JOIN Nhap n ON n.manv = nv.manv
WHERE n.manv NOT IN (SELECT DISTINCT manv FROM Nhap) AND x.manv NOT IN (SELECT DISTINCT manv FROM Xuat)
GROUP BY nv.tennv
*/