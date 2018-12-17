USE master
drop database QUIZ 
CREATE DATABASE QUIZ
USE QUIZ
CREATE TABLE TaiKhoan
(
TenDangNhap nvarchar(32) not null primary key,
MatKhau nvarchar(32),
HoTen nvarchar(50),
GioiTinh nvarchar(3),
NgaySinh datetime
)

CREATE TABLE Quyen
(
QuyenID int not null primary key,
TenQuyen nvarchar(30)
)

CREATE TABLE QuyenTaiKhoan(
QuyenID int,
TenDangNhap nvarchar(32)
)

CREATE TABLE MonThi(
MonThiID int not null primary key,
TenMonThi nvarchar (30)
)

CREATE TABLE CauHoi(
MonThiID int,
BoDeID int,
CauHoiID int not null primary key identity(1,1),
CauHoi nvarchar (100),
A nvarchar (100),
B nvarchar (100),
C nvarchar (100),
D nvarchar (100),
DapAnDung nvarchar (1)
)
--ALTER TABLE CauHoi
--ADD BoDeID int

CREATE TABLE BaiThi(
BaiThiID int not null primary key identity(1,1),
NgayThi datetime,
TenDangNhap nvarchar(32),
CauHoiID int,
DapAnChon nvarchar(1),
SoCau int
)

CREATE TABLE BoDe(
BoDeID int not null primary key identity(1,1),
TenDangNhap nvarchar (32),
MonThiID int,
NgayTao datetime
)

ALTER TABLE QuyenTaiKhoan
ADD CONSTRAINT TK_Quyen FOREIGN KEY (QuyenID) REFERENCES Quyen(QuyenID)
ALTER TABLE QuyenTaiKhoan
ADD CONSTRAINT Quyen_TK FOREIGN KEY (TenDangNhap) REFERENCES TaiKhoan(TenDangNhap)

ALTER TABLE CauHoi
ADD CONSTRAINT MonThi_CauHoi FOREIGN KEY (MonThiID) REFERENCES MonThi(MonThiID)

ALTER TABLE BaiThi
ADD CONSTRAINT TK_BaiThi FOREIGN KEY (TenDangNhap) REFERENCES TaiKhoan (TenDangNhap)

ALTER TABLE BaiThi
ADD CONSTRAINT CauHoi_BaiThi FOREIGN KEY (CauHoiID) REFERENCES CauHoi (CauHoiID)

ALTER TABLE CauHoi
ADD CONSTRAINT CauHoi_BoDe FOREIGN KEY (BoDeID) REFERENCES BoDe(BoDeID) 

ALTER TABLE BoDe
ADD CONSTRAINT BoDe_TK FOREIGN KEY (TenDangNhap) REFERENCES TaiKhoan(TenDangNhap)

ALTER TABLE BoDe
ADD CONSTRAINT BoDe_Mon FOREIGN KEY (MonThiID) REFERENCES MonThi(MonThiID)

--ALTER TABLE BaiThi
--ADD SoCau int
----------------------------------------PROCEDURE-------------------------------------------------------
------Tim tai khoan----
CREATE PROC FindAcount
@TenDangNhap nvarchar (32),@MatKhau nvarchar(32)
AS
SELECT COUNT(*) 
From TaiKhoan
Where TenDangNhap  = @TenDangNhap
And MatKhau = @MatKhau
--------------------------------------------------------------------------
CREATE PROC CreateAccount
@TenDangNhap nvarchar(32),@MatKhau nvarchar(32), @HoTen nvarchar(50),@GioiTinh nvarchar(3),@NgaySinh datetime
AS
INSERT INTO TaiKhoan VALUES(@TenDangNhap,@MatKhau,@HoTen,@GioiTinh,@NgaySinh)
----------------------------------------------------------
CREATE PROC InsertBoDe
@TenDangNhap nvarchar (32),
@MonThiID int,
@NgayTao datetime
AS
INSERT INTO BoDe VALUES (@TenDangNhap,@MonThiID,@NgayTao)
-------------------------------------------
drop proc GetBoDeID 
CREATE PROC GetBoDeID
@TenDangNhap nvarchar(32)
AS
select Top 1 BoDeID,NgayTao,MonThi.TenMonThi,MonThi.MonThiID
from BoDe inner join MonThi on BoDe.MonThiID=MonThi.MonThiID
where TenDangNhap=@TenDangNhap
order by BoDeID ASC

----------------------------------------------------
CREATE PROC MonThiDDL
AS
SELECT * FROM MonThi
------------------------------------------------------------------------------
drop proc InsertCauHoi
CREATE PROC InsertCauHoi
@MonThiID int,
@BoDeID int,
@CauHoi nvarchar (100),
@A nvarchar (100),
@B nvarchar (100),
@C nvarchar (100),
@D nvarchar (100),	
@DapAnDung nvarchar (1)
AS
INSERT INTO CauHoi VALUES(@MonThiID,@BoDeID,@CauHoi,@A,@B,@C,@D,@DapAnDung)
INSERT INTO CauHoi VALUES(5,1,'2sada','á','d','á','a','a')
----------------------------------------------------
drop proc FindBoDeByUser2
CREATE PROC FindBoDeByUser
@TenDangNhap nvarchar (32),
@MonThiID int
AS
SELECT BoDeID as [ID], TenDangNhap as [Tên đăng nhập], MonThi.TenMonThi as [Môn học], NgayTao as[Thời gian tạo] 
From BoDe inner join MonThi on BoDe.MonThiID= MonThi.MonThiID
Where TenDangNhap=@TenDangNhap
AND MonThi.MonThiID=@MonThiID
Order By NgayTao DESC

----------------------------------------
CREATE PROC FindBoDeByUser2
@TenDangNhap nvarchar (32),
@MonThiID int
AS
SELECT BoDeID as [ID], TenDangNhap as [Tên đăng nhập], MonThi.TenMonThi as [Môn học], NgayTao as[Thời gian tạo] 
From BoDe inner join MonThi on BoDe.MonThiID= MonThi.MonThiID
Where TenDangNhap=@TenDangNhap
AND MonThi.MonThiID=@MonThiID
Order By NgayTao DESC

----------------------------------------------------
DROP PROC FindCauHoiByMaDe
CREATE PROC FindCauHoiByMaDe
@MaDeID int
AS
SELECT * from BoDe inner join CauHoi ON BoDe.BoDeID=CauHoi.BoDeID
WHERE BoDe.BoDeID=@MaDeID
------------------------------------------
drop proc ShowCauHoiByMaDe
CREATE PROC ShowCauHoiByMaDe
@BoDeID int
AS
SELECT*FROM CauHoi
WHERE BoDeID=@BoDeID

------------------------------------------------
CREATE PROC EditCauHoiByID
@CauHoiID int,
@CauHoi nvarchar (100),
@A nvarchar (100),
@B nvarchar (100),
@C nvarchar (100),
@D nvarchar (100),
@DapAnDung nvarchar (1)
AS
UPDATE CauHoi
SET CauHoi=@CauHoi,
A=@A,
B=@B,
C=@C,
D=@D,
DapAnDung=@DapAnDung
WHERE CauHoiID=@CauHoiID

----------------------------------------------------
CREATE PROC ShowCauHoiByID 
@CauHoiID int
AS
SELECT*From CauHoi inner join MonThi ON CauHoi.MonThiID=MonThi.MonThiID
WHERE CauHoiID=@CauHoiID
----------------------------------------------------
DROP PROC SelectQuyen
CREATE PROC SelectQuyen
@TenDangNhap nvarchar(32)
AS
SELECT TOP 1 QuyenID
FROM QuyenTaiKhoan
WHERE TenDangNhap=@TenDangNhap
ORDER BY QuyenID 























select Top 1 BoDeID,NgayTao,MonThi.TenMonThi,MonThi.MonThiID
from BoDe inner join MonThi on BoDe.MonThiID=MonThi.MonThiID
where TenDangNhap='admin'
order by BoDeID Desc




SELECT COUNT(CauHoiID) [Số Lượng] FROM CauHoi
WHERE BoDeID IN
(SELECT BoDeID FROM BoDe WHERE TenDangNhap = 'admin')

SELECT * from BoDe inner join CauHoi ON BoDe.BoDeID=CauHoi.BoDeID
WHERE BoDe.BoDeID='15'



