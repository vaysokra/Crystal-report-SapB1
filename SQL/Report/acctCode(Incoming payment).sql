select a.AcctCode,a.AcctName
from 
OACT a 
where a.LocManTran ='Y' and a.AcctCode<>(select DebPayAcct from OCRD where CardCode='vnk0001')