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
