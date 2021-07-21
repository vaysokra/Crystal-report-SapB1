## Crystal-report-SapB1
##### Relationship database B1 
[(https://biuan.com/?q=OINV)](https://biuan.com/?q=OINV)
##### Parameter field
- range value ,there are two value : minimum() and maximum()
- HasValue() , not HasValue() : for check null value (optional prompt in parameter field)
##### change password
```
DELETE FROM OUSR WHERE USERID = 1

INSERT INTO [TARGET].[dbo].OUSR
SELECT * FROM [SOURCE].[dbo].[OUSR] WHERE USERID = 1
```
###### unlock user password
```
update OUSR set Locked = 'N' where USERID = 1
```
