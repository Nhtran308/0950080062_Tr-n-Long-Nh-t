﻿CREATE PROC cau1_lab7 
(
@ma nvarchar(10),
@ten nvarchar(20),
@dc	nvarchar(20),
@dt nvarchar(11),
@email nvarchar(30)
)
AS
BEGIN
	IF(EXISTS(SELECT * FROM Hangsx WHERE tenhang = @ten))
		PRINT N'Tên hàng đã tồn tại, mời bạn nhập tên khác!!!'
	ELSE
		INSERT INTO Hangsx VALUES (@ma, @ten, @dc, @dt, @email)
END;
GO

CREATE PROC cau2_lab7 
(
@masp nchar(10),
@mahsx nvarchar(20),
@tensp nvarchar(20),
@sluong int,
@mau nvarchar(20),
@gia money,
@dvtinh nchar(10),
@mota nvarchar(max)	
)
AS
BEGIN
	IF(EXISTS(SELECT * FROM Sanpham WHERE masp = @masp))
		UPDATE Sanpham 
		SET  mahangsx = @mahsx, tensp = @tensp, soluong = @sluong, mausac = @mau,
		giaban = @gia, donvitinh = @dvtinh, mota = @mota
		WHERE @masp = masp
	ELSE
		INSERT INTO Sanpham VALUES (@masp, @mahsx, @tensp, @sluong, @mau, @gia, @dvtinh, @mota)
END;
GO

CREATE PROCEDURE cau3_lab7
    @tenhang NVARCHAR(20)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
    BEGIN
        PRINT N'Ten hang không tồn tại'
    END
    ELSE
    BEGIN
        DELETE FROM SanPham WHERE mahangsx IN (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhang)
        DELETE FROM Hangsx WHERE tenhang = @tenhang
    END
END
GO


CREATE PROCEDURE cau4_lab7
    @manv NCHAR(10),
    @tennv NVARCHAR(20),
    @gioitinh NCHAR(10),
    @diachi NVARCHAR(30),
    @sodt NVARCHAR(20),
    @email NVARCHAR(30),
    @phong NVARCHAR(30),
    @Flag BIT
AS
BEGIN
    IF @Flag = 0
    BEGIN
        UPDATE NhanVien
        SET tennv = @tennv,
            gioitinh = @gioitinh,
            diachi = @diachi,
            sodt = @sodt,
            email = @email,
            phong = @phong
        WHERE manv = @manv
    END
    ELSE
    BEGIN
        INSERT INTO NhanVien (manv, tennv, gioitinh, diachi, sodt, email, phong)
        VALUES (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
    END
END
GO

CREATE PROCEDURE cau5_lab7
    @sohdn NCHAR(10),
    @masp NCHAR(10),
    @manv NCHAR(10),
    @ngaynhap DATE,
    @soluongN INT,
    @dongiaN MONEY
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM SanPham WHERE masp = @masp)
    BEGIN
        PRINT N'mã sản phẩm không tồn tại trong bảng SanPham '
    END
    ELSE IF NOT EXISTS (SELECT * FROM NhanVien WHERE manv = @manv)
    BEGIN
        PRINT N'mã nhân viên không tồn tại trong bảng NhanVien '
    END
    ELSE
    BEGIN
        IF EXISTS (SELECT * FROM Nhap WHERE sohdn = @sohdn)
        BEGIN
            UPDATE Nhap
            SET masp = @masp,
                manv = @manv,
                ngaynhap = @ngaynhap,
                soluongN = @soluongN,
                dongiaN = @dongiaN
            WHERE sohdn = @sohdn
        END
        ELSE
        BEGIN
            INSERT INTO Nhap (sohdn, masp, manv, ngaynhap, soluongN, dongiaN)
            VALUES (@sohdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
        END
    END
END
GO

CREATE PROCEDURE cau6_lab7
    @sohdx NCHAR(10),
    @masp NCHAR(10),
    @manv NCHAR(10),
    @ngayxuat DATE,
    @soluongX INT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM SanPham WHERE masp = @masp)
    BEGIN
        PRINT 'mã sản phẩm không tồn tại trong bảng SanPham '
    END
    ELSE IF NOT EXISTS (SELECT * FROM NhanVien WHERE manv = @manv)
    BEGIN
        PRINT N'mã nhân viên không tồn tại trong bảng NhanVien '
    END
    ELSE IF NOT EXISTS (SELECT * FROM SanPham WHERE masp = @masp AND soluong >= @soluongX)
    BEGIN
        PRINT N'Số lượng xuất lớn hơn số lượng có trong bảng SanPham'
    END
    ELSE
    BEGIN
        IF EXISTS (SELECT * FROM Xuat WHERE sohdx = @sohdx)
        BEGIN
            UPDATE Xuat
            SET masp = @masp,
                manv = @manv,
                ngayxuat = @ngayxuat,
soluongX = @soluongX
            WHERE sohdx = @sohdx
        END
        ELSE
        BEGIN
            INSERT INTO Xuat (sohdx, masp, manv, ngayxuat, soluongX)
            VALUES (@sohdx, @masp, @manv, @ngayxuat, @soluongX)
        END
    END
END
GO

CREATE PROCEDURE cau7_lab7
    @manv NCHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM NhanVien WHERE manv = @manv)
    BEGIN
        PRINT N'Manv không tồn tại'
    END
    ELSE
    BEGIN
        DELETE FROM Nhap WHERE manv = @manv
        DELETE FROM Xuat WHERE manv = @manv
        DELETE FROM NhanVien WHERE manv = @manv
    END
END
GO

CREATE PROCEDURE cau8_lab7
    @masp NCHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM SanPham WHERE masp = @masp)
    BEGIN
        PRINT N'Masp không tồn tại'
    END
    ELSE
    BEGIN
        DELETE FROM Nhap WHERE masp = @masp
        DELETE FROM Xuat WHERE masp = @masp
        DELETE FROM SanPham WHERE masp = @masp
    END
END