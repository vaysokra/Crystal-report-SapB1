## Title
- 1unlock user password
- 2change password
- 3parameter field
- 4Relationship database B1(website)
- 5keybord shortcut
- 6master_detail and detail_master (table relationship)
- 7Query Manager parameter
### Crystal-report-SapB1
- grid size (default): 0.212 , grid size : 0.08 
#### 7Query Manager parameter
```sql
DECLARE @schoolYear as VarChar, @studentID as VarChar
SET @schoolYear = (SELECT a.DocDate FROM ORDR A WHERE A.DocDate = [%0])
SET @studentID = (SELECT a.CardName FROM ORDR A WHERE A.CardName = [%1])
```
#### 6master_detail and detail_master
```sql
-- detail relate master
select a.DocNum,a1.dscription,a1.docEntry from PCH1 a1
left join OPCH a on a1.DocEntry = a.DocEntry
where a1.DocEntry = 2
-- master relate detail
select a.DocNum,a1.dscription,a1.docEntry from OPCH a
left join PCH1 a1 on a.DocEntry = a1.DocEntry
where a.DocEntry = 2
```
#### 5keybord shortcut
- ctrl + 2(left-click) = change name of label
- cursor on any field => shift + alt + F2 = user defined value

#### 4Relationship database B1 (website) 
[(https://biuan.com/?q=OINV)](https://biuan.com/?q=OINV)
> avoid duplicate
```sql
-- Delivery to Sale_Order
DLN1 a1 left join RDR1 b1 on a1.BaseEntry = b1.DocEntry and a1.BaseLine = b1.LineNum   
-- Delivery to AR/Invoice
DLN1 a1 left join INV1 b1 on a1.DocEntry = b1.BaseEntry and a1.LineNum = b1.BaseLine
```
#### 3Parameter field
- range value ,there are two value : minimum() and maximum()
- HasValue() , not HasValue() : for check null value (optional prompt in parameter field)
- **Vendor@Select * from OCRD Where CardType='C'** for link to list all of vendor and **DocEntry@** for reference to docentry in any document 
> optional prompt
```go
(not HasValue({?Cardcode@select * from ocrd}) OR {Command.CardCode} = {?Cardcode@select * from ocrd})
```
#### 2change password
```
DELETE FROM OUSR WHERE USERID = 1
q
INSERT INTO [TARGET].[dbo].OUSR
SELECT * FROM [SOURCE].[dbo].[OUSR] WHERE USERID = 1
```
##### 1unlock user password
```
update OUSR set Locked = 'N' where USERID = 1
```
