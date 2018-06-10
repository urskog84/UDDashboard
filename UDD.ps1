#Load env varibalse
$MyenvPath = Join-Path $PSScriptRoot "env.ps1"
Write-Host $MyenvPath

if (Test-Path $MyenvPath ) {
    $MyenvPath
}
else {
    break
}


$NavBarLinks = @((New-UDLink -Text "Buy Universal Dashboard" -Url "https://ironmansoftware.com/universal-dashboard/" -Icon heart_o),
    (New-UDLink -Text "Documentation" -Url "https://www.gitbook.com/book/adamdriscoll/powershell-universal-dashboard/details" -Icon book))


$Colors = @{
    BackgroundColor = "#252525"
    FontColor       = "#FFFFFF"
}

$AlternateColors = @{
    BackgroundColor = "#4081C9"
    FontColor       = "#FFFFFF"
}

$Footer = . (Join-Path $PSScriptRoot "footer.ps1")
$HomePage = . (Join-Path $PSScriptRoot "pages\home.ps1")
$NewDevice = . (Join-Path $PSScriptRoot "pages\newdevice.ps1")
$search = . (Join-Path $PSScriptRoot "pages\searchdevice.ps1")
$Word = . (Join-Path $PSScriptRoot "pages\word.ps1") 



Get-UDDashboard | Stop-UDDashboard

Start-UDDashboard -Content { 
    New-UDDashboard -NavbarLinks $NavBarLinks -Title "Admin Portal" -NavBarColor '#FF1c1c1c' -NavBarFontColor "#FF55b3ff"`
        -BackgroundColor "#FF333333" -FontColor "#FFFFFFF"`
        -Pages @(
        $HomePage,
        $NewDevice,
        $search
        $word
    ) -Footer $Footer
} -Port 10001 -AutoReload


# holger