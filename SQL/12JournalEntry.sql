select 
a.TransId OJDT_TransId,a.Memo,a.number,a.RefDate,
a1.Credit JDT1_Credit,a1.Debit,a1.FCCredit,a1.FCDebit,a1.Line_ID,a1.LineMemo,a1.Ref1,a1.Ref2,a1.Ref3Line,a1.ObjType,a1.ShortName,
b.firstName OHEM_firstName,b.lastName,
bb.descriptio OHPS_descriptio,
bbb.Name OUDP_Name,bbb.Remarks,
c.TableName OBOB_TableName,
d.AcctName OACT_AcctName,
e.CardName OCRD_CardName
from 
OJDT a left join JDT1 a1 on a.TransId = a1.TransId
left join OHEM b on a1.UserSign = b.USERID
left join OHPS bb on b.position = bb.posID
left join OUDP bbb on b.dept = bbb.Code
left join OBOB c on a1.ObjType = c.ObjectId
left join OACT d on a1.ShortName = d.AcctCode
left join OCRD e on a1.ShortName = e.CardCode
