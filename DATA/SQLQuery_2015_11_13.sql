USE [SAVVY]
GO


CREATE TABLE [dbo].[MUC_LUC](
	[ID_Claim] [nvarchar](10) NOT NULL,
	[ClaimType] [nvarchar](10) NOT NULL,
	[JsonValue] [ntext] NULL,
 CONSTRAINT [PK_CLAIM_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ID_Claim] ASC,
	[ClaimType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


--------------store------------
ALTER proc [dbo].[sp_MucLuc_Select]
@ID_Claim nvarchar(10), @ClaimType nvarchar(10)
as
begin
	select * from MUC_LUC where ID_Claim =@ID_Claim and ClaimType=@ClaimType
end
-------------------------------
ALTER proc [dbo].[sp_MucLuc_Insert]
@ID_Claim nvarchar(10), @ClaimType nvarchar(10), @JsonValue as ntext
as
begin
	insert into MUC_LUC(ID_Claim, ClaimType, JsonValue) 
	values(@ID_Claim, @ClaimType, @JsonValue)
end
---------------------------------
ALTER proc [dbo].[sp_MucLuc_Update]
@ID_Claim nvarchar(10), @ClaimType nvarchar(10), @JsonValue as ntext
as
begin
	update MUC_LUC set JsonValue =@JsonValue where ID_Claim = @ID_Claim and ClaimType=@ClaimType
end