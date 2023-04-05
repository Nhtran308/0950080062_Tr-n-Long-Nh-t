CREATE FUNCTION cau1_lab5 (@masp NCHAR(10))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @tenhang NVARCHAR(20)
    SELECT @tenhang = sx.tenhang 
	FROM Hangsx sx
    INNER JOIN Sanpham sp ON sp.mahangsx = sx.mahangsx 
    WHERE sp.masp = @masp
    RETURN @tenhang
END;
GO

CREATE FUNCTIOn cau2_lab5 (@x INT, @y INT)
RETURNS INT
AS
BEGIN
	DECLARE @tong INT
	SELECT @tong = SUM(n.soluongN * n.dongiaN)
	FROM Nhap n
	WHERE YEAR(n.Ngaynhap) BETWEEN @x AND @y
	RETURN @tong
END;
GO

CREATE FUNCTION cau3_lab5 (@x nvarchar(20), @y int)
RETURNS INT
AS
BEGIN
	DECLARE @Tong INT

	SELECT @Tong = SUM(n.soluongN) - SUM(x.soluongX)
	FROM Sanpham sp
	INNER JOIN Nhap n on sp.masp = n.masp
	INNER JOIN Xuat x ON sp.masp = x.masp
	WHERE sp.tensp = @x AND YEAR(x.ngayxuat) = @y
	RETURN @Tong
END;
GO

CREATE FUNCTION cau4_lab5 (@x DATE, @y DATE)
RETURNS INT
AS
BEGIN
	DECLARE @tong INT
	SELECT @tong = SUM(n.soluongN * n.dongiaN)
	FROM Nhap n
	WHERE n.Ngaynhap BETWEEN @x AND @y
	RETURN @tong
END;
GO

CREATE FUNCTION cau5_lab5 (@x INT, @A NVARCHAR(20))
RETURNS INT
AS
BEGIN
	DECLARE @tong INT
	SELECT @tong = SUM(x.soluongX * sp.giaban)
	FROM Xuat x
	INNER JOIN Sanpham sp ON sp.masp = x.Masp
	INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
	WHERE sx.Tenhang = @A AND YEAR(x.Ngayxuat) = @x
	RETURN @tong
END;
GO

CREATE FUNCTION cau6_lab5 (@p nvarchar(30))
RETURNS INT
AS 
BEGIN
	DECLARE @tong INT
	SELECT @tong = COUNT(nv.Manv)
	FROM Nhanvien nv
	WHERE nv.Phong = @p
	RETURN @tong
END;
GO

CREATE FUNCTION cau7_lab5 (@x NVARCHAR(20), @y DATE)
RETURNS INT
AS
BEGIN
	DECLARE @tong INT
	SELECT @tong = SUM(x.soluongX)
	FROM Xuat x
	INNER JOIN Sanpham sp ON sp.masp = x.Masp
	WHERE sp.tensp = @x AND x.Ngayxuat = @y
	RETURN @tong
END;
GO

CREATE FUNCTION cau8_lab5 (@x NCHAR(10))
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @sdt NVARCHAR(20)
	SELECT @sdt = nv.Sodt
	FROM Nhanvien nv
	INNER JOIN Xuat x ON x.Manv = nv.Manv
	INNER JOIN Sanpham sp ON sp.masp = x.Masp
	WHERE @x = x.Sohdx
	RETURN @sdt
END;
GO

CREATE FUNCTION cau9_lab5 (@x nvarchar(20), @y int)
RETURNS INT
AS
BEGIN
	DECLARE @Tong INT

	SELECT @Tong = SUM(n.soluongN) - SUM(x.soluongX)
	FROM Sanpham sp
	INNER JOIN Nhap n on sp.masp = n.masp
	INNER JOIN Xuat x ON sp.masp = x.masp
	WHERE sp.tensp = @x AND YEAR(x.ngayxuat) = @y
	RETURN @Tong
END;
GO

CREATE FUNCTION cau10_lab5 (@hang NVARCHAR(20))
RETURNS INT
AS
BEGIN
	DECLARE @tong INT
	SELECT @tong = SUM(sp.soluong)
	FROM Sanpham sp
	INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
	WHERE sx.Tenhang = @hang 
	RETURN @tong
END;
GO

SELECT dbo.cau5_lab5 (2020,'Samsung') AS 'Tổng số lượng sản phẩm'
