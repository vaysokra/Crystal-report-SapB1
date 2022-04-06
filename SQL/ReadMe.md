#### SQL
- [columnName].**U_**[name] : user define field (UFD)  
#### Pre_'#'
- Prefix local temporary table names with single number sign (#table_name), and prefix global temporary table names with a double number sign (##table_name).
#### parameter in command
```sql
---
where a.TransId = {?key@}
```
#### Partition by
```sql
select CardCode,DocDate,SlpCode,
sum(doctotal) over (partition by docdate) as total
 from ORDR 
```
#### Pivot (row to column)
```sql
select * from (
select a.transid,a.RefDate,a.BaseRef,a.Ref1,b.TableName from OJDT a left join OBOB b on a.TransType = b.ObjectId 
 ) as x 
 pivot (
	max(x.refdate) FOR x.TableName IN ([OPDN],[ODLN])
 ) as b
```
