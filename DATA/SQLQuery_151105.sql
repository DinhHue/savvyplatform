
ALTER proc [dbo].[sp_Claim_Select_ChuCkyPRPre]
@idclaim varchar(10)
as
begin
	select gdvpr.FullName as TenPreparer, gdvpr.TenChucVu, gdvpr.DienThoai, gdvpr.Email
	from CLAIM cl, GIAMDINHVIEN gdvpr,  CHUCVU cvpr
	where cl.ID_Claim=@idclaim and cl.ID_GDVPR=gdvpr.ID_GDV
	and gdvpr.ID_ChucVu=cvpr.ID_ChucVu 
	
end


ALTER proc [dbo].[sp_Claim_GeneralInfo]
@idclaim varchar(10)
as
begin
	select cl.ID_Claim,cl.TenClaim,cl.PolicyNo,cl.Effective,cl.NamePolicy,cl.Premises,cl.DOL,lhtt.LoaiHinhTonThat,
	nbh.TenNhaBH,dv.TenDonVi,kh.TenKhachHang,kh.TenNguoiDaiDien,kh.DiaChi,kh.DienThoai,cl.SumInsured,cl.TruMienThuong,cl.KhieuNai,cl.TonThatHopLe,
	cl.DuPhongBoiThuong,cl.BoiThuong,cl.DuPhongTonThat, cl.TruGiaTriThuHoi,cl.NgayBatDauGiamDinh,cl.ILADATE,cl.PRDate,cl.IRDate,cl.FRDate,cl.FFRDate,cl.AssignedDate,
	gd.TenGiaiDoan, cl.Brief,cl.TamUngBoiThuong,TamUngBoiThuongPR,cl.DuPhongTonThatPR,cl.DuPhongTonThatIR
	from CLAIM cl, GIAMDINHVIEN gdv,KHACHHANG kh, GIAIDOAN gd, NHABAOHIEM nbh, DONVIBH dv,LOAIHINHTONTHAT lhtt
	where cl.ID_Claim=@idclaim and cl.ID_GDV1 =gdv.ID_GDV and cl.ID_KhachHang=kh.ID_KhachHang
	and cl.ID_DonVI=dv.ID_DonVi and dv.ID_NhaBH=nbh.ID_NhaBH and cl.ID_LoaiHinhTonThat=lhtt.ID_LoaiHinhTonThat
	and cl.ID_GiaiDoanHoanThanh=gd.ID_GiaiDoanHoanThanh
end


ALTER proc [dbo].[sp_Claim_RePort]
@idclaim varchar(10)
as
begin
select cl.*, kh.*, nbh.*, dv.TenDonVi,dv.DiaChi as DiaChiDV,dv.*, gdv.*, lhtt.*
from CLAIM cl, NHABAOHIEM nbh, DONVIBH dv, KHACHHANG kh, GIAMDINHVIEN gdv, LOAIHINHTONTHAT lhtt
where cl.ID_Claim=@idclaim and cl.ID_DonVI=dv.ID_DonVi and nbh.ID_NhaBH=dv.ID_NhaBH 
and cl.ID_KhachHang=kh.ID_KhachHang and cl.ID_GDV1=gdv.ID_GDV and cl.ID_LoaiHinhTonThat=lhtt.ID_LoaiHinhTonThat
end

ALTER proc [dbo].[sp_Claim_Select_ChuCkyPRCheck]
@idclaim varchar(10)
as
begin
	select gdvprcheck.FullName as TenChecker, gdvprcheck.TenChucVu, gdvprcheck.DienThoai, gdvprcheck.Email
	from CLAIM cl, GIAMDINHVIEN gdvprcheck,  CHUCVU cvprcheck
	where cl.ID_Claim=@idclaim and cl.ID_GDVCheckPR=gdvprcheck.ID_GDV
	and gdvprcheck.ID_ChucVu=cvprcheck.ID_ChucVu 
	
end

sp_Claim_Select_ChuCkyPRCheck '5013'
go
sp_Claim_Select_ChuCkyPRPre '5013'

ALTER proc [dbo].[sp_Info_GiamDoc]
as
begin
	select gdv.FullName as TenGD, gdv.TenChucVu,gdv.DienThoai, gdv.Email
	from GIAMDINHVIEN gdv,  CHUCVU cv
	where gdv.ID_ChucVu=cv.ID_ChucVu and cv.TenChucVu='Managing Director'
end

ALTER proc [dbo].[sp_Claim_Select_ChuCkyIR]
@idclaim varchar(10)
as
begin
	select gdvir.FullName as TenChecker, gdvir.TenChucVu, gdvir.DienThoai, gdvir.Email
	from CLAIM cl, GIAMDINHVIEN gdvir
	where cl.ID_Claim=@idclaim and cl.ID_GDVIR=gdvir.ID_GDV	
	
end

ALTER proc [dbo].[sp_Claim_Select_ChuCkyIRCheck]
@idclaim varchar(10)
as
begin
	select gdvirC.FullName as TenChecker, gdvirC.TenChucVu,gdvirC.DienThoai,gdvirC.Email
	from CLAIM cl, GIAMDINHVIEN gdvirC
	where cl.ID_Claim=@idclaim and cl.ID_GDVIRCheck=gdvirC.ID_GDV
	
	
end

ALTER proc [dbo].[sp_Claim_Select_ChuCkyFR]
@idclaim varchar(10)
as
begin
	select gdvfr.FullName as TenChecker,gdvfr.TenChucVu,gdvfr.DienThoai,gdvfr.Email
	from CLAIM cl, GIAMDINHVIEN gdvfr
	where cl.ID_Claim=@idclaim and cl.ID_GDVFR=gdvfr.ID_GDV
	
end

ALTER proc [dbo].[sp_Claim_Select_ChuCkyFFR]
@idclaim varchar(10)
as
begin
	select gdvffr.FullName as TenChecker,gdvffr.TenChucVu,gdvffr.DienThoai,gdvffr.Email
	from CLAIM cl, GIAMDINHVIEN gdvffr
	where cl.ID_Claim=@idclaim and cl.ID_GDVFFR=gdvffr.ID_GDV
end 


ALTER proc [dbo].[sp_Claim_Select_ChuCkyFFRCheck]
@idclaim varchar(10)
as
begin
	select gdvffrC.FullName as TenChecker,gdvffrC.TenChucVu,gdvffrC.DienThoai,gdvffrC.Email
	from CLAIM cl, GIAMDINHVIEN gdvffrC
	where cl.ID_Claim=@idclaim and cl.ID_GDVCheckFFR=gdvffrC.ID_GDV
	
end

ALTER proc [dbo].[sp_Claim_Select_ChuCkyFRCheck]
@idclaim varchar(10)
as
begin
	select gdvfrC.FullName as TenChecker,gdvfrC.TenChucVu,gdvfrC.DienThoai,gdvfrC.Email
	from CLAIM cl, GIAMDINHVIEN gdvfrC
	where cl.ID_Claim=@idclaim and cl.ID_GDVCheckFR=gdvfrC.ID_GDV 
	
end



alter proc [dbo].[sp_ClaimMau_UpdateField]
@id int, @key nvarchar(50), @value nvarchar(Max)
as
begin
Declare @SQLQuery as nvarchar(Max)
	
	set @SQLQuery = 'update CLAIMMAU set '+ @key +'=N'''+ @value +''' where ID_MC=' + CAST(@id as varchar(10))
	
	EXECUTE sp_executesql @SQLQuery	
	
end

update CLAIMMAU set GioiThieuChungA1='12212 12121 test update' where TypePolicy='EG'

exec sp_ClaimMau_UpdateField 1,'GioiThieuNDBH','Sau cùng, trên cơ sở các đánh giá khách quan về Nguyên'

create proc sp_ClaimMau_SelectType
@type nvarchar(200)
as
begin
	select * from CLAIMMAU where TypePolicy =@type
end