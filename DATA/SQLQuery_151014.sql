CREATE TABLE [dbo].[CHUKY](
	[ID_Sig] [int] IDENTITY(1,1) NOT NULL,
	[ID_Claim] [varchar](10) NULL,
	[Report] [varchar](10) NULL,
	[DaiDien1] [nvarchar](100) NULL,
	[TenDaiDien1] [nvarchar](100) NULL,
	[ChucVuDaiDien1] [nvarchar](100) NULL,
	[DaiDien2] [nvarchar](100) NULL,
	[TenDaiDien2] [nvarchar](100) NULL,
	[ChucVuDaiDien2] [nvarchar](100) NULL,
	[DaiDien3] [nvarchar](100) NULL,
	[TenDaiDien3] [nvarchar](100) NULL,
	[ChucVuDaiDien3] [nvarchar](100) NULL,
	[DaiDien4] [nvarchar](100) NULL,
	[TenDaiDien4] [nvarchar](100) NULL,
	[ChucVuDaiDien4] [nvarchar](100) NULL
) ON [PRIMARY]

go

create proc sp_CHUKY_Insert
@idclaim varchar(10), @key nvarchar(50), @value nvarchar(Max)
as
begin	
	update CHUKY set @key = @value where ID_Claim= @idclaim	
	
end
go
create proc sp_CHUKY_Select
@idclaim varchar(10)
as
begin
	select * from CHUKY where ID_Claim =@idclaim
end
go
ALTER proc [dbo].[sp_Claim_Select_ChuCkyFFRCheck]
@idclaim varchar(10)
as
begin
	select gdvffrC.FullName as TenChecker, cvffrC.TenChucVu as CVPChecker
	from CLAIM cl, GIAMDINHVIEN gdvffrC,  CHUCVU cvffrC
	where cl.ID_Claim=@idclaim and cl.ID_GDVCheckFFR=gdvffrC.ID_GDV
	and gdvffrC.ID_ChucVu=cvffrC.ID_ChucVu 
	
end