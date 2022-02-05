select 
a.DocEntry OPDN_DocEntry,a.DocNum,a.DocDate,a.Comments,
a1.BaseEntry PDN1_BaseEntry,a1.BaseType,a1.FreeTxt,a1.ItemCode,a1.Dscription,a1.Price,a1.Quantity,a1.OpenQty,a1.BaseQty,
a2.RefDocNum PDN21_RefDocNum,
b.CardName OCRD_CardName,b.Address,b.Phone1,b.E_Mail,
c.WhsName OWHS_WhsName,
d.empid OHEM_empid,d.firstName,d.middleName,d.lastName,
e.DocNum OPOR_DocNum
from 
OPDN a left join PDN1 a1 on a.DocEntry=a1.DocEntry
left join PDN21 a2 on a.DocEntry=a2.DocEntry
left join OCRD b on a.cardcode = b.cardcode
left join OWHS c on a1.WhsCode = c.WhsCode
left join OHEM d on a.OwnerCode = d.empID
left join OPOR e on a1.baseentry = e.DocEntry and a1.basetype=e.objtype
