# load in json for querying
$data=Get-Content ".\donuts.json" | Out-String | ConvertFrom-Json

# basic query using equals
$data.items.item | where {$_.type -eq "filled"}

# basic query using greater than
$data.items.item | where {$_.ppu -gt 0.65}

# basic query using greater than or equal to
$data.items.item | where {$_.ppu -ge 0.65}

# basic query with projection
$data.items.item | where {$_.type -eq "filled"}