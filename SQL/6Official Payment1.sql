select 
a.DocEntry,a.DocNum,a.DocTotal,a.CardName,a.DocDate,a.DocDueDate,a.TaxDate,
a1.ObjType,
b.DocNum,b.DocTotal,b.PaidSum,b.Comments,

d.Address as OCRD_Address,d.Phone1 as OCRD_Phone
from 
OVPM a left outer join VPM2 a1 on a.DocEntry=a1.DocNum
left outer join OPCH b on a1.DocEntry=b.DocEntry
left outer join PCH1 b1 on b.docentry = b1.DocEntry
left outer join OCPR c on a.CardCode=c.CardCode
left outer join OCRD d on a.CardCode=d.CardCode