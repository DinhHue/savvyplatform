-------------------------------------------------

create proc [dbo].[sp_News_Search_YearMonth] 
@year int, @month int
as
begin
	select n.*, gdv1.TenGDV as Ten_GDVPost, gdv2.TenGDV as Ten_GDVEdit  from NEWS n, GIAMDINHVIEN gdv1, GIAMDINHVIEN gdv2
	where n.ID_GDVPost=gdv1.ID_GDV and n.ID_GDVEdit=gdv2.ID_GDV
		and YEAR(n.DateCreated)=@year
		and MONTH(n.DateCreated)=@month
	order by n.DateCreated desc
end

--------------------------------------------------
alter proc [dbo].[sp_News_GroupByYear] 
as
begin
	select YEAR( N.DateCreated ) as 'Year', COUNT(*)as 'Count'
	from NEWS N
	group by YEAR( N.DateCreated )
	order by YEAR( N.DateCreated ) desc
end

--------------------------------------------------
ALTER proc [dbo].[sp_News_GroupByYearMonth] 
@year int
as
begin
	select YEAR(N.DateCreated) as 'Year', MONTH( N.DateCreated ) as 'Month', COUNT(*) as 'Count'
	from NEWS N
	where YEAR(N.DateCreated) = @year
	group by YEAR(N.DateCreated), MONTH( N.DateCreated )
end

-------------Test---------------------------------
[sp_News_GroupByYear]
[sp_News_GroupByYearMonth] 2015
[sp_News_Search_YearMonth] 2015, 9
