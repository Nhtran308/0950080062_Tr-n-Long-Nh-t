CREATE PROC cau1_lab8 
(
	@manv nchar(10),
	@tennv nvarchar(20),
	@gioitinh nchar(10),
	@diachi nvarchar(30),
	@sodt nvarchar(20),
	@email nvarchar(30),
	@phong nvarchar(30),
	@flag int
)
AS
BEGIN
	IF (@flag = 0)
		BEGIN
			IF (@gioitinh <> 'Nam' AND @gioitinh <> 'Nữ')
				BEGIN
					SELECT 1 N'Mã Lỗi'
					RETURN
				END
		END
		INSERT INTO Nhanvien (manv, tennv, gioitinh, diachi, sodt, email, phong) 
		VALUES (@manv, @tennv, @gioitinh, @diachi, @sodt, @email, @phong)
		SELECT 0 AS N'Mã Lỗi'
		RETURN
	IF (@flag = 1)
		BEGIN
			IF (@gioitinh <> 'Nam' AND @gioitinh <> 'Nữ')
				BEGIN
					SELECT 1 N'Mã Lỗi'
					RETURN
				END
		END
		UPDATE Nhanvien 
		SET Tennv = @tennv, 
			Gioitinh = @gioitinh, 
			Diachi = @diachi, 
			Sodt = @sodt, 
			email = @email, 
			Phong = @phong
		WHERE manv = @manv
		SELECT 0 N'Mã Lỗi'
		RETURN
END;
GO

CREATE PROC cau2_lab8
(
	@masp nchar(10),
	@tenhang nvarchar(20),
	@tensp nvarchar(20),
	@soluong int,
	@mausac nvarchar(20),
	@giaban money,
	@donvitinh nchar(10),
	@mota nvarchar(MAX),
	@flag int
)
AS
BEGIN
	IF (@flag = 0)
		BEGIN
			IF NOT EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
				BEGIN 
					SELECT 1 AS N'Mã Lỗi'
					RETURN
				END
			IF (@soluong < 0)
				BEGIN
					SELECT 2 AS N'Mã Lỗi'
					RETURN
				END
			INSERT INTO Sanpham (masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota) 
			VALUES (@masp, (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhang), @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
			SELECT 0 AS N'Mã Lỗi'
			RETURN
        END
	IF (@flag = 1)
		BEGIN
			IF NOT EXISTS (SELECT * FROM Hangsx WHERE tenhang = @tenhang)
				BEGIN 
					SELECT 1 AS N'Mã Lỗi'
					RETURN
				END
			IF (@soluong < 0)
				BEGIN
					SELECT 2 AS N'Mã Lỗi'
					RETURN
				END
			UPDATE Sanpham 
			SET mahangsx = (SELECT mahangsx FROM Hangsx WHERE tenhang = @tenhang), 
			tensp = @tenhang, 
			soluong = @soluong, 
			mausac = @mausac,
			giaban = @giaban,
			donvitinh = @donvitinh,
			mota = @mota
			WHERE masp = @masp
			SELECT 0 AS N'Mã Lỗi'
			RETURN
		END
END
GO

CREATE PROC cau3_lab8
(
	@manv nchar(10)
)
 AS
 BEGIN
	IF NOT EXISTS (SELECT * FROM Nhanvien WHERE manv = @manv)
		BEGIN
			SELECT 1 AS N'Mã Lỗi'
			RETURN
		END
		BEGIN TRANSACTION
		DELETE FROM Nhap WHERE manv = @manv
		DELETE FROM Xuat WHERE manv = @manv
		DELETE FROM Nhanvien WHERE Manv = @manv
		IF @@ERROR <> 0
			BEGIN
				ROLLBACK
				SELECT 1 AS N'Mã Lỗi'
				RETURN
			END
		COMMIT
		SELECT 0 AS N'Mã Lỗi'
END
GO

CREATE PROC cau4_lab8
(
	@masp nchar(10)
)
 AS
 BEGIN
	IF NOT EXISTS (SELECT * FROM Sanpham WHERE masp = @masp)
		BEGIN
			SELECT 1 AS N'Mã Lỗi'
			RETURN
		END
		BEGIN TRANSACTION
		DELETE FROM Nhap WHERE masp = @masp
		DELETE FROM Xuat WHERE Masp = @masp
		DELETE FROM Sanpham WHERE masp = @masp
		IF @@ERROR <> 0
			BEGIN
				ROLLBACK
				SELECT 1 AS N'Mã Lỗi'
				RETURN
			END
		COMMIT
		SELECT 0 AS N'Mã Lỗi'
END
GO

CREATE PROC cau5_lab8
(
	@mahangsx nchar(10),
	@tenhang nvarchar(20),
	@diachi nvarchar(30),
	@sodt nvarchar(20),
	@email nvarchar(30)
)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Hangsx WHERE Tenhang = @tenhang)
		BEGIN
			INSERT INTO Hangsx (Mahangsx, Tenhang, Diachi, Sodt, email)
			VALUES (@mahangsx, @tenhang, @diachi, @sodt, @email)
			SELECT 1 AS N'Mã Lỗi'
			RETURN 
		END
	IF EXISTS (SELECT * FROM Hangsx WHERE Tenhang = @tenhang)
	BEGIN
		SELECT 0 AS N'Mã Lỗi'
		RETURN 
	END
END
GO

CREATE PROC cau6_lab8
(
	@sohdn nchar(10),
	@masp nchar(10),
	@manv nchar(10),
	@ngaynhap date,
	@soluong int,
	@dongiaN money
)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Sanpham WHERE masp = @masp)
		BEGIN
			SELECT 1 AS N'Mã Lỗi'
			RETURN
		END
	IF NOT EXISTS (SELECT * FROM Nhanvien WHERE Manv = @manv)
		BEGIN
			SELECT 2 AS N'Mã Lỗi'
			RETURN
		END
	IF EXISTS (SELECT * FROM Nhap WHERE Sohdn = @sohdn)
		UPDATE Nhap
		SET masp = @masp,
			Manv = @manv,
			Ngaynhap = @ngaynhap,
			soluongN = @soluong,
			dongiaN = @dongiaN
		WHERE Sohdn = @sohdn
	ELSE
		INSERT INTO Nhap (Sohdn, Masp, Manv, Ngaynhap, soluongN,dongiaN)
		VALUES (@sohdn, @masp, @manv, @ngaynhap, @soluong, @dongiaN)
		SELECT 0 AS N'Mã Lỗi'
		RETURN
END
GO

CREATE PROC cau7_lab8
(
	@sohdx nchar(10),
	@masp nchar(10),
	@manv nchar(10),
	@ngayxuat date,
	@soluong int
)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Sanpham WHERE masp = @masp)
		BEGIN
			SELECT 1 AS N'Mã Lỗi'
			RETURN
		END
	IF NOT EXISTS (SELECT * FROM Nhanvien WHERE Manv = @manv)
		BEGIN
			SELECT 2 AS N'Mã Lỗi'
			RETURN
		END
	IF @soluong > (SELECT soluong FROM Sanpham WHERE masp = @masp)
		BEGIN
			SELECT 3 AS N'Mã Lỗi'
			RETURN
		END
	IF EXISTS (SELECT * FROM Xuat WHERE Sohdx = @sohdx)
		UPDATE Xuat
		SET masp = @masp,
			Manv = @manv,
			Ngayxuat = @ngayxuat,
			soluongX = @soluong
		WHERE Sohdx = @sohdx
	ELSE
		INSERT INTO Xuat (Sohdx, Masp, Manv, Ngayxuat, soluongX)
		VALUES (@sohdx, @masp, @manv, @ngayxuat, @soluong)
		SELECT 0 AS N'Mã Lỗi'
		RETURN
END
GO