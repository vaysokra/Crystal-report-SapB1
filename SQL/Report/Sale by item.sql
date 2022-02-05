select 
a.DocEntry,a.DocDate,a.DocTotal,
a1.ItemCode,a1.PriceBefDi,a1.Dscription,a1.unitMsr,a1.Quantity,a1.DiscPrcnt,
b.U_Brand,b.AvgPrice
from 
ORDR a left join RDR1 a1 on a.DocEntry=a1.DocEntry
left join OITM b on a1.ItemCode=b.ItemCode