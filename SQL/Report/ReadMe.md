#### all transaction journal (pivot)
```sql
select 
y.OJDT_TransId,y.Memo,y.Number,y.RefDate,
y.JDT1_Credit,y.Debit,y.FCCredit,y.FCDebit,y.Line_ID,y.LineMemo,y.Ref1,y.Ref2,y.Ref3Line,y.TransType,y.ShortName,
y.OHEM_firstName,y.lastName,
y.OHPS_descriptio,
y.OUDP_Name,y.Remarks,
y.OACT_AcctName,
y.OCRD_CardName,

ya.DocDate ORCT_IncomingPymt_DocDate,ya.CardName,
yb.DocDate OVPM_OutgoingPymt_DocDate,yb.CardName,
yc.DocDate OPDN_GoodReciptPO_DocDate,yc.CardName,
yd.DocDate ORDN_Return_DocDate,yd.CardName,
ye.DocDate OINV_ARinvoice_DocDate,ye.CardName,
yf.DocDate OPCH_APinvoice_DocDate,yf.CardName

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
