
create proc [dbo].[sp_News_ListByGDV] 
@ID_GDV int
as
begin
	select * 
	from NEWS n
	where n.ID_GDVPost=@ID_GDV
	order by n.DateCreated desc
end