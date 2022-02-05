select 
a.DocDate,a.ItemCode,a.Quantity,a.ObjType,
b.OnHand
from IGN1 a
left join (select ItemCode,sum(OnHand) OnHand from OITW group by ItemCode) b on a.ItemCode=b.ItemCode 
--IGN1--
union all
--PDN1--
select 
a.DocDate,a.ItemCode,a.Quantity,a.ObjType,
b.OnHand
from PDN1 a
left join (select ItemCode,sum(OnHand) OnHand from OITW group by ItemCode) b on a.ItemCode=b.ItemCode
--stock in--
union all
--stock out--
select 
a.DocDate,a.ItemCode,a.Quantity,a.ObjType,
b.OnHand
from DLN1 a
left join (select ItemCode,sum(OnHand) OnHand from OITW group by ItemCode) b on a.ItemCode=b.ItemCode
--DLN1--
union all
--IGE1--
select 
a.DocDate,a.ItemCode,a.Quantity,a.ObjType,
b.OnHand
from IGE1 a
left join (select ItemCode,sum(OnHand) OnHand from OITW group by ItemCode) b on a.ItemCode=b.ItemCode