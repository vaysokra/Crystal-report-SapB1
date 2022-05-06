#### Title
- 1TransType
- 2DocDate(KH)
- 3DocDate(01/05/2021)
- 4Date Interval
- 5checkMark
- 6DocNum
- 7Image path on (OLE Object)
- 8LineNum
- 9Open balance
- 10AmountToWord
- 11Format currency to sting
##### 11Format currency to sting
```go
IIF(CStr ({OCRD.CreditLine})<>CStr (0),CStr ({OCRD.CreditLine},0),'Negotiation')
```
##### 10AmountToWord
```go
numberVar x :={Command.DocTotal}- Int ({Command.DocTotal}) ;
if  x = 0 then
     ProperCase (ToWords (Int ({Command.DocTotal}),0) )+ ' US Dollars'
else
     ProperCase(ToWords (Int ({Command.DocTotal}),0)) + 'US Dollars, and ' + ProperCase(ToWords ((x * 100),0)) + ' cents'
```
##### 9Open balance
```go
whileprintingrecords;
shared currencyvar OB;
if(date({Command.RefDate}) < {?From})then 
(OB:=OB;
OB)
else
(OB := OB - {Command.Credit}+{Command.Debit};
OB)
```
##### 8LineNum
```go
WhilePrintingRecords;
Global NumberVar i;
if({Command.Quantity}<0)
then( i:=i; i)
else(i:=i+1; i)
```
##### 7Image path on (OLE Object)
```go
// uncheck : can grow
// OLE Object type : choose paintbrush

//{@PicturePath} := {Command.OADP_BitmapPath}
IF ISNULL({OITM.PicturName}) THEN '' ELSE {@PicturePath} + {OITM.PicturName}
```
##### 6DocNum
```go
stringvar x;
x:=Totext ({Command.ORDR_DocNum},0,"");
{Command.NNM1_BeginStr}+""+left(x,4)+"-"+mid(x,5,8)
```
##### 5checkMark
```go
//font : Wingdings
if {Command.DocCurr}='USD' then chr(254)
else chr(111)
```
#### 4Date Interval
> 4/1/2015 to 4/1/2014
```go
DateAdd("yyyy", -1, {Command.RefDate})
```
> subtract 30 days from 4/1/2015
```go
DateAdd("d", -30, Date(2015, 04, 01))
```
##### 3DocDate(01/05/2021)
```go
totext({Command.DocDate},'dd/MM/yyyy')
```
> DocDate(01/May/2021)
```go
totext({Command.DocDate},'dd/MMM/yyyy')
```
#### 2DocDate(KH)
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
#### 1TransType
```go
select {Command.TransType} 
case '13' : 'AR invoice'  
case '14' : 'AR credit memo'
case '18' : 'AP invoice'
case '19' : 'AP credit memo'
case '24' : 'Incoming payment'
case '25' : 'Deposit'
case '30' : 'Journal Entry'
case '46' : 'Outgoing payment'
default: ''
```
