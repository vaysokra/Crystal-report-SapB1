##### DocNum
```go
stringvar x;
x:=Totext ({Command.ORDR_DocNum},0,"");
{Command.NNM1_BeginStr}+""+left(x,4)+"-"+mid(x,5,8)
```
##### DocDate(01/05/2021)
```go
totext({Command.DocDate},'dd/MM/yyyy')
```
> DocDate(01/May/2021)
```go
totext({Command.DocDate},'dd/MMM/yyyy')
```
