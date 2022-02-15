#### condition
```sql
select 
case DocNum
  when '2021000001' then 'good'
  when '2021000002' then 'bad' 
  else 'never' end Data
from ORDR
```
#### return value from *SELECT*
```sql
DECLARE @EmpName NVARCHAR(50)
SELECT @EmpName =  DocNum FROM ORDR WHERE DocEntry = 3	-- or set @EmpName = (select  DocNum FROM ORDR WHERE DocEntry = 3)
begin
	select DocEntry from ORDR where DocNum = @EmpName
end
```
#### dynamic *TABLE*
```sql
DECLARE @EmpName NVARCHAR(50)
DECLARE @EmpName2 NVARCHAR(50)
set @EmpName = (select  a.TableName FROM OBOB a WHERE a.TableName='ordr')
set @EmpName2 = N' select * from '+@EmpName
exec sp_executesql @empName2 
```
