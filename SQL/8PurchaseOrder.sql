select 
a.DocNum OPOR_DocNum,a.DocEntry,a.DocDate,a.Address,a.Address2,a.DocDueDate,a.DocRate,
a1.ItemCode POR1_ItemCode,a1.Price,a1.Quantity,a1.Dscription,a1.unitMsr,
b.CardCode OCRD_CardCode,b.CardName,b.Address,b.Phone1,
c.SlpName OSLP_SlpName,
d.UgpEntry OITM_UgpEntry,d.CodeBars,d.BWidth1,d.BHeight1,d.BLength1,d.BVolume,d.BWeight1,
e.UgpName OUGP_UgpName,
e1.BaseQty UGP1_BaseQty,
f.UnitDisply OLGT_width,
fV2.UnitDisply OLGT_height,
fV3.UnitDisply OLGT_length,
g1.BeginStr NNM1_BeginStr,g1.EndStr
from
OPOR a left outer join POR1 a1 on a.docentry=a1.DocEntry
left outer join OCRD b on a.CardCode=b.CardCode
left outer join OSLP c on a.SlpCode=c.SlpCode
left outer join OITM d on a1.itemcode=d.ItemCode
left outer join OUGP e on e.UgpEntry=d.UgpEntry
left outer join  UGP1 e1 on e.UgpEntry=e1.UgpEntry and e1.UomEntry=a1.UomEntry
left outer join OLGT f on f.UnitCode=d.BWdth1Unit
left outer join OLGT fV2 on fV2.UnitCode=d.BHght1Unit
left outer join OLGT fV3 on fV3.UnitCode=d.BLen1Unit
left outer join NNM1 g1 on a.Series=g1.Series
where a.DocEntry=1