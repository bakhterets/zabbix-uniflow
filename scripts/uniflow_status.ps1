<#
Get dpm alerts
Version 1.0

Description: get uniflow last successfully connection date.

Ilia Bakhterev
bakhterets@gmail.com
#>
#
$content = ((Invoke-WebRequest -Uri http://localhost:8000/status.htm).content) -split "<LI>"
$rawdate = (($content | Where-Object {$_ -like "Last*"}) -split "&nbsp")[0].trim("Last Successful Connection:")
$date = Get-Date -Date $rawdate -UFormat %s
$date