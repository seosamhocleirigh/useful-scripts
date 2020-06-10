# https://regex101.com/
# https://www.regextester.com/

$outputFilePathAndName = '.\test-file.txt'
$pattern = "@KolobCanyon_."
$text = Get-Content $outputFilePathAndName
$m = Select-String -InputObject $text -Pattern $pattern -AllMatches
$m.Matches.Value >> '.\test-results.txt'