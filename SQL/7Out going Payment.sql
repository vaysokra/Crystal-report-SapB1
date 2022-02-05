select  
a.DocEntry OVPM_DocEntry,a.DocDate,a.DocNum,a.CardName,a.Address,a.Comments,a.Doctotal,
a2.SumApplied VPM2_SumApplied,a2.PaidSum,
b.DocNum OINV_DocNum,b.DocDate,b.DocTotal,b.Comments,
c.Number OJDT_Number,
c1.Credit JDT1_Credit,c1.Debit,c1.FCCredit,c1.FCDebit,
d.AcctName,d.AcctCode
from 
OVPM a left join VPM2 a2 on a.DocEntry=a2.DocNum
left join OPCH b on b.DocEntry = a2.docentry
left join OJDT c on c.TransId = a.TransId
left join JDT1 c1 on c1.TransId = c.TransId
left join OACT d on c1.Account = d.AcctCode