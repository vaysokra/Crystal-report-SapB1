## Title
- 2Journal To baseDocument Detail
- 1all transaction journal( pivot)
#### 2Journal To baseDocument Detail
```sql
select 
y.TransId,y.Debit,y.Credit,y.ShortName,y.RefDate,y.Line_ID,
y.OVPM,y.OPCH,y.ORCT,y.OINV,
a.AcctName OACT_AcctName,

z11.DocNum OVPM_outGoing_DocNum,z11.OcrCode,
z22.DocNum OPCH_ApInv_DocNum,z22.OcrCode,
z33.DocNum OINV_ArInv_DocNum,z33.OcrCode,
z44.DocNum ORCT_inComing_DocNum,z44.OcrCode
from(
select 
a1.TransId,
a1.ShortName,a1.baseRef,a1.credit,a1.debit,a1.RefDate,a1.Line_ID,
b.TableName
from JDT1 a1
--left join JDT1 a1 on a.TransId = a1.TransId
left join OBOB b on a1.TransType = b.ObjectId
) x
pivot (
--ovpm (outGoingPmyt) opch(apInvoice) oinv(arInvoice) orct(inComingpmyt)
max(x.baseref) FOR x.TableName IN ([OVPM],[OPCH],[OINV],[ORCT],[OJDT])
) y

left join OACT a on y.ShortName = a.AcctCode
--outgoing
left join (select a.DocNum,a2.OcrCode from VPM2 a2 
left join OVPM a on a2.DocNum = a.DocEntry) z11 on y.OVPM = z11.DocNum
--ap invoice
left join (select a.DocNum,a1.OcrCode,a1.AcctCode from PCH1 a1 
left join OPCH a on a1.DocEntry = a.DocEntry) z22 on y.opch = z22.DocNum and z22.AcctCode = y.ShortName
--ar invoice
left join (select a.DocNum,a1.OcrCode,a1.AcctCode from INV1 a1 
left join OINV a on a1.DocEntry = a.DocEntry) z33 on y.oinv = z33.DocNum and z33.AcctCode = y.ShortName
--incoming
left join (select a.DocNum,a2.OcrCode from RCT2 a2 
left join ORCT a on a2.DocNum = a.DocEntry) z44 on y.orct = z44.DocNum

where y.TransId = 4532
```
#### 1all transaction journal (pivot)
```sql
select 
y.OJDT_TransId,y.Memo,y.Number,y.RefDate,
y.JDT1_Credit,y.Debit,y.FCCredit,y.FCDebit,y.Line_ID,y.LineMemo,y.Ref1,y.Ref2,y.Ref3Line,y.TransType,y.ShortName,
y.OHEM_firstName,y.lastName,
y.OHPS_descriptio,
y.OUDP_Name,y.Remarks,
y.OACT_AcctName,
y.OCRD_CardName,

ya.DocDate ORCT_IncomingPymt_DocDate,ya.CardName,ya.DocNum,
yb.DocDate OVPM_OutgoingPymt_DocDate,yb.CardName,yb.DocNum,
yc.DocDate OPDN_GoodReciptPO_DocDate,yc.CardName,yc.DocNum,
yd.DocDate ORDN_Return_DocDate,yd.CardName,yd.DocNum,
ye.DocDate OINV_ARinvoice_DocDate,ye.CardName,ye.DocNum,
yf.DocDate OPCH_APinvoice_DocDate,yf.CardName,yf.DocNum

from (
select 
a.TransId OJDT_TransId,a.Memo,a.Number,a.RefDate,a.BaseRef,
a1.Credit JDT1_Credit,a1.Debit,a1.FCCredit,a1.FCDebit,a1.Line_ID,a1.LineMemo,a1.Ref1,a1.Ref2,a1.Ref3Line,a1.TransType,a1.ShortName,
b.firstName OHEM_firstName,b.lastName,
cast(bb.descriptio as nvarchar(4000)) OHPS_descriptio,
bbb.Name OUDP_Name,bbb.Remarks,
c.TableName OBOB_TableName,
d.AcctName OACT_AcctName,
e.CardName OCRD_CardName
from 
OJDT a left join JDT1 a1 on a.TransId = a1.TransId
left join OHEM b on a1.UserSign = b.USERID
left join OHPS bb on b.position = bb.posID
left join OUDP bbb on b.dept = bbb.Code
left join OBOB c on a1.TransType = c.ObjectId
left join OACT d on a1.ShortName = d.AcctCode
left join OCRD e on a1.ShortName = e.CardCode
) x
pivot (
max(x.BaseRef) FOR x.OBOB_TableName IN ([OINV],[OPCH],[OPDN],[ODLN],[ORCT],[ORDN],[OVPM],[OJDT])
) y
left join ORCT ya on y.ORCT = ya.DocNum
left join OVPM yb on y.OVPM = yb.DocNum
left join OPDN yc on y.OPDN = yc.DocNum
left join ORDN yd on y.ORDN = yd.DocNum
left join OINV ye on y.OINV = ye.DocNum
left join OPCH yf on y.OPCH = yf.DocNum

```
