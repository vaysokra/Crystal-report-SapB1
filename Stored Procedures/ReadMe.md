### Stored Procedures
> for Master
```sql
if @transaction_type IN ('A','U') AND @Object_type = '17'

begin
  declare @PickUpBy nvarchar(255)
  declare @ReviewBy nvarchar(255)
  set @PickUpBy = (select a.U_PickUpBy from ORDR a where a.DocEntry= @list_of_cols_val_tab_del)
  set @ReviewBy = ((select a.U_ReviewBy from ORDR a where a.DocEntry= @list_of_cols_val_tab_del))

  if (@PickUpBy = @ReviewBy)
    select @error = 1, @error_message = @PickUpBy+@ReviewBy
end
```
> for Detail
```sql
if @transaction_type IN ('A','U') AND @Object_type = '13'
begin

if exists 
(select a1.freetxt from INV1 a1 where a1.DocEntry= @list_of_cols_val_tab_del and a1.FreeTxt='')
  select @error = 1, @error_message = 'please insert free text'
end
```
