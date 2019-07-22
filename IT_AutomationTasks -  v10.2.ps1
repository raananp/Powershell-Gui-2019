$FormStartingPoint = "Introduction"
[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$MainForm                            = New-Object system.Windows.Forms.Form
$MainForm.ClientSize                 = '600,300'
$MainForm.text                       = "Liveperson IT Automation Tasks"
$MainForm.TopMost                    = $false
$MainForm.BackColor                  = "#f2efef"
$MainForm.AutoScale                  = $false
$MainForm.StartPosition              = "CenterScreen"
$MainForm.ShowInTaskbar              = $True
$MainForm.MinimizeBox                = $False
$MainForm.MaximizeBox                = $False
$MainForm.BringToFront()


$MainFormIntroduction
$MainFormIntroduction                          = New-Object system.Windows.Forms.Label
$MainFormIntroduction.text                     = "Introduction"
$MainFormIntroduction.AutoSize                 = $true
$MainFormIntroduction.width                    = 25
$MainFormIntroduction.height                   = 10
$MainFormIntroduction.location                 = New-Object System.Drawing.Point(10,10)
$MainFormIntroduction.Font                     = 'Microsoft Sans Serif,10,style=bold,Underline'

$MainFormIntroductionExplain
$MainFormIntroductionExplain                          = New-Object system.Windows.Forms.Label
$MainFormIntroductionExplainText = "Liveperson IT Automation Tasks`n`nCreated By 'Service Desk Team' to automate IT Daily Tasks`n`n* User Action section :`n  * User Separation   - Disable user Account And Gmail Account`n  * OnBoarding        - Partner/Contrator/Service Account`n`n* Assets Action :`n  * Delete Computer From JAMF DataBase`n  * Delete Computer From AD    DataBase`n  *  Delete  Computer From Sccm DataBase"
$MainFormIntroductionExplain.text                     = $MainFormIntroductionExplainText 
$MainFormIntroductionExplain.AutoSize                 = $true
$MainFormIntroductionExplain.width                    = 25
$MainFormIntroductionExplain.height                   = 10
$MainFormIntroductionExplain.location                 = New-Object System.Drawing.Point(0,0)
$MainFormIntroductionExplain.Font                     = 'Microsoft Sans Serif,10'
#$MainFormIntroductionExplain.BringToFront()

$MainFormUserLogedin
$MainFormUserLogedin                          = New-Object system.Windows.Forms.Label
$MainFormUserLogedinENV                          = "Hey  $($env:USERNAME)  Welcom"
$MainFormUserLogedin.text                     = $MainFormUserLogedinENV 
$MainFormUserLogedin.AutoSize                 = $true
$MainFormUserLogedin.width                    = 25
$MainFormUserLogedin.height                   = 10
$MainFormUserLogedin.location                 = New-Object System.Drawing.Point(140,5)
$MainFormUserLogedin.Font                     = 'Microsoft Sans Serif,10,style=Underline'

$MainFormLabelUserAction                          = New-Object system.Windows.Forms.Label
$MainFormLabelUserAction.text                     = "User Action"
$MainFormLabelUserAction.AutoSize                 = $true
$MainFormLabelUserAction.width                    = 25
$MainFormLabelUserAction.height                   = 10
$MainFormLabelUserAction.location                 = New-Object System.Drawing.Point(10,50)
$MainFormLabelUserAction.Font                     = 'Microsoft Sans Serif,10'

$MainFormLabelAssetsAction                          = New-Object system.Windows.Forms.Label
$MainFormLabelAssetsAction.text                     = "Assets Action"
$MainFormLabelAssetsAction.AutoSize                 = $true
$MainFormLabelAssetsAction.width                    = 25
$MainFormLabelAssetsAction.height                   = 10
$MainFormLabelAssetsAction.location                 = New-Object System.Drawing.Point(10,100)
$MainFormLabelAssetsAction.Font                     = 'Microsoft Sans Serif,10'

$MainFormLabelsummary                          = New-Object system.Windows.Forms.Label
$MainFormLabelsummary.text                     = "Summary"
$MainFormLabelsummary.AutoSize                 = $true
$MainFormLabelsummary.width                    = 25
$MainFormLabelsummary.height                   = 10
$MainFormLabelsummary.location                 = New-Object System.Drawing.Point(10,150)
$MainFormLabelsummary.Font                     = 'Microsoft Sans Serif,10'


$MainFormPanel1                          = New-Object system.Windows.Forms.Panel
$MainFormPanel1.height                   = 240
$MainFormPanel1.width                    = 430
$MainFormPanel1.location                 = New-Object System.Drawing.Point(140,30)
$MainFormPanel1.BackColor                = "#f0f4f4"
#$MainFormPanel1.UseWaitCursor=$True



$MainFormcloseButton                     = New-Object system.Windows.Forms.Button
$MainFormcloseButton.text                = "Close"
$MainFormcloseButton.width               = 80
$MainFormcloseButton.height              = 20
$MainFormcloseButton.location            = New-Object System.Drawing.Point(500,280)
$MainFormcloseButton.Font                = 'Microsoft Sans Serif,10'


#Load Form And Object into Panel
$MainForm.controls.AddRange(@($MainFormcloseButton,$MainFormLabelUserAction,$MainFormPanel1,$MainFormIntroduction,$MainFormLabelAssetsAction,$MainFormLabelsummary,$MainFormUserLogedin))
$MainFormPanel1.controls.AddRange(@($MainFormIntroductionExplain))


#Function 
Function MainForm-MouseBehavior{
 param(
 $Action
 )
 Switch ($Action)
    {
        "MouseHover-Introduction" {$MainFormIntroduction.ForeColor      = "#f79d04";$MainForm.Cursor="Hand"}
        "MouseHover-UserAction"   {$MainFormLabelUserAction.ForeColor   = "#f79d04";$MainForm.Cursor="Hand"}
        "MouseHover-AssetsAction" {$MainFormLabelAssetsAction.ForeColor = "#f79d04";$MainForm.Cursor="Hand"}
        "MouseHover-summary"      {$MainFormLabelsummary.ForeColor      = "#f79d04";$MainForm.Cursor="Hand"}
        "MouseLeave-Introduction" {$MainFormIntroduction.ForeColor      = "#000000";$MainForm.Cursor="Default" }
        "MouseLeave-UserAction"   {$MainFormLabelUserAction.ForeColor   = "#000000";$MainForm.Cursor="Default"}
        "MouseLeave-AssetsAction" {$MainFormLabelAssetsAction.ForeColor = "#000000";$MainForm.Cursor="Default"}       
        "MouseLeave-summary"      {$MainFormLabelsummary.ForeColor      = "#000000";$MainForm.Cursor="Default"}
    }
$Global:Action="No"
 }

Function MainForm-LabelClicked{
param(
 $ClickOn
 )
    Switch ($ClickOn)
        {
            "Introduction" {Write-Host "$ClickOn clicked";Change-LabelText}
            "UserAction" {Write-Host "$ClickOn clicked";Change-LabelText}
            "AssetsAction"{Write-Host "$ClickOn clicked";Change-LabelText}
            "summary"{Write-Host "$ClickOn clicked";Change-LabelText}
        }
}

Function Change-LabelText{
    Switch ($ClickOn)
        {
            "Introduction" {$MainFormIntroduction.font = 'Microsoft Sans Serif,10,style=bold,Underline';$MainFormLabelUserAction.font = 'Microsoft Sans Serif,10';$MainFormLabelAssetsAction.font = 'Microsoft Sans Serif,10';$MainFormLabelsummary.font = 'Microsoft Sans Serif,10'}
            "UserAction" {$MainFormLabelUserAction.font = 'Microsoft Sans Serif,10,style=bold,Underline';$MainFormIntroduction.font = 'Microsoft Sans Serif,10';$MainFormLabelAssetsAction.font = 'Microsoft Sans Serif,10';$MainFormLabelsummary.font = 'Microsoft Sans Serif,10'}
            "AssetsAction"{$MainFormLabelAssetsAction.font = 'Microsoft Sans Serif,10,style=bold,Underline';$MainFormIntroduction.font = 'Microsoft Sans Serif,10';$MainFormLabelUserAction.font = 'Microsoft Sans Serif,10';$MainFormLabelsummary.font = 'Microsoft Sans Serif,10'}
            "summary"{$MainFormLabelsummary.font = 'Microsoft Sans Serif,10,style=bold,Underline';$MainFormIntroduction.font = 'Microsoft Sans Serif,10';$MainFormLabelUserAction.font = 'Microsoft Sans Serif,10';$MainFormLabelAssetsAction.font = 'Microsoft Sans Serif,10'}
        }
}

#Mouse hoverOver And leave Function
#**************************************************
$MainFormIntroduction.Add_MouseHover({  
$Action="MouseHover-Introduction";MainForm-MouseBehavior -Action $Action
})

$MainFormIntroduction.Add_MouseLeave({ 
$Action="MouseLeave-Introduction";MainForm-MouseBehavior -Action $Action

})

$MainFormIntroduction.Add_Click({ 
$ClickOn = "Introduction";  MainForm-LabelClicked -ClickOn $ClickOn
 })
#**************************************************

$MainFormLabelUserAction.Add_MouseHover({  
$Action="MouseHover-UserAction";MainForm-MouseBehavior -Action $Action
})

$MainFormLabelUserAction.Add_MouseLeave({ 
$Action="MouseLeave-UserAction";MainForm-MouseBehavior -Action $Action
})

$MainFormLabelUserAction.Add_Click({ 
$ClickOn = "UserAction";  MainForm-LabelClicked -ClickOn $ClickOn
})
#**************************************************

$MainFormLabelAssetsAction.Add_MouseHover({  
$Action="MouseHover-AssetsAction";MainForm-MouseBehavior -Action $Action
})

$MainFormLabelAssetsAction.Add_MouseLeave({ 
$Action="MouseLeave-AssetsAction";MainForm-MouseBehavior -Action $Action
})

$MainFormLabelAssetsAction.Add_Click({ 
$ClickOn = "AssetsAction";  MainForm-LabelClicked -ClickOn $ClickOn
})
#**************************************************

$MainFormLabelsummary.Add_MouseHover({  
$Action="MouseHover-summary";MainForm-MouseBehavior -Action $Action
})

$MainFormLabelsummary.Add_MouseLeave({ 
$Action="MouseLeave-summary";MainForm-MouseBehavior -Action $Action
})

$MainFormLabelsummary.Add_Click({ 
$ClickOn = "summary";  MainForm-LabelClicked -ClickOn $ClickOn  
})
#**************************************************


#**************************************************
$MainFormcloseButton.Add_Click({$MainForm.Close()})
#**************************************************

[void]$MainForm.ShowDialog()