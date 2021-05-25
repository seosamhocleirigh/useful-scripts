# load in json for querying
$data=Get-Content ".\simple.json" | Out-String | ConvertFrom-Json
$products = $data.products


# example: basic equals
$products | where { $_.Name -eq "Product1" }
$products | where { $_.Name -eq "product1" } # not case sensitive so will work the same
$products | where Name -eq "product1" # will also work

# results:
# Name     Color Shape  WeightInKgs
# ----     ----- -----  -----------
# Product1 Green Square           5


# example: basic not equals
$products | where Shape -neq "Square"

# results:
# Name     Color  Shape    WeightInKgs
# ----     -----  -----    -----------
# Product3 Red    Circle             3
# Product4 Yellow Triangle          10


# example: multiple conditions with -and
$products | where { $_.Shape -eq "Square" -and $_.Name -eq "Product1" }

# results:
# Name     Color Shape  WeightInKgs
# ----     ----- -----  -----------
# Product1 Green Square           5


# example: multiple conditions with -or
$products | where { $_.Shape -eq "triangle" -or $_.color -eq "red" }

# results
# Name     Color  Shape    WeightInKgs
# ----     -----  -----    -----------
# Product3 Red    Circle             3
# Product4 Yellow Triangle          10


# example: greater than
$products | where { $_.WeightInKgs -gt 4 }

# results:
# Name     Color  Shape    WeightInKgs
# ----     -----  -----    -----------
# Product1 Green  Square             5
# Product4 Yellow Triangle          10


# example: less than
$products | where { $_.WeightInKgs -lt 4 }

# results:
# Name     Color Shape  WeightInKgs
# ----     ----- -----  -----------
# Product2 Blue  Square           1
# Product3 Red   Circle           3


# example: less than or equal to
$products | where { $_.WeightInKgs -le 3 }

# results:
# Name     Color Shape  WeightInKgs
# ----     ----- -----  -----------
# Product2 Blue  Square           1
# Product3 Red   Circle           3


# example: greater than or equal to
$products | where { $_.WeightInKgs -ge 5 }

# results:
# Name     Color  Shape    WeightInKgs
# ----     -----  -----    -----------
# Product1 Green  Square             5
# Product4 Yellow Triangle          10


# example: like with wildcard
$products | where { $_.Color -like "gr*" }

# results:
# Name     Color Shape  WeightInKgs
# ----     ----- -----  -----------
# Product1 Green Square           5


# example: Regex - starts with
$products | where { $_.Shape -match "^tri.*" }
$products | where { $_.Shape -match "^ri.*" } # returns nothing

# results:
# Name     Color  Shape    WeightInKgs
# ----     -----  -----    -----------
# Product4 Yellow Triangle          10


# example: Regex - contains
$products | where { $_.Color -match "lo" }

# results:
# Name     Color  Shape    WeightInKgs
# ----     -----  -----    -----------
# Product4 Yellow Triangle          10