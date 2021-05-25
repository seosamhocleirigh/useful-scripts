# load in json for querying
$data=Get-Content ".\donuts.json" |
    Out-String |
    ConvertFrom-Json

# basic query using equals
$data.items.item | select topping