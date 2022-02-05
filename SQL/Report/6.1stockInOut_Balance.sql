select 
stockIn.DocDate,stockIn.ItemCode,stockIn.Quantity StockIN,stockIn.OnHand,
stockOut.Quantity StockOut,stockOut.OnHand
from
(select 
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
left join (select ItemCode,sum(OnHand) OnHand from OITW group by ItemCode) b on a.ItemCode=b.ItemCode) 

stockIn 

left join

(select 
a.DocDate,a.ItemCode,a.Quantity,a.ObjType,
b.OnHand
from DLN1 a
right join (select ItemCode,sum(OnHand) OnHand from OITW group by ItemCode) b on a.ItemCode=b.ItemCode
--DLN1--
union all
--IGE1--
select 
a.DocDate,a.ItemCode,a.Quantity,a.ObjType,
b.OnHand
from IGE1 a
right join (select ItemCode,sum(OnHand) OnHand from OITW group by ItemCode) b on a.ItemCode=b.ItemCode) 

stockOut on stockIn.itemcode = stockout.ItemCode