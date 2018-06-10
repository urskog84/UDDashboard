New-UDPage -Name "New device" -Icon android -Content {
    
    New-UDColumn  -SmallSize 7 -Content {    
        New-UDInput @AlternateColors -Title "New device" -SubmitText "Add Device" -Content {
            New-UDInputField -Name 'DeviceTyp' -Placeholder 'DeviceTyp' -Type 'select' -Values @("LarmPC", "Evoko", "PC") -DefaultValue "PC"
            New-UDInputField -Name "Hostname" -Placeholder "Enter Mac Hostname" -Type "textbox"
            New-UDInputField -Name "MacAddress" -Placeholder "Enter Mac address" -Type "textbox"
            New-UDInputField -Name 'SiteID' -Placeholder 'Site' -Type 'select' -Values @("GOV", "NRK", "FLE")  -DefaultValue "GOV"
        } -Endpoint {
            param( $DeviceTyp, $MacAddress, $SiteID, $Hostname ) 
        
            New-UDInputAction -Content @(
                New-UDCard @AlternateColors -Title "You have created a new $DeviceTyp deivce" -Text " with $Hostname and $mac on  site $site"
            )

        }
    }

}