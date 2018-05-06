
Get-UDDashboard | Stop-UDDashboard

$Dashbord = New-UDDashboard -Title Portal -Content {

    New-UDInput -Title "Form" -Id "Form" -Content {
        New-UDInputField -Type 'textbox' -Name 'Module' -Placeholder 'Seach for a Module' -DefaultValue "Posh-SSH"
    }-Endpoint {
        param($Module)
 
        $Module = Find-Module $Module   

        New-UDInputAction -Content @(
            New-UDLayout -Columns 3 -Content {  
                New-UDCard  -Title "$($Module.Name) - $($Module.Version)" -Text $Module.Description
                New-UDCard  -Title "$($Module.Name) - $($Module.Version)" -Text $Module.Repository
                New-UDTable -id "tabel" -Headers @(" ", " ")  -Title "table" -Endpoint { 
                    $Module | Out-UDTableData -Property @("name", "Author")
                }
                New-UdGrid -Title "Processes" -Headers @("Name", "ID", "Working Set", "CPU") -Properties @("Name", "Id", "WorkingSet", "CPU") -AutoRefresh -RefreshInterval 60 -Endpoint {
                    Get-Process | Out-UDGridData
                }

            } 
        )

    }
}


Start-UDDashboard -Dashboard $Dashbord -Port 8080 -AutoReload

