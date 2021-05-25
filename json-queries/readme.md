
# Powershell Json cheatsheet #

## Basic commands ##

All below examples and the donuts.json file can be found in this directory.

### Loading in a text file into an Array ###

```powershell
$donuts=Get-Content .\donuts.json
```

------

### Convert array to string ###

```powershell
$donutsString=$donuts | Out-String
```

------

### Convert a string containing JSON to PSCustomObject ###

```powershell
$donutsPSCustomObject=$donutsString | ConvertFrom-Json
```

------

### Putting that all together with pipes ###

```powershell
$donutsPSCustomObject=Get-Content .\donuts.json | Out-String | ConvertFrom-Json
```

------

### Convert the PSCustomObject to string ###

```powershell
$donutsString=$donutsPSCustomObject | ConvertFrom-Json
```

------

### Output the string contents to a file ###

```powershell
$donutsString | Set-Content output.json
```

------

### Basic where equals filter example on the PSCustomObject ###

```powershell
$donutsPSCustomObject.items.item | Where {$_.type -eq "filled"}
```

------

### Basic where greater than filter example on the PSCustomObject ###

```powershell
$donutsPSCustomObject.items.item | where {$_.ppu -gt 0.65}
```

------

### Basic where greater than or equal to filter example on the PSCustomObject ###

```powershell
$donutsPSCustomObject.items.item | where {$_.ppu -ge 0.65}
```

------

### Basic projection example on the PSCustomObject ###

```powershell
$donutsPSCustomObject.items.item | select topping
```

------

// TODO: first item in list, take, to csv, distinct