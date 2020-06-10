# https://regex101.com/
# https://www.regextester.com/

# Useful for extracting useful information from an input file
# Sample usage: I used this for extracting stored procedure names into a list from
# a C# file for a task, there were far too many to do this manually

$outputFilePathAndName = '.\<file-name>.txt'
$pattern = ""
$text = Get-Content $outputFilePathAndName
$m = Select-String -InputObject $text -Pattern $pattern -AllMatches
$m.Matches.Value >> '.\<file-name>.txt'