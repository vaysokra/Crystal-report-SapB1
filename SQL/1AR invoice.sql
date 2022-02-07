select 
a.DocEntry OINV_DocEntry,a.DocNum,a.DocDate,a.DocDueDate,a.CardCode,a.CardName,a.DocTotal,a.VatSum,a.DiscSum,a.NumAtCard,a.Address,a.Address2,
a.DocDueDate,a.GroupNum,a.Comments,a.NumAtCard,
	a.U_ExchangeRate,
a1.ItemCode INV1_ItemCode,a1.dscription,a1.PriceBefDi,a1.Price,a1.Quantity,a1.unitMsr,a1.unitMsr2,a1.LineTotal,a1.DiscPrcnt,a1.FreeTxt,a1.PriceAfVAT,
	a1.U_ColorCode,
b.CompnyName OADM_CompnyName,b.CompnyAddr,b.TaxIdNum,b.Phone1,
c.CardName OCRD_CardName,c.LicTradNum,c.Phone1,c.Address,c.CardFName,c.Block,
d.CodeBars OITM_CodeBars,
e.DocNum ODLN_DocNum,
f.DocNum ORDR_DocNum,f.DocDate,
g.PymntGroup OCTG_PymntGroup,g.ExtraDays,g.ExtraMonth,
h.BeginStr BeginStr,h.EndStr,
i.SlpName OSLP_SlpName
from 
OINV a left outer join INV1 a1 on a.DocEntry=a1.DocEntry
left outer join (select CompnyName,CompnyAddr,Color,TaxIdNum,Phone1 from OADM) b on a.DocEntry>=b.Color
left outer join OCRD c on a.cardcode = c.cardcode
left outer join OITM d on a1.itemcode = d.itemcode
left outer join ODLN e on a1.baseentry = e.docentry
left outer join DLN1 e1 on e.docentry = e1.docentry
left outer join ORDR f on e1.baseentry = f.DocEntry
left outer join OCTG g on a.GroupNum = g.GroupNum
left outer join NNM1 h on a.Series = h.Series
left outer join OSLP i on a.SlpCode = i.SlpCode