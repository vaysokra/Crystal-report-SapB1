select 
a.DocNum,a.DocEntry,a.DocDate,a.DiscSum,a.Address as ORDR_Addr,a.Address2 as ORDR_Addr2,a.DocDueDate,
a1.ItemCode,a1.Price,a1.Quantity,a1.Dscription,a1.unitMsr,
b.CardCode,b.CardName,b.Address,b.Phone1,
c.SlpName
from
ORIN a left outer join RIN1 a1 on a.docentry=a1.DocEntry
left outer join OCRD b on a.CardCode=b.CardCode
left outer join OSLP c on a.SlpCode=c.SlpCode
