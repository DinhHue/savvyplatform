create proc sp_KHACHHANG_UpdateField
@idclaim varchar(10), @key nvarchar(50), @value nvarchar(Max)
as
begin
	Declare @SQLQuery as nvarchar(Max)
	
	set @SQLQuery = 'update CHUKY set '+ @key +'=N'''+ @value +''' where ID_Claim=' + @idclaim
	
	EXECUTE sp_executesql @SQLQuery
	
end

alter proc sp_KHACHHANG_UpdateField
@id int, @key nvarchar(50), @value nvarchar(Max)
as
begin
	Declare @SQLQuery as nvarchar(Max)
	
	set @SQLQuery = 'update KHACHHANG set '+ @key +'=N'''+ @value +''' where ID_KhachHang=' + CAST(@id AS NVARCHAR(10))
	
	EXECUTE sp_executesql @SQLQuery
	
end

sp_KHACHHANG_UpdateField 93,'TenKhachHang','TNHH CTY 123'

create proc sp_KhachHang_LayMaClaim
@idclaim varchar(10)
as
begin
	select ID_KhachHang from CLAIM where ID_Claim=@idclaim
end

sp_KhachHang_LayMaClaim '5015'

ALTER proc [dbo].[sp_Claim_SortInsert]
@maclaim varchar(10), @tenclaim nvarchar(50), @madv int,@idgdv int,@maKH int,
@maloaihinhtonthat int,@note nvarchar(300),@dateasigned varchar(20)
as
begin
	insert into CLAIM(ID_Claim,TenClaim,ID_DonVI,ID_GDV1,ID_KhachHang,ID_LoaiHinhTonThat,GhiChuLoaiHinhTonThat,AssignedDate,PUB,ID_GiaiDoanHoanThanh,Rate)
	values(@maclaim,@tenclaim,@madv,@idgdv,@maKH,@maloaihinhtonthat,@note,@dateasigned,1,1,0)
	insert into CHUKY(ID_Claim) values(@maclaim)
end