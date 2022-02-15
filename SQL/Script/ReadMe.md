#### condition
```sql
select 
case DocNum
when '2021000001' then 'good'
when '2021000002' then 'bad' 
else 'never' end Data

 from ORDR
```
