select 
a.DocEntry,a.DocNum,a.DocDate,a.DocTotal,a.UserSign,a.UserSign2,
a1.ItemCode,a1.PriceBefDi,a1.Dscription,a1.unitMsr,a1.Quantity,a1.DiscPrcnt,a1.OpenQty,a1.price,
b.U_Brand,b.AvgPrice,
c.U_NAME OUSR_UName,
cv2.U_NAME OUSR_V2_UName,
d.CardName
from 
ORDR a left join RDR1 a1 on a.DocEntry=a1.DocEntry
left join OITM b on a1.ItemCode=b.ItemCode
left join OUSR c on a.UserSign = c.USERID
left join ousr cv2 on a.UserSign2 = cv2.USERID
left join OCRD d on a.cardcode = d.cardcode