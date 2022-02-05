select 
a.DocNum OPRQ_DocNum,a.DocEntry,a.DocDate,a.DocTotal,a.Department,a.ReqName,a.Requester,a.ReqType,a.Comments,
a1.ItemCode PRQ1_ItemCode,a1.Dscription,a1.Quantity,a1.LineTotal,a1.Price,a1.unitMsr,a1.FreeTxt,
b.position OHEM_position,b.firstName,b.lastName,b.middleName,b.dept,
c.Name OUDP_Name
from OPRQ a left outer join PRQ1 a1 on a.docentry=a1.DocEntry
left outer join OHEM b on a.OwnerCode=b.empID
left outer join OUDP c on a.Department=c.Code