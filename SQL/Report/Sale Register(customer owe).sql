select 
a.CardName,a.CardCode,a.DocDate,a.DocNum,a.Comments,a.DiscSum,a.PaidSum,a.DocTotal,
b.PymntGroup,
c.U_NAME
from OINV a
left join OCTG b on a.GroupNum=b.GroupNum
left join OUSR c on a.UserSign = c.USERID