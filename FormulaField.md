### DocNum
```go
stringvar x;
x:=Totext ({Command.ORDR_DocNum},0,"");
{Command.NNM1_BeginStr}+""+left(x,4)+"-"+mid(x,5,8)
```
