CREATE DATABASE CTQLSach
drop database CTQLSach
ON
	PRIMARY(
	Name = QLSach_Data,
	Filename= 'D:\PHÁT TRIỂN ỨNG DỤNG\QLSach_Data.mdf',
	size= 20MB, maxsize= 50MB, filegrowth= 1MB)

LOG ON 
(	Name = QLSach_Log,
	Filename= 'D:\PHÁT TRIỂN ỨNG DỤNG\QLSach_Log.ldf',
	size= 10MB, maxsize= 15MB, filegrowth= 1MB)

USE CTQLSach
use master
drop database CTQLSach

 CREATE TABLE NhanVien(
   maNhanVien  NVARCHAR (50) primary key ,
   tenNhanVien NVARCHAR (80) NOT NULL,  
   ngaySinh DATE not null,
   ngayDauLamViec Date not null,
   sdt varchar(12) ,
   email nvarchar(50),
   gioiTinh BIT not null,
   diaChi NVARCHAR (80) not NULL,
   chucVu NVARCHAR (50) NOT NULL

);
CREATE TABLE TaiKhoan(
   maNhanVien NVARCHAR(50) primary key  foreign key references NhanVien(maNhanVien),
   tenDangNhap NVARCHAR (80) NOT NULL,
   matKhau NVARCHAR (50) NOT NULL,
   
);
 CREATE TABLE KhachHang(
   maKhachHang  NVARCHAR (50) primary key,
   tenKhachHang NVARCHAR (80) NOT NULL,  
   sdt varchar(12) NULL,
   diaChi NVARCHAR (80) NULL

);
CREATE TABLE NhaCungCap(
   maNCC NVARCHAR(50) primary key,
   tenNCC NVARCHAR (80) NOT NULL,
   diaChi NVARCHAR (80)  NULL,
   sdt NVARCHAR (50)  NULL,
   email nvarchar(50) null
);
 CREATE TABLE TheLoai(
   maLoai  NVARCHAR (50) primary key,
   tenTheLoai NVARCHAR (80) NOT NULL
);
CREATE TABLE Sach(
   maSach NVARCHAR(10) primary key,
   tenSach NVARCHAR (80) NOT NULL,
   maLoai NVARCHAR (50) NOT NULL foreign key references TheLoai(maLoai),
   donGia money not null,
   namXuatBan int NULL,
   namSanXuat int null,
   maNCC NVARCHAR(50) foreign key references NhaCungCap(maNCC),
   tenTacGia nvarchar(80) not null,
   soLuong int not null
);
 CREATE TABLE HoaDon(
   maHoaDon  NVARCHAR (50) primary key,
   maNhanVien NVARCHAR (50) NOT NULL foreign key references NhanVien(maNhanVien),  
   ngayLapHD DATE not null,
   maKhachHang NVARCHAR (50) foreign key references KhachHang(maKhachHang),
   tongTien money ,
   ghiChu nvarchar(100)

);
 CREATE TABLE CT_HoaDon(
   maHoaDon  NVARCHAR (50) not null ,
   maSach NVARCHAR(10) not null ,
   soLuong int ,
   donGia money,
   thanhTien money

);

ALTER TABLE CT_HoaDon ADD CONSTRAINT CTHD_PK PRIMARY KEY (maHoaDon,maSach);
Alter Table CT_HoaDon add constraint CTHD_FK foreign key (maHoaDon) references HoaDon (maHoaDon)
Alter Table CT_HoaDon add constraint CTHDS_FK foreign key (maSach) references Sach (maSach)
---------
set dateformat dmy
-------------
insert into NhanVien values ('NV001',N'Nguyễn Phi Hoàng','07/11/1999','05/06/2017','088888868','nphoang@gmail.com',1,N'88 Hùng Vương',N'bán hàng')
insert into NhanVien values ('NV002',N'Nguyễn Viết Học','13/01/1994','15/05/2018','0123456789','nvhoc@gmail.com',1,N'93 Hoàng Văn Thụ',N'quản lý')
insert into NhanVien values ('NV003',N'Đoàn Kiều Mỹ Ngọc','02/09/1998','12/11/2017','0868686868','dkmngoc@gmail.com',0,N'61 Đoàn Thị Điểm',N'bán hàng')
insert into NhanVien values ('NV004',N'Nguyễn Phạm Hoàng Long','21/07/1995','04/10/2019','0682328626','nphlong@gmail.com',1,N'34 Hồ Tùng Mậu',N'bán hàng')
insert into NhanVien values ('NV005',N'Đinh Văn Bê','30/12/1990','18/02/2016','0824292382','dvbe@gmail.com',1,N'06 Mạc Đỉnh Chi',N'bán hàng')


insert into TaiKhoan values ('NV001','nphoang','123456')
insert into TaiKhoan values ('NV002','nvhoc','123456')
insert into TaiKhoan values ('NV003','dkmngoc','123456')
insert into TaiKhoan values ('NV004','nphlong','123456')
insert into TaiKhoan values ('NV005','dvbe','123456')

insert into KhachHang values ('KH001',N'Hoàng Thùy Linh','0294724683','56 CMT8')
insert into KhachHang values ('KH002',N'Trịnh Thu Thảo','0327487012',N'74 Bùi Đạt')
insert into KhachHang values ('KH003',N'Nguyễn Văn A','0242401792',N'127 Phan Đình Phùng')
insert into KhachHang values ('KH004',N'Trần Ngọc','0974824992',N'272 Lương Khánh Thiện')
insert into KhachHang values ('Kh005',N'Thái Thị Liễu','029447289284',N'01 Hồ Thị Kỷ')

insert into NhaCungCap values ('NCC001',N'Nhà xuất bản Kim Đồng',N'999 Kỳ Đồng','032943923','kimdong@gmail.com')
insert into NhaCungCap values ('NCC002',N'Nhà xuất bản Thành phố Hồ Chí Minh',N'234 Ba Tháng Hai','093420342','nxbtpHCM@gmail.com')
insert into NhaCungCap values ('NCC003',N'Nhà xuất bản Tuổi trẻ',N'422 Hồ Trọng Hiếu','023947283','tuoitre@gmail.com')
insert into NhaCungCap values ('NCC004',N'Nhà xuất bản giáo dục',N'245 Nam Kỳ Khởi Nghĩa','0823642834','nxbgiaoduc@gmail.com')
insert into NhaCungCap values ('NCC005',N'Nhà xuất bản Tư pháp',N'567 Hùng Vương','0823492386','nxbTuPhap@gmail.com')

insert into TheLoai values ('TL001',N'Thiếu Nhi')
insert into TheLoai values ('TL002',N'Tiểu thuyết')
insert into TheLoai values ('TL003',N'Công nghệ thông tin')
insert into TheLoai values ('TL004',N'Tài chính')
insert into TheLoai values ('TL005',N'Chính trị')


insert into Sach values ('SA001',N'Tôi thấy hoa vàng trên cỏ xanh','TL002',105000,2010,2009,'NCC001',N'Nguyễn Nhật Ánh',100)
insert into Sach values ('SA002',N'Đắc Nhân Tâm','TL002',79000,2016,2016,'NCC002','Dale Carnegie',200)
insert into Sach values ('SA003',N'Nhà giả kim','TL002',89000,2015,2019,'NCC003','Paulo Coelho',250)
insert into Sach values ('SA004',N'Tội ác và hình phạt','TL002',100000,2017,2016,'NCC005','Fyodor Dostoevsky',100)
insert into Sach values ('SA005',N'Dạy con làm giàu','TL004',110000,2016,2016,'NCC004','Robert Kiyosaki',500)

insert into HoaDon values ('HD20201015001','NV001','15/10/2020','KH003',762000,'')
insert into HoaDon values ('HD20211016001','NV003','16/10/2021','KH002',110000,'')
insert into HoaDon values ('HD20211015001','NV001','15/10/2021','KH001',89000,'')
insert into HoaDon values ('HD20211104001','NV003','04/11/2021','KH004',945000,'')
insert into HoaDon values ('HD20211104002','NV003','04/11/2021','KH005',110000,'')


insert into CT_HoaDon values ('HD20201015001','SA001',5,110000,525000)
insert into CT_HoaDon values ('HD20201015001','SA002',3,79000,237000)
insert into CT_HoaDon values ('HD20211016001','SA005',1,110000,110000)
insert into CT_HoaDon values ('HD20211015001','SA003',1,89000,89000)
insert into CT_HoaDon values ('HD20211104001','SA003',5,89000,445000)
insert into CT_HoaDon values ('HD20211104001','SA004',5,100000,500000)
insert into CT_HoaDon values ('HD20211104002','SA005',1,110000,110000)




