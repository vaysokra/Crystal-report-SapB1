## Crystal-report-SapB1
#### Relationship database B1 
[(https://biuan.com/?q=OINV)](https://biuan.com/?q=OINV)
> avoid duplicate
```sql
-- Delivery to Sale_Order
DLN1 a1 left join RDR1 b1 on a1.BaseEntry = b1.DocEntry and a1.BaseLine = b1.LineNum   
-- Delivery to AR/Invoice
DLN1 a1 left join INV1 b1 on a1.DocEntry = b1.BaseEntry and a1.LineNum = b1.BaseLine
```
#### Parameter field
- range value ,there are two value : minimum() and maximum()
- HasValue() , not HasValue() : for check null value (optional prompt in parameter field)
- **Vendor@Select * from OCRD Where CardType='C'** for link to list all of vendor and **DocEntry@** for reference to docentry in any document 
> optional prompt
```go
(not HasValue({?Cardcode@select * from ocrd}) OR {Command.CardCode} = {?Cardcode@select * from ocrd})
```
#### change password
```
DELETE FROM OUSR WHERE USERID = 1

INSERT INTO [TARGET].[dbo].OUSR
SELECT * FROM [SOURCE].[dbo].[OUSR] WHERE USERID = 1
```
##### unlock user password
```
update OUSR set Locked = 'N' where USERID = 1
```
