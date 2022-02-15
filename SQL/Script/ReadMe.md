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
SELECT @EmpName =  DocNum FROM ORDR WHERE DocEntry = 3
begin
	select DocEntry from ORDR where DocNum = @EmpName
end
```