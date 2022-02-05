select distinct
a.DocNum ODLN_DocNum,a.DocEntry,a.DocDate,a.Address,a.Address2,a.DocDueDate,a.Comments,a.NumAtCard,
a1.ItemCode DLN1_ItemCode,a1.Price,a1.Quantity,a1.Dscription,a1.unitMsr,a1.OpenQty,a1.OrderedQty,a1.FreeTxt,
b.CardCode OCRD_CardCode,b.CardName,b.Address,b.Phone1,
c.SlpName,
d.DocNum ORDR_DocNum,
e.DocNum OQUT_DocNum,
f.Name OCPR_Name
from
ODLN a left outer join DLN1 a1 on a.docentry=a1.DocEntry
left outer join OCRD b on a.CardCode=b.CardCode
left outer join OSLP c on a.SlpCode=c.SlpCode
left outer join ORDR d on a1.baseentry=d.DocEntry
left outer join RDR1 d1 on d.docentry=d1.DocEntry
left outer join OQUT e on d1.baseentry=e.DocEntry
left outer join OCPR f on a.CntctCode=f.CntctCode