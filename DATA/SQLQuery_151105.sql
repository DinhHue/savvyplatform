
ALTER proc [dbo].[sp_Claim_Select_ChuCkyPRPre]
@idclaim varchar(10)
as
begin
	select gdvpr.FullName as TenPreparer, cvpr.TenChucVu as CVPreparer, gdvpr.DienThoai, gdvpr.Email
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