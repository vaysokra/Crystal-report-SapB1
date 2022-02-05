select distinct
a.DocNum ORDR_DocNum,a.DocEntry,a.DocDate,a.Address,a.Address2,a.DocDueDate,a.DiscSum,a.VatSum,
a1.ItemCode RDR1_ItemCode,a1.Price,a1.PriceBefDi,a1.Quantity,a1.Dscription,a1.unitMsr,
a3.LineTotal RDR3_LineTotal,
b.CardCode OCRD_CardCode,b.CardName,b.Address,b.Phone1,
c.SlpName OSLP_SlpName,
e.UgpName OUGP_UgpName,
f.BeginStr NNM1_BeginStr,f.EndStr,
g.mobile OHEM_Mobile,
h.PymntGroup OCTG_PymntGroup
from
ORDR a left outer join RDR1 a1 on a.docentry=a1.DocEntry
left outer join RDR3 a3 on a.DocEntry=a3.DocEntry
left outer join OCRD b on a.CardCode=b.CardCode
left outer join OSLP c on a.SlpCode=c.SlpCode
left outer join OITM d on a1.itemcode = d.itemcode
left outer join OUGP e on d.UgpEntry = e.UgpEntry
left outer join NNM1 f on a.Series = f.Series
left outer join OHEM g on a.ownercode = g.empID
left outer join OCTG h on a.GroupNum = h.GroupNum