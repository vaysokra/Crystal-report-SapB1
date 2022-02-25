##### DocNum
```go
stringvar x;
x:=Totext ({Command.ORDR_DocNum},0,"");
{Command.NNM1_BeginStr}+""+left(x,4)+"-"+mid(x,5,8)
```
##### checkMark
```go
if {Command.DocCurr}='USD' then chr(254)
else chr(111)
```
##### DocDate(01/05/2021)
```go
totext({Command.DocDate},'dd/MM/yyyy')
```
> DocDate(01/May/2021)
```go
totext({Command.DocDate},'dd/MMM/yyyy')
```
#### DocDate(KH)
```go
stringvar x ;
stringvar result;
x:=totext({Command.DocDate},"M");
select x 
case '1' :  result := totext({Command.DocDate},"dd") + ' . មករា  . ' +totext({Command.DocDate},"yy")
case '2' :  result := totext({Command.DocDate},"dd") + ' . កុម្ភ: . ' +totext({Command.DocDate},"yy")
case '3' :  result := totext({Command.DocDate},"dd") + ' . មីនា . ' +totext({Command.DocDate},"yy")
case '4' :  result := totext({Command.DocDate},"dd") + ' . មេសា . ' +totext({Command.DocDate},"yy")
case '5' :  result := totext({Command.DocDate},"dd") + ' . ឧសភា . ' +totext({Command.DocDate},"yy")
case '6' :  result := totext({Command.DocDate},"dd") + ' . មិថុនា . ' +totext({Command.DocDate},"yy")
case '7' :  result := totext({Command.DocDate},"dd") + ' . កក្កដា . ' +totext({Command.DocDate},"yy")
case '8' :  result := totext({Command.DocDate},"dd") + ' . សីហា . ' +totext({Command.DocDate},"yy")
case '9' :  result := totext({Command.DocDate},"dd") + ' . កញ្ញា . ' +totext({Command.DocDate},"yy")
case '10' :  result := totext({Command.DocDate},"dd") + ' . តុលា . ' +totext({Command.DocDate},"yy")
case '11' :  result := totext({Command.DocDate},"dd") + ' . វិច្ឆិកា . ' +totext({Command.DocDate},"yy")
case '12' :  result := totext({Command.DocDate},"dd") + ' . ធ្នូ . ' +totext({Command.DocDate},"yy")
default: result := '_ . _ . _' 
```
