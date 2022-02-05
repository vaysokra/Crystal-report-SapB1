select
b.WhsCode,b.ItemCode,b.OnHand,b.IsCommited,b.OnOrder,
a.MinLevel,a.MaxLevel
from 
OITM a 
left join OITW b on a.ItemCode=b.ItemCode