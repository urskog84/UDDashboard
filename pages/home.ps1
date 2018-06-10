New-UDPage -Name "Home" -Icon home -Content {
    New-UDRow {
        New-UDColumn -Size 12 {
            New-UDHtml -Markup "<div class='center-align white-text'><h3>Beautiful holger. All PowerShell.</h3></h3>
            <h5>Universal Dashboard is a cross-platform PowerShell module for developing and hosting web-based, interactive dashboards.</h5></div>"
        }
    }
}