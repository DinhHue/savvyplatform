--------------------------------------
--------function----------------------

create FUNCTION [dbo].[fnSplitString] ( @stringToSplit NVARCHAR(MAX) )
RETURNS
 @returnList TABLE ([Name] [nvarchar] (500))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(',', @stringToSplit) > 0
 BEGIN
	  SET @pos  = CHARINDEX(',', @stringToSplit)  
	  SET @name = SUBSTRING(@stringToSplit, 1, @pos-1)

	  INSERT INTO @returnList 
	  SELECT @name

	  SET @stringToSplit = LTRIM(RTRIM( SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)))
 END

 INSERT INTO @returnList
 SELECT @stringToSplit

 RETURN
END


--------Store--------------------------
create proc [dbo].[sp_TypeNews_List] 
as
begin
	select * from TYPENEWS
end
---------------------------------------
Create proc [dbo].[sp_TypeNews_ID] 
@id nvarchar(200)
as
begin
	select * from TYPENEWS
	where ID_Type like @id
end
---------------------------------------
alter proc [dbo].[sp_News_Create] 
@Title nvarchar(200), @LinkImages nvarchar(100), @Brief nvarchar(500), @Contents nvarchar(MAX), 
@DateCreated datetime, @DateModified datetime, @ID_GDVPost int, @ID_GDVEdit int, @ID_Types nvarchar(250)
as
begin
	insert into NEWS(Title, LinkImages, Brief, Contents, DateCreated, DateModified, ID_GDVPost, ID_GDVEdit, ID_Types) 
	values(@Title, @LinkImages, @Brief, @Contents, @DateCreated, @DateModified, @ID_GDVPost, @ID_GDVEdit, @ID_Types)
end
---------------------------------------
create proc [dbo].[sp_News_Get_ID] 
@ID_News int
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
		and ID_News=@ID_News
	order by n.DateCreated desc
end
----------------------------------------
alter proc [dbo].[sp_News_List] 
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
	order by n.DateCreated desc
end
-----------------------------------------
create proc [dbo].[sp_News_List_Comment] 
@idNews int
as
begin
	select cm.*, gdv.Email, gdv.TenGDV from COMMENT cm, GIAMDINHVIEN gdv
	where cm.ID_GDV = gdv.ID_GDV
		and cm.ID_News = @idNews
end
-----------------------------------------
create proc [dbo].[sp_News_List_Hot] 
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
	and n.Hot > 0
	order by n.Hot desc, n.DateCreated desc
end
------------------------------------------
create proc [dbo].[sp_News_List_Hot_Limit] 
@number int
as
begin
	select top(@number) n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
	and n.Hot > 0
	order by n.Hot desc, n.DateCreated desc
end
------------------------------------------
create proc [dbo].[sp_News_List_Limit]
@number int 
as
begin
	select top(@number) n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
	order by n.DateCreated desc
end
------------------------------------------
create proc [dbo].[sp_News_List_MostView] 
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
	order by n.Views desc, n.DateCreated desc
end
-------------------------------------------
create proc [dbo].[sp_News_List_MostViewHot] 
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
	and n.Hot > 0
	order by n.Views desc, n.DateCreated desc
end
--------------------------------------------
create proc [dbo].[sp_News_List_MostViewHot_Limit] 
@number int
as
begin
	select top(@number) n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit 
	from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
	and n.Hot > 0
	order by n.Views desc, n.DateCreated desc
end
---------------------------------------------
alter proc [dbo].[sp_News_List_Search] 
@keyword nvarchar(100)
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
		and ( n.Title like N'%'+ @keyword +'%' OR n.Brief like N'%'+ @keyword +'%' )
	order by n.DateCreated desc
end
---------------------------------------------
create proc [dbo].[sp_News_List_Type] 
@ID_News int
as
begin
	DECLARE @strType NVARCHAR(500)
	set @strType = (SELECT  N.ID_Types  FROM NEWS N WHERE N.ID_News = @ID_News)
	
	SELECT * FROM TYPENEWS T
	WHERE T.ID_Type IN ( SELECT * FROM fnSplitString(@strType))
end
----------------------------------------------
create proc [dbo].[sp_News_ListByType] 
@ID_Type nvarchar(200)
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  
	from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
		and @ID_Type IN ( SELECT * FROM dbo.fnSplitString(n.ID_Types))
	order by n.DateCreated desc
end
-----------------------------------------------
create proc [dbo].[sp_News_PostComment]
@ID_News int, @ID_GDV int, @TimeComment datetime, @Comments nvarchar(max)
as
begin
	insert into COMMENT(ID_News, ID_GDV, TimeComment, Comments)
	values(@ID_News, @ID_GDV, @TimeComment, @Comments)
end
------------------------------------------------
create proc [dbo].[sp_News_SearchByType] 
@ID_Type nvarchar(200), @keyword nvarchar(100)
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  
	from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
		and @ID_Type IN ( SELECT * FROM dbo.fnSplitString(n.ID_Types))
		and ( n.Title like N'%'+ @keyword +'%' OR n.Brief like N'%'+ @keyword +'%' ) 
	order by n.DateCreated desc
end
------------------------------------------------
alter proc [dbo].[sp_News_Update] 
@ID_News int, @Title nvarchar(200), @LinkImages nvarchar(200),@Views int, @Hot int, @Brief nvarchar(500), @Contents nvarchar(MAX), 
 @DateModified datetime, @ID_GDVEdit int, @ID_Types nvarchar(250)
as
begin
	update NEWS set Title = @Title, LinkImages = @LinkImages, Views=@Views, Hot=@Hot, Brief=@Brief, Contents=@Contents, DateModified=@DateModified
	, ID_GDVEdit=@ID_GDVEdit, ID_Types=@ID_Types
	where ID_News=@ID_News
end
------------------------------------------------
create proc [dbo].[sp_News_UpdateComment]
@ID_Comment int,
@ID_News int, @ID_GDV int, @TimeComment datetime, @Comments nvarchar(max)
as
begin
	update COMMENT
	set ID_News=@ID_News, ID_GDV=@ID_GDV, TimeComment=@TimeComment, Comments=@Comments
	where ID_Comment=@ID_Comment
end
------------------------------------------------

update NEWS set Hot=1