Alter table CLAIM add ID_GDVPR int, ID_GDVCheckPR int, ID_GDVIR int, ID_GDVIRCheck int, 
ID_GDVFR int, ID_GDVCheckFR int,ID_GDVFFR int, ID_GDVCheckFFR int

create proc sp_CLAIM_Update_GDVPR
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVPR = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyPRPre
@idclaim varchar(10)
as
begin
	select gdvpr.FullName as TenPreparer, cvpr.TenChucVu as CVPreparer
	from CLAIM cl, GIAMDINHVIEN gdvpr,  CHUCVU cvpr
	where cl.ID_Claim=@idclaim and cl.ID_GDVPR=gdvpr.ID_GDV
	and gdvpr.ID_ChucVu=cvpr.ID_ChucVu 	
end

create proc sp_CLAIM_Update_GDVPRCheck
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVCheckPR = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyPRCheck
@idclaim varchar(10)
as
begin
	select gdvprcheck.FullName as TenChecker, cvprcheck.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvprcheck,  CHUCVU cvprcheck
	where cl.ID_Claim=@idclaim and cl.ID_GDVPR=gdvprcheck.ID_GDV
	and gdvprcheck.ID_ChucVu=cvprcheck.ID_ChucVu 
	
end

create proc sp_CLAIM_Update_GDVIR
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVIR = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyIR
@idclaim varchar(10)
as
begin
	select gdvir.FullName as TenChecker, cvir.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvir,  CHUCVU cvir
	where cl.ID_Claim=@idclaim and cl.ID_GDVIR=gdvir.ID_GDV
	and gdvir.ID_ChucVu=cvir.ID_ChucVu 
	
end

create proc sp_CLAIM_Update_GDVIRCheck
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVIRCheck = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyIRCheck
@idclaim varchar(10)
as
begin
	select gdvirC.FullName as TenChecker, cvirC.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvirC,  CHUCVU cvirC
	where cl.ID_Claim=@idclaim and cl.ID_GDVIRCheck=gdvirC.ID_GDV
	and gdvirC.ID_ChucVu=cvirC.ID_ChucVu 
	
end

go

create proc sp_CLAIM_Update_GDVFR
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVFR = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyFR
@idclaim varchar(10)
as
begin
	select gdvfr.FullName as TenChecker, cvfr.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvfr,  CHUCVU cvfr
	where cl.ID_Claim=@idclaim and cl.ID_GDVFR=gdvfr.ID_GDV
	and gdvfr.ID_ChucVu=cvfr.ID_ChucVu 
	
end

create proc sp_CLAIM_Update_GDVFRCheck
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVCheckFR = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyFRCheck
@idclaim varchar(10)
as
begin
	select gdvfrC.FullName as TenChecker, cvfrC.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvfrC,  CHUCVU cvfrC
	where cl.ID_Claim=@idclaim and cl.ID_GDVCheckFR=gdvfrC.ID_GDV
	and gdvfrC.ID_ChucVu=cvfrC.ID_ChucVu 
	
end

go 

create proc sp_CLAIM_Update_GDVFFR
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVFFR = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyFFR
@idclaim varchar(10)
as
begin
	select gdvffr.FullName as TenChecker, cvffr.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvffr,  CHUCVU cvffr
	where cl.ID_Claim=@idclaim and cl.ID_GDVFFR=gdvffr.ID_GDV
	and gdvffr.ID_ChucVu=cvffr.ID_ChucVu 
	
end

create proc sp_CLAIM_Update_GDVFFRCheck
@idclaim varchar(10),@idgdv int
as
begin
	Update CLAIM set ID_GDVCheckFFR = @idgdv where ID_Claim=@idclaim
end

create proc sp_Claim_Select_ChuCkyFFRCheck
@idclaim varchar(10)
as
begin
	select gdvffrC.FullName as TenChecker, cvffrC.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvffrC,  CHUCVU cvffrC
	where cl.ID_Claim=@idclaim and cl.ID_GDVCheckFR=gdvffrC.ID_GDV
	and gdvffrC.ID_ChucVu=cvffrC.ID_ChucVu 
	
end



-- ngay 28/08/2015

alter proc sp_Tracking_Insert
@idgdv int, @timeac datetime, @diengia nvarchar(max),@idclaim varchar(10)
as
begin
	insert into TRACKING (TimeReal,ID_GDV,ActionDes,ID_Claim) values(@timeac,@idgdv,@diengia,@idclaim)
end

alter proc sp_Tracking_Select_Date
@date datetime 
as
begin
	select * from TRACKING t, GIAMDINHVIEN gdv where CONVERT(CHAR(10),t.TimeReal,120) = @date and t.ID_GDV=gdv.ID_GDV order by t.ID_Tracking asc
end

create proc sp_Tracking_selectAll
as
begin
	select * from TRACKING t, GIAMDINHVIEN gdv where t.ID_GDV=gdv.ID_GDV
end


alter proc sp_Tracking_select_Case
@idclaim varchar(10),@date datetime
as
begin
	select * from TRACKING t, GIAMDINHVIEN gdv where t.ID_GDV=gdv.ID_GDV and t.ID_Claim=@idclaim and CONVERT(CHAR(10),t.TimeReal,120)=@date 
	order by t.ID_Tracking asc
end

alter proc sp_Tracking_SelectDateCase
@idclaim varchar(10)
as
begin
	select distinct(CONVERT(CHAR(10),TimeReal,120)) as Ngay from TRACKING where ID_Claim=@idclaim
end

select CONVERT(CHAR(10),TimeReal,120) from TRACKING

alter proc sp_Claim_GeneralInfo
@idclaim varchar(10)
as
begin
	select cl.ID_Claim,cl.TenClaim,cl.PolicyNo,cl.Effective,cl.TypePolicy,cl.Premises,cl.DOL,lhtt.LoaiHinhTonThat,
	nbh.TenNhaBH,dv.TenDonVi,kh.TenKhachHang,kh.TenNguoiDaiDien,kh.DiaChi,kh.DienThoai,cl.SumInsured,cl.TruMienThuong,cl.KhieuNai,cl.TonThatHopLe,
	cl.DuPhongBoiThuong,cl.BoiThuong, cl.TruGiaTriThuHoi,cl.NgayBatDauGiamDinh,cl.ILADATE,cl.PRDate,cl.IRDate,cl.FRDate,cl.FFRDate,cl.AssignedDate,
	gd.TenGiaiDoan, cl.Brief
	from CLAIM cl, GIAMDINHVIEN gdv,KHACHHANG kh, GIAIDOAN gd, NHABAOHIEM nbh, DONVIBH dv,LOAIHINHTONTHAT lhtt
	where cl.ID_Claim=@idclaim and cl.ID_GDV1 =gdv.ID_GDV and cl.ID_KhachHang=kh.ID_KhachHang
	and cl.ID_DonVI=dv.ID_DonVi and dv.ID_NhaBH=nbh.ID_NhaBH and cl.ID_LoaiHinhTonThat=lhtt.ID_LoaiHinhTonThat
end


alter proc sp_KhachHang_Search
@key varchar(50)
as
begin
	select cl.ID_Claim,cl.TenClaim,kh.TenKhachHang, cl.Brief,gd.TenGiaiDoan,cl.Follower from CLAIM cl, KHACHHANG kh, GIAIDOAN gd 
	where FREETEXT(kh.TenKhachHang,@key) and cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GiaiDoanHoanThanh =gd.ID_GiaiDoanHoanThanh
end

exec sp_KhachHang_Search 'Tiệp'

alter proc sp_Claim_SearchLoaiHinhTT
@key varchar(50)
as
begin
	select cl.ID_Claim,cl.TenClaim,kh.TenKhachHang, cl.Brief,gd.TenGiaiDoan,cl.Follower from CLAIM cl, KHACHHANG kh, GIAIDOAN gd,LOAIHINHTONTHAT lhtt 
	where FREETEXT(lhtt.LoaiHinhTonThat,@key) and cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GiaiDoanHoanThanh =gd.ID_GiaiDoanHoanThanh and cl.ID_LoaiHinhTonThat=lhtt.ID_LoaiHinhTonThat
end

exec sp_Claim_SearchLoaiHinhTT 'Cháy, nổ'
alter proc dbo.sp_Claim_SearchPolicy
@key varchar(50)
as
begin
	select cl.ID_Claim,cl.TenClaim,kh.TenKhachHang, cl.Brief,gd.TenGiaiDoan,cl.Follower from CLAIM cl, KHACHHANG kh, GIAIDOAN gd
	where FREETEXT(cl.NamePolicy,@key) and cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GiaiDoanHoanThanh =gd.ID_GiaiDoanHoanThanh 
end

create proc sp_Claim_SearchBrief
@key varchar(50)
as
begin
	select cl.ID_Claim,cl.TenClaim,kh.TenKhachHang, cl.Brief,gd.TenGiaiDoan,cl.Follower from CLAIM cl, KHACHHANG kh, GIAIDOAN gd
	where FREETEXT(cl.Brief,@key) and cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GiaiDoanHoanThanh =gd.ID_GiaiDoanHoanThanh 
end

select NamePolicy from CLAIM 

exec sp_Claim_SearchBrief 'sét đánh'

Select ID_Claim,TenClaim, NamePolicy from CLAIM where FREETEXT(NamePolicy,N'Quy tac xay dung')

create proc sp_Claim_SearchDKBS
@key varchar(50)
as
begin
	select cl.ID_Claim,cl.TenClaim,kh.TenKhachHang, cl.Brief,gd.TenGiaiDoan,cl.Follower from CLAIM cl, KHACHHANG kh, GIAIDOAN gd
	where FREETEXT(cl.DKBS,@key) and cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GiaiDoanHoanThanh =gd.ID_GiaiDoanHoanThanh 
end

create proc sp_Claim_SearchAll
@key varchar(50)
as
begin
	select cl.ID_Claim,cl.TenClaim,kh.TenKhachHang, cl.Brief,gd.TenGiaiDoan,cl.Follower from CLAIM cl, KHACHHANG kh, GIAIDOAN gd
	where FREETEXT(cl.*,@key) and cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GiaiDoanHoanThanh =gd.ID_GiaiDoanHoanThanh 
end

exec sp_Claim_SearchAll 'sét đánh'

-- script ngay 22-09-2015
create proc sp_SitePhoto_Insert
@idclaim varchar(10),@diengiai nvarchar(300), @link varchar(300)
as
begin
	insert into SitePhoto(ID_Claim, DienGiai, LinkHinh) 
	values(@idclaim,@diengiai,@link)
end

create proc sp_SitePhoto_Select
@idclaim varchar(10)
as
begin
	select * from SitePhoto where ID_Claim=@idclaim
end

exec sp_SitePhoto_Select '4011'