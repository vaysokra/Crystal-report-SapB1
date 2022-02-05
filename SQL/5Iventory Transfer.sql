select 
--jjj
a.DocEntry OWTR_DocEntry,a.DocNum,a.Address,a.Address2,a.DocDueDate,a.DocDate,a.Comments,
a1.ItemCode WTR1_ItemCode,a1.Quantity,a1.Dscription,a1.FromWhsCod,a1.WhsCode,a1.Price,a1.FreeTxt,a1.unitMsr,
b.WhsName OWHS_FromWhsName,
bV2.WhsName OWHS_V2_ToWhsName,
c.CardCode OCRD_CardCode,c.CardName,c.Address,c.Phone1,c.Phone2,
d.firstName OHEM_firstName,d.middleName,d.lastName,d.mobile,d.homeTel,d.officeTel,
f.UgpName
from 
OWTR a left join WTR1 a1 on a.DocEntry=a1.DocEntry
left join OWHS b on a1.FromWhsCod=b.WhsCode
left join OWHS bV2 on a1.WhsCode=bV2.WhsCode
left join OCRD c on a.cardcode=c.CardCode
left join OHEM d on a.SlpCode=d.empID
left join OITM e on a1.itemcode=e.itemcode
left join OUGP f on e.UgpEntry=f.UgpEntry