```sql
IF OBJECT_ID(N'tempdb..#good') IS NOT NULL
BEGIN
	DROP TABLE tempdb..#good
END
begin 
	select DocNum,DocDate
	into #good
	from ORDR
end
begin
	select * from #good
end
```
