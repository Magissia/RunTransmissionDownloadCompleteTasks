function StartTransmissionDownloadCompleteTasks ([Parameter(Mandatory=$True)][String]$WorkingDirectory)
{
	Get-Childitem -Path $WorkingDirectory -Filter *.ps1	| % {& $_.FullName}
	Get-Childitem -Path $WorkingDirectory -Filter *.bat	| % {& $_.FullName}
	Get-Childitem -Path $WorkingDirectory -Filter *.py	| % {& $_.FullName}
	Get-Childitem -Path $WorkingDirectory -Filter *.rb	| % {& $_.FullName}
}

If ($env:TransmissionScripts -ne $null ) {
	StartTransmissionDownloadCompelteTasks $env:TransmissionScripts
}
If ("$env:LOCALAPPDATA\transmission\scripts" -ne $null) {
	StartTransmissionDownloadCompleteTasks $env:LOCALAPPDATA\transmission\scripts
}
If ("$env:APPDATA\transmission\scripts" -ne $null) {
	StartTransmissionDownloadCompleteTasks $env:APPDATA\transmission\scripts
}

$TR_TORRENT_DIR > $env:TMP/transmission_test.txt