--TAO BANG
CREATE DATABASE AS1;
CREATE TABLE PHONGVIEN(
MAPV NVARCHAR(5) NOT NULL PRIMARY KEY,
TENPV NVARCHAR (20),
TUOI TINYINT ,
DIACHI NVARCHAR(20),
MABV NVARCHAR(5) 
)

CREATE TABLE BIENTAPVIEN(
MABTV NVARCHAR(5) NOT NULL PRIMARY KEY ,
TEN NVARCHAR(20) ,
TUOI TINYINT ,
DIACHI NVARCHAR(50) ,
MABCDADUYET NVARCHAR(5)
)
CREATE TABLE BAIVIET(
MABV NVARCHAR(5) NOT NULL PRIMARY KEY ,
MABTV NVARCHAR(5) FOREIGN KEY REFERENCES [dbo].[BIENTAPVIEN]([MABTV]),
MAPV NVARCHAR(5) FOREIGN KEY REFERENCES [dbo].[PHONGVIEN]([MAPV]) ,
TENBAIVIET NVARCHAR(20) ,
NOIDUNG TEXT ,
THELOAI NVARCHAR(20) ,
TENTACGIA NVARCHAR(20) ,
NGAYDANG DATE 
)
CREATE TABLE NGUOIDOC(
MADANGNHAP NVARCHAR(5) NOT NULL PRIMARY KEY,
TEN NVARCHAR(20),
TUOI TINYINT,
MABAIVIETDADOC NVARCHAR(5)  FOREIGN KEY REFERENCES [dbo].[BAIVIET] ([MABV]),
MAPVYEUTHICH NVARCHAR(5) ,
THELOAIYEUTHICH NVARCHAR (20),
)
--CHEN DU LIEU
INSERT INTO [dbo].[PHONGVIEN]([MAPV],[TENPV],[TUOI],[DIACHI],[MABV])
VALUES
('PV001','TRAN THI HUONG',24,'HA NOI','BV001'),
('PV002','TRAN NHU THANH',30,'DA NANG','BV002'),
('PV003','TRAN THI HA',25,'HA NOI','BV003'),
('PV004','TRAN THI DUNG',35,'TP HCM','BV004'),
('PV005','NGUYEN VAN QUYET',25,'LY NHAN','BV005'),
('PV006','VU VAN DAI',25,'NAM DINH','BV006'),
('PV007','TRAN VAN TIEN',42,'HA NAM','BV007'),
('PV008','NGUYEN THI XAM',25,'PHU LY','BV008'),
('PV009','VU THI HA',27,'HA NAM','BV009'),
('PV010','DIEP THAN',30,'BAC NINH','BV010');
INSERT INTO [dbo].[BIENTAPVIEN]([MABTV],[TEN],[TUOI],[DIACHI],[MABCDADUYET])
VALUES
('BTV01','TRAN THANH THUY',18,'HA NOI','BV001'),
('BTV02','NGUYEN THI AN',31,'HA NAM','BV002'),
('BTV03','TRAN THI TOI',21,'NAM DINH','BV003'),
('BTV04','TRAN NHU BANG',25,'PHU LY','BV004'),
('BTV05','TRAN THI HOA',26,'HA NOI','BV005'),
('BTV06','TRAN VAN KY',29,'BAC GIANG','BV006'),
('BTV07','NGUYEN VAN TRAI',41,'BAC NINH','BV007'),
('BTV08','NGUYEN THI NHAN',29,'LY NHAN','BV008'),
('BTV09','TRAN NHU SINH',52,'HA NAM','BV009'),
('BTV10','VO VAN TAI',27,'PHU LY','BV010');
INSERT INTO [dbo].[BAIVIET]([MABV],[MABTV],[MAPV],[TENBAIVIET],[THELOAI],[TENTACGIA],[NGAYDANG])
VALUES
('BV001','BTV01','PV001','TINH YEU QUE HUONG','VAN XUOI','TRAN THI HUONG','2-2-2021')
('BV002','BTV01','PV001','CON DUONG NHO','LICH SU','TRAN THI HUONG','2-3-2021'),
('BV003','BTV02','PV002','NANG','TINH CAM','TRAN NHU THANH','2-12-2021'),
('BV004','BTV02','PV003','GIO XOAY DOI TOI','TINH CAM','TRAN THI HA','2-23-2021'),
('BV005','BTV02','PV003','HUONG VI TINH THAN','TINH CAM','TRAN THI HA','2-24-2021'),
('BV006','BTV03','PV004','HAM OAN','KINH DI','TRAN THI DUNG','3-3-2021'),
('BV007','BTV04','PV005','THAM NHUNG','CHINH TRI','NGUYEN VAN QUYET','3-4-2021'),
('BV008','BTV05','PV006','CHUYEN CON BO','TRUYEN CUOI','VU VAN DAI','3-5-2021'),
('BV009','BTV06','PV007','HON NHAN VA GIA DINH','TINH CAM','VU VAN DAI','3-7-2021'),
('BV010','BTV07','PV008','NGAN VI SAO','TINH CAM','NGUYEN ThI XAM','7-3-2021');
INSERT INTO [dbo].[NGUOIDOC]([MADANGNHAP],[MABAIVIETDADOC],[TEN],[TUOI],[MAPVYEUTHICH],[THELOAIYEUTHICH])
VALUES
('ND001','BV003','TRAN NHU HA',25,'PV005','LICH SU'),
('ND002','BV002','TRAN THU HUONG',30,'PV001','TINH CAM'),
('ND003','BV003','TRAN NHU BANG',21,'PV002','TRUYEN CUOI'),
('ND004','BV004','TRAN THI THO',56,'PV003','CHINH KICH'),
('ND005','BV005','VU VAN TAI',41,'PV009','TINH CAM'),
('ND006','BV006','XUAN MAI',24,'PV004','TINH CAM'),
('ND007','BV007','NHUYEN XUAN TAI',24,'PV003','TINH CAM'),
('ND008','BV008','NGUYEN THI ANH',21,'PV001','TINH CAM'),
('ND009','BV009','NGUYEN ANH',22,'PV009','LICH SU'),
('NV010','BV010','NGUYEN QUAN',30,'PV001','TINH CAM');
--TAO VAN DON GIAN TREN CSDL

SELECT * FROM [dbo].[PHONGVIEN] --- Truy vấn dữ liệu trên một bảng
SELECT * FROM [dbo].[PHONGVIEN]  ---Truy vấn có sử dụng Order by xắp xếp tuổi tangư dần
ORDER BY [TUOI]

SELECT * FROM [dbo].[PHONGVIEN]  --- Truy vấn sử dụng toán tử Like để xem các tên pv bắt đầu bằng v.
WHERE [TENPV] LIKE 'V%'
ORDER BY [TUOI]
--Truy vấn liên quan tới điều kiện về thời gian thời gian đăn vào tháng 3
SELECT * FROM [dbo].[BAIVIET]
WHERE [NGAYDANG] >= '3-1-2021' AND [NGAYDANG] < '4-1-2021'
--Thực hiện các truy vấn lấy dữ liệu từ nhiều bảng trên CSDL đã tạo
--1:Ghép 2 bảng Phóng viên và Bài Viết bằng mã pv  Inner join
SELECT*
FROM [dbo].[BAIVIET] AS B
INNER JOIN [dbo].[PHONGVIEN] AS P
ON B.[MAPV] = P.[MAPV];
--2: Self join ghép cùng 1 bảng để xem ai có cùng nhà văn yêu thích
SELECT *
FROM [dbo].[NGUOIDOC] A ,[dbo].[NGUOIDOC] B
WHERE A.[MAPVYEUTHICH] = B.[MAPVYEUTHICH]
--3: Outer join.Ghép 2 bảng để có hết thông tin cả 2 bảng VỀ PHẦN KHÁC NHAU VÀ GIỐNG NHAU
SELECT * FROM [dbo].[BAIVIET] AS B
FULL OUTER JOIN [dbo].[PHONGVIEN] AS P
ON B.MABV = P.MABV

-- trigger KHI THAY ĐỔI TÊN PHONG VIÊN TRONG BẢNG PHÓNG VIÊN THÌ SẼ THAY ĐỔI TRONG BẢNG BÀI VIẾT
CREATE TRIGGER UPDATE_TENPV
ON [dbo].[PHONGVIEN]
AFTER UPDATE 
AS
BEGIN
	 UPDATE [dbo].[BAIVIET]
	 SET [dbo].[BAIVIET].[TENTACGIA] = (SELECT [TENPV] FROM inserted WHERE [MABV] = [dbo].[BAIVIET].[MABV])
	 WHERE [dbo].[BAIVIET].MAPV = (SELECT [MAPV] FROM deleted WHERE [MABV] = [dbo].[BAIVIET].[MABV])

END
-- tạo stored procedure
--Đổi tên phóng viên truyền tên phóng viên vã mã phóng viên cần đổi
CREATE PROCEDURE DoiTenPhongVien(@TenPV NVARCHAR(20),@MaPV NVARCHAR(5) )
AS
BEGIN
    UPDATE [dbo].[PHONGVIEN]
	SET [TENPV] = @TenPV
	WHERE [MAPV] = @MaPV
END
--tạo function
--Trả về soosbaif viết mà phóng viên đã viết
CREATE  FUNCTION SoBaiViet (@Mapv NVARCHAR(5))
RETURNS INT AS
BEGIN
	RETURN (SELECT count ([MAPV]) as SoBaiViet
	FROM  [dbo].[BAIVIET] 
	WHERE [MAPV] = @Mapv
	GROUP BY [MAPV])
END
--tạo chỉ mục
--TẠO BẢNG ĐỂ TRA TÊN BÀI VIẾT VÀ MÃ BÀI VIẾT 
CREATE INDEX TenBaiViet
ON [dbo].[BAIVIET]([MABV],[TENBAIVIET])
--	Thực hiện tạo transaction
--  Thêm một phóng viên vào bảng
BEGIN TRANSACTION 
    INSERT INTO [dbo].[PHONGVIEN]([MAPV],[TUOI],[MABV],[TENPV],[DIACHI])
	VALUES ('PV011',12,'BV010','NGUYEN XUAN THANH','HA NOI'),
	('PV012',21,'BV010','Nguyen Thi Nhan','thanh hoa')
COMMIT
--	Thực hiện các truy vấn có truy vấn con trên CSDL đã tạ
--   1:Truy vấn dữ liệu sử dụng truy vấn con lấy thong tin của các phóng viên viết thể loại tình cảm
SELECT * FROM [dbo].[PHONGVIEN]
WHERE [MAPV] IN (SELECT [MAPV]
FROM [dbo].[BAIVIET]
WHERE [THELOAI] = 'TINH CAM'
);
--2:Truy vấn sử dụng With.lấy thông tin vphons viên có số tuổi lớn hơn trung bình
WITH Tuoi(TuoiTB) AS 
   (SELECT AVG([TUOI]) FROM [dbo].[PHONGVIEN])
       SELECT * 
	   FROM [dbo].[PHONGVIEN] AS P ,Tuoi
	   WHERE P.TUOI > Tuoi.TuoiTB;
-- Thực hiện các truy vấn có dùng phân nhóm trên CSDL đã tạo
-- 1:Truy vấn dữ liệu sử dụng Group by và Having tím số lượng  người có tuổi bằng nhau
SELECT [TUOI] ,COUNT([TUOI]) AS 'Số người có tuổi băng nhau'
FROM [dbo].[PHONGVIEN]
GROUP BY [TUOI]
HAVING COUNT([TUOI]) > 1
--Thực hiện các truy vấn có sử dụng function tự tạo trên CSDL đã tạo trả về số lượng bài viết của phóng viên 'pv001'
print [dbo].[SoBaiViet]('PV001')


