select 
a.DocDate ORCT_DocDate,
a2.SumApplied RCT1_SumApplied,
b.DocTotal OINV_DocTotal,b.PaidToDate,b.DocDate

from 
ORCT a left join RCT2 a2 on a.DocEntry=a2.DocNum
left join OINV b on a2.DocEntry=b.DocEntry