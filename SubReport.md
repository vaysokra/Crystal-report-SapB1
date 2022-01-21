#### link from main report
- > right click on **subreport** and find **change subreport link** then add main parameter
#### share value from main report to subreport
```go
//main
shared numbervar OVPM_DocEntry:={Command.OVPM_DocEntry};
//sub
shared numbervar OVPM_DocEntry;
OVPM_DocEntry
```
