select 
a.DocEntry,a.DocNum,a.DocDate,
a1.ItemCode,a1.Quantity,a1.Price,a1.Dscription,a1.unitMsr,
b.CardCode,b.CardName,b.Phone1,b.Address,
c.Phone1 as OADM_Phone
from 
OQUT a left outer join QUT1 a1 on a.docentry = a1.DocEntry 
left outer join OCRD b on a.cardcode = b.cardcode
left outer join OADM c on a.DocEntry >= c.color