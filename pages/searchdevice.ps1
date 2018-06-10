New-UDPage -Name "search devices" -Icon search -Content {
    
    New-UDColumn  -SmallSize 7 -Content {    
        New-UDInput @AlternateColors -Title "search devices" -SubmitText "Add Device" -Content {
            New-UDInputField -Name 'DeviceTyp' -Placeholder 'DeviceTyp' -Type 'select' -Values @("LarmPC", "Evoko", "PC")
            New-UDInputField -Name "Hostname" -Placeholder "Enter Mac Hostname" -Type "textbox"
        } -Endpoint {
            param( $DeviceTyp, $MacAddress, $SiteID, $Hostname ) 
        
            New-UDInputAction -Content @(
                New-UDCard -Title "You have created a new $DeviceTyp deivce" -Text " with $Hostname and $mac on  site $site"
            )

        }
    }

}