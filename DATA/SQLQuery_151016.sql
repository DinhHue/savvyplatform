create proc sp_Info_GiamDoc
as
begin
	select gdv.FullName as TenGD, cv.TenChucVu as CVGD
	from GIAMDINHVIEN gdv,  CHUCVU cv
	where gdv.ID_ChucVu=cv.ID_ChucVu and cv.TenChucVu='Managing Director'
end



sp_KhachHang_Search N'ĐÔNG PHƯƠNG'

SELECT cl.ID_Claim,cl.TenClaim,kh.TenKhachHang, cl.Brief,gd.TenGiaiDoan,cl.Follower 
FROM CLAIM cl, KHACHHANG kh, GIAIDOAN gd 
WHERE FREETEXT(kh.TenKhachHang,'ĐÔNG PHƯƠNG')and cl.ID_KhachHang=kh.ID_KhachHang 
and cl.ID_GiaiDoanHoanThanh =gd.ID_GiaiDoanHoanThanh