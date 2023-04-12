CREATE FUNCTION cau1_lab6 (@hang NVARCHAR(100))
RETURNS @bang TABLE (
	masp nvarchar(10), tensp nvarchar(20), soluong int, mausac nvarchar(20),
	giaban float, donvitinh nvarchar(10), mota nvarchar(MAX)
)
AS
BEGIN
	INSERT INTO @bang
	SELECT *
	FROM Sanpham sp
	INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
	WHERE @hang = sx.Tenhang
	RETURN 
END;
GO

CREATE FUNCTION cau2_lab6 (@x DATE, @y DATE)
RETURNS @bang TABLE (
	masp nvarchar(10), tensp nvarchar(20), soluong int, mausac nvarchar(20),
	giaban float, donvitinh nvarchar(10), mota nvarchar(MAX), mahangsx nchar(10),
	tenhang nvarchar(20), diachi nvarchar(30), sodt nvarchar(20), email nvarchar(30)
)
AS 
BEGIN
	INSERT INTO @bang
	SELECT sp.masp, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota, sx.Mahangsx, sx.Tenhang,
	sx.Diachi, sx.Sodt, sx.email
	FROM Sanpham sp
	INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
	INNER JOIN Nhap n ON n.Masp = sp.masp
	WHERE n.Ngaynhap BETWEEN @x AND @y
RETURN
END;
GO

CREATE FUNCTION cau3_lab6 (@hang NVARCHAR(100), @op INT)
RETURNS @bang TABLE (
	masp nvarchar(10), tensp nvarchar(20), soluong int, mausac nvarchar(20),
	giaban float, donvitinh nvarchar(10), mota nvarchar(MAX)
)
AS
BEGIN
	INSERT INTO @bang
	SELECT sp.masp, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota
	FROM Sanpham sp
	INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
	WHERE @hang = sx.Tenhang AND (@op = 0 AND sp.soluong = 0) OR (@op = 1 AND sp.soluong >0)
	RETURN 
END;
GO

CREATE FUNCTION cau4_lab6 (@phong nvarchar(30))
RETURNS @bang TABLE (
	manv nchar(10), tennv nvarchar(20), gioitinh nchar(10),
	diachi nvarchar(20), sodt nvarchar(30), email nvarchar(30), phong nvarchar(30)
)
AS
BEGIN
	INSERT INTO @bang
	SELECT *
	FROM Nhanvien 
	WHERE @phong = Phong
	RETURN
END;
GO

CREATE FUNCTION cau5_lab6 (@dchi nvarchar(30))
RETURNS @bang TABLE (
	mahangsx nchar(30), tenhang nvarchar(30), diachi nvarchar(30), sodt nvarchar(30), email nvarchar(30)
)
AS 
BEGIN
	INSERT INTO @bang
	SELECT *
	FROM Hangsx
	WHERE Diachi LIKE @dchi
	RETURN
END;
GO

CREATE FUNCTION cau6_lab6 (@x INT, @y INT)
RETURNS @bang TABLE (
	masp nvarchar(10), tensp nvarchar(20), soluong int, mausac nvarchar(20),
	giaban float, donvitinh nvarchar(10), mota nvarchar(MAX), mahangsx nchar(10),
	tenhang nvarchar(20), diachi nvarchar(30), sodt nvarchar(20), email nvarchar(30)
)
AS 
BEGIN
	INSERT INTO @bang
	SELECT sp.masp, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota, sx.Mahangsx, sx.Tenhang,
	sx.Diachi, sx.Sodt, sx.email
	FROM Sanpham sp
	INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
	INNER JOIN Xuat x ON x.Masp = sp.masp
	WHERE YEAR(x.Ngayxuat) BETWEEN @x AND @y
RETURN
END;
GO

CREATE FUNCTION cau7_lab6 (@hang NVARCHAR(100), @op INT)
RETURNS @bang TABLE (
	masp nvarchar(10), tensp nvarchar(20), soluong int, mausac nvarchar(20),
	giaban float, donvitinh nvarchar(10), mota nvarchar(MAX)
)
AS
BEGIN
	INSERT INTO @bang
	SELECT sp.masp, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp.donvitinh, sp.mota
	FROM Sanpham sp
	INNER JOIN Hangsx sx ON sx.Mahangsx = sp.mahangsx
	INNER JOIN Nhap n ON n.Masp = sp.masp
	INNER JOIN Xuat x ON x.Masp = sp.masp
	WHERE @hang = sx.Tenhang AND (@op = 0 AND n.soluongN > 0) OR (@op = 1 AND (x.soluongX IS NULL OR x.soluongX >= 0))
	RETURN 
END;
GO

CREATE FUNCTION cau8_lab6(@ngay DATE)
RETURNS @bang TABLE (
    manv nchar(10), tennv NVARCHAR(50), ngaynhap DATE, tensp NVARCHAR(50), 
	soluong INT, dongia DECIMAL(18, 2), thanhtien DECIMAL(18, 2)
)
AS
BEGIN
    INSERT INTO @bang
    SELECT nv.manv, nv.tennv, n.ngaynhap, sp.tensp, n.soluongN, n.dongiaN, n.soluongN * n.dongiaN AS thanhtien
    FROM Nhap n
    INNER JOIN Sanpham sp ON n.masp = sp.masp
    INNER JOIN Nhanvien nv ON n.manv = nv.manv
    WHERE n.ngaynhap = @ngay;
    
    RETURN
END;
GO

CREATE FUNCTION cau9_lab6(@x money, @y money, @z NVARCHAR(50))
RETURNS @bang TABLE (
	masp nchar(10),mahangsx nchar(10), tensp nvarchar(20), soluong int, mausac nvarchar(20),
	giaban money, donvitinh nchar(10), mota nvarchar(MAX)
)
AS
BEGIN
    INSERT INTO @bang
    SELECT sp.masp, sp.mahangsx, sp.tensp, sp.soluong, sp.mausac, sp.giaban, sp. donvitinh, sp.mota
    FROM Sanpham sp
    INNER JOIN Hangsx sx ON sp.mahangsx = sx.mahangsx
    WHERE sx.tenhang = @z AND sp.giaban BETWEEN @x AND @y;
    RETURN
END;
GO

CREATE FUNCTION cau10_lab6()
RETURNS @bang TABLE (
    masp NCHAR(10), tensp NVARCHAR(50), hangsx NVARCHAR(50),
    soluong INT, giaban DECIMAL(18, 2), donvitinh NVARCHAR(10)
)
AS
BEGIN
    INSERT INTO @bang
    SELECT sp.masp, sp.tensp, sx.tenhang, sp.soluong, sp.giaban, sp.donvitinh
    FROM Sanpham sp
    INNER JOIN Hangsx sx ON sp.mahangsx = sx.mahangsx;
    RETURN
END;
GO




