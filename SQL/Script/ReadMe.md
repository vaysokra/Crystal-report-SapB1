#### condition
```tsql
select 
case DocNum
  when '2021000001' then 'good'
  when '2021000002' then 'bad' 
  else 'never' end Data
from ORDR
```
#### return value from *SELECT*
```tsql
DECLARE @EmpName NVARCHAR(50)
SELECT @EmpName =  DocNum FROM ORDR WHERE DocEntry = 3	-- or set @EmpName = (select  DocNum FROM ORDR WHERE DocEntry = 3)
begin
	select DocEntry from ORDR where DocNum = @EmpName
end
```
#### dynamic *TABLE*
```tsql
DECLARE @TableName NVARCHAR(50)
DECLARE @SQL NVARCHAR(Max)

set @TableName = (select  a.TableName FROM OBOB a WHERE a.TableName='oqut')
if (@TableName = 'ordr')
begin
	set @tableName = 'ordr';
end
else 
begin
	set @tableName = 'oqut';
end
set @SQL = ' 
select  
a.DocEntry,a.DocNum,a.DocDate,
b.ItemCode,b.Dscription
from '+@TableName+' a 
left join '+right(@TableName,3)+'1 b'+' on a.docentry=b.docentry';
exec sp_executesql @sql
```
