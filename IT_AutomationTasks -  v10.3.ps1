$FormStartingPoint = "Introduction"
[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$MainForm                             = New-Object system.Windows.Forms.Form
$MainForm.ClientSize                  = '600,300'
$MainForm.text                        = "IT Automation Tasks"
$MainForm.TopMost                     = $false
$MainForm.BackColor                   = "#f2efef"
$MainForm.AutoScale                   = $false
$MainForm.StartPosition               = "CenterScreen"
$MainForm.ShowInTaskbar               = $True
$MainForm.MinimizeBox                 = $False
$MainForm.MaximizeBox                 = $False
$MainForm.BringToFront()


$MainFormLabelIntroduction
$MainFormLabelIntroduction            = New-Object system.Windows.Forms.Label
$MainFormLabelIntroduction.text       = "Introduction"
$MainFormLabelIntroduction.AutoSize   = $true
$MainFormLabelIntroduction.width      = 25
$MainFormLabelIntroduction.height     = 10
$MainFormLabelIntroduction.location   = New-Object System.Drawing.Point(10,10)
$MainFormLabelIntroduction.Font       = 'Microsoft Sans Serif,10,style=bold,Underline'

$MainFormUserLogedin
$MainFormUserLogedin                  = New-Object system.Windows.Forms.Label
$MainFormUserLogedinENV               = "Hey  $($env:USERNAME) "
$MainFormUserLogedin.text             = $MainFormUserLogedinENV 
$MainFormUserLogedin.AutoSize         = $true
$MainFormUserLogedin.width            = 25
$MainFormUserLogedin.height           = 10
$MainFormUserLogedin.location         = New-Object System.Drawing.Point(140,5)
$MainFormUserLogedin.Font             = 'Microsoft Sans Serif,10,style=bold'

$MainFormLabelUserAction              = New-Object system.Windows.Forms.Label
$MainFormLabelUserAction.text         = "User Action"
$MainFormLabelUserAction.AutoSize     = $true
$MainFormLabelUserAction.width        = 25
$MainFormLabelUserAction.height       = 10
$MainFormLabelUserAction.location     = New-Object System.Drawing.Point(10,50)
$MainFormLabelUserAction.Font         = 'Microsoft Sans Serif,10'

$MainFormLabelAssetsAction            = New-Object system.Windows.Forms.Label
$MainFormLabelAssetsAction.text       = "Assets Action"
$MainFormLabelAssetsAction.AutoSize   = $true
$MainFormLabelAssetsAction.width      = 25
$MainFormLabelAssetsAction.height     = 10
$MainFormLabelAssetsAction.location   = New-Object System.Drawing.Point(10,100)
$MainFormLabelAssetsAction.Font       = 'Microsoft Sans Serif,10'

$MainFormLabelsummary                 = New-Object system.Windows.Forms.Label
$MainFormLabelsummary.text            = "Summary"
$MainFormLabelsummary.AutoSize        = $true
$MainFormLabelsummary.width           = 25
$MainFormLabelsummary.height          = 10
$MainFormLabelsummary.location        = New-Object System.Drawing.Point(10,150)
$MainFormLabelsummary.Font            = 'Microsoft Sans Serif,10'
$MainFormLabelsummary.Enabled         = $false

$MainFormPanel1                       = New-Object system.Windows.Forms.Panel
$MainFormPanel1.height                = 240
$MainFormPanel1.width                 = 430
$MainFormPanel1.location              = New-Object System.Drawing.Point(140,30)
$MainFormPanel1.BackColor             = "#f0f4f4"
#$MainFormPanel1.UseWaitCursor=$True

$MainFormIntroductionExplain
$MainFormIntroductionExplain          = New-Object system.Windows.Forms.Label
$MainFormIntroductionExplainText      = "IT Automation Task
`n`nThis software allows you to perform 
multiple operations against different systems 
from one place.
`n`n`n`nWarning : 
Some of the actions are irreversible
And must be performed with extreme caution!."
$MainFormIntroductionExplain.text     = $MainFormIntroductionExplainText 
$MainFormIntroductionExplain.AutoSize = $true
$MainFormIntroductionExplain.width    = 25
$MainFormIntroductionExplain.height   = 10
$MainFormIntroductionExplain.location = New-Object System.Drawing.Point(0,0)
$MainFormIntroductionExplain.Font     = 'Microsoft Sans Serif,12'
#$MainFormIntroductionExplain.BringToFront()

$MainFormcloseButton                  = New-Object system.Windows.Forms.Button
$MainFormcloseButton.text             = "Close"
$MainFormcloseButton.width            = 80
$MainFormcloseButton.height           = 20
$MainFormcloseButton.location         = New-Object System.Drawing.Point(500,280)
$MainFormcloseButton.Font             = 'Microsoft Sans Serif,10'


#Load Form And Object into Panel
$MainForm.controls.AddRange(@($MainFormcloseButton,$MainFormLabelUserAction,$MainFormPanel1,$MainFormLabelIntroduction,$MainFormLabelAssetsAction,$MainFormLabelsummary,$MainFormUserLogedin))
$MainFormPanel1.controls.AddRange(@($MainFormIntroductionExplain))


#Function 
Function MainForm-MouseBehavior{
 param(
 $Action
 )
 Switch ($Action)
    {
        "MouseHover-Introduction" {$MainFormLabelIntroduction.ForeColor      = "#f79d04";$MainForm.Cursor="Hand"}
        "MouseHover-UserAction"   {$MainFormLabelUserAction.ForeColor   = "#f79d04";$MainForm.Cursor="Hand"}
        "MouseHover-AssetsAction" {$MainFormLabelAssetsAction.ForeColor = "#f79d04";$MainForm.Cursor="Hand"}
        "MouseLeave-Introduction" {$MainFormLabelIntroduction.ForeColor      = "#000000";$MainForm.Cursor="Default" }
        "MouseLeave-UserAction"   {$MainFormLabelUserAction.ForeColor   = "#000000";$MainForm.Cursor="Default"}
        "MouseLeave-AssetsAction" {$MainFormLabelAssetsAction.ForeColor = "#000000";$MainForm.Cursor="Default"}       
    }
$Global:Action="No"
 }

Function MainForm-LabelClicked{
param(
 $ClickOn
 )
    Switch ($ClickOn)
        {
            "Introduction" {Write-Host "$ClickOn clicked";Change-LabelText;MainForm-Explain;Create-Button}
            "UserAction" {Write-Host "$ClickOn clicked";Change-LabelText;MainForm-Explain;Create-Button}
            "AssetsAction"{Write-Host "$ClickOn clicked";Change-LabelText;MainForm-Explain;Create-Button}
            "summary"{Write-Host "$ClickOn clicked"}
        }
}

Function Change-LabelText{
    Switch ($ClickOn)
        {
            "Introduction" {$MainFormLabelIntroduction.font = 'Microsoft Sans Serif,10,style=bold,Underline';$MainFormLabelUserAction.font = 'Microsoft Sans Serif,10';$MainFormLabelAssetsAction.font = 'Microsoft Sans Serif,10';$MainFormLabelsummary.font = 'Microsoft Sans Serif,10'}
            "UserAction" {$MainFormLabelUserAction.font = 'Microsoft Sans Serif,10,style=bold,Underline';$MainFormLabelIntroduction.font = 'Microsoft Sans Serif,10';$MainFormLabelAssetsAction.font = 'Microsoft Sans Serif,10';$MainFormLabelsummary.font = 'Microsoft Sans Serif,10'}
            "AssetsAction"{$MainFormLabelAssetsAction.font = 'Microsoft Sans Serif,10,style=bold,Underline';$MainFormLabelIntroduction.font = 'Microsoft Sans Serif,10';$MainFormLabelUserAction.font = 'Microsoft Sans Serif,10';$MainFormLabelsummary.font = 'Microsoft Sans Serif,10'}
            
        }
}

Function MainForm-Explain{
Switch ($ClickOn)
        {
            "Introduction" {$MainFormIntroductionExplain.text  = $MainFormIntroductionExplainText}
            "UserAction" {$MainFormIntroductionExplain.text  = "";}
            "AssetsAction" {$MainFormIntroductionExplain.text  = ""}
            
        }
}

Function Create-Button{

    Switch ($ClickOn)
        {
            "Introduction"{Clean-FormButton}
            "UserAction"{Clean-FormButton
                $global:OffboardingButton                  = New-Object system.Windows.Forms.RadioButton
                $OffboardingButton.text                    = "User Offboarding"
                $OffboardingButton.width                   = 200
                $OffboardingButton.height                  = 20
                $OffboardingButton.location                = New-Object System.Drawing.Point(5,10)
                $OffboardingButton.Font                    = 'Microsoft Sans Serif,10'   
                
                $global:OffboardingButtonInfo                        = New-Object system.Windows.Forms.label
                $OffboardingButtonInfo.text                   = "     This action will delete the user from all organizational systems`n     Including access to his PC, once submitted this action is irreversible,`n     Use with precaution"
                $OffboardingButtonInfo.AutoSize               = $true
                $OffboardingButtonInfo.width                  = 25
                $OffboardingButtonInfo.height                 = 10
                $OffboardingButtonInfo.location               = New-Object System.Drawing.Point(5,40)
                $OffboardingButtonInfo.Font                   = 'Microsoft Sans Serif,8'  
                
                $globaL:OnBoardingButton                  = New-Object system.Windows.Forms.RadioButton
                $OnBoardingButton.text                    = "User OnBoarding"
                $OnBoardingButton.width                   = 200
                $OnBoardingButton.height                  = 20
                $OnBoardingButton.location                = New-Object System.Drawing.Point(5,100)
                $OnBoardingButton.Font                    = 'Microsoft Sans Serif,10'

                $global:OnBoardingButtonInfo                        = New-Object system.Windows.Forms.label
                $OnBoardingButtonInfo.text                   = "     This action will delete the user from all organizational systems`n     Including access to his PC, once submitted this action is irreversible,`n     Use with precaution"
                $OnBoardingButtonInfo.AutoSize               = $true
                $OnBoardingButtonInfo.width                  = 25
                $OnBoardingButtonInfo.height                 = 10
                $OnBoardingButtonInfo.location               = New-Object System.Drawing.Point(5,130)
                $OnBoardingButtonInfo.Font                   = 'Microsoft Sans Serif,8'

                
                Click-Button 

                $MainFormPanel1.controls.AddRange(@($OffboardingButton,$OnBoardingButton,$OffboardingButtonInfo,$OnBoardingButtonInfo))
              }
            "AssetsAction"{Clean-FormButton
                $global:DeleteMACFromJAMFButton                  = New-Object system.Windows.Forms.RadioButton
                $DeleteMACFromJAMFButton.text                    = "Delete MAC From JAMF"
                $DeleteMACFromJAMFButton.width                   = 200
                $DeleteMACFromJAMFButton.height                  = 20
                $DeleteMACFromJAMFButton.location                = New-Object System.Drawing.Point(5,10)
                $DeleteMACFromJAMFButton.Font                    = 'Microsoft Sans Serif,10'

                $global:DeleteMACFromJAMFButtonInfo                        = New-Object system.Windows.Forms.label
                $DeleteMACFromJAMFButtonInfo.text                   = "     This action will delete Mac from JAMF DataBase`n     This actoin will remove JAMF abilitiy to manage this computer"
                $DeleteMACFromJAMFButtonInfo.AutoSize               = $true
                $DeleteMACFromJAMFButtonInfo.width                  = 25
                $DeleteMACFromJAMFButtonInfo.height                 = 10
                $DeleteMACFromJAMFButtonInfo.location               = New-Object System.Drawing.Point(5,30)
                $DeleteMACFromJAMFButtonInfo.Font                   = 'Microsoft Sans Serif,8'
               
                $globaL:DeleteComputerObjectFromADButton                  = New-Object system.Windows.Forms.RadioButton
                $DeleteComputerObjectFromADButton.text                    = "Delete Computer Object From AD"
                $DeleteComputerObjectFromADButton.width                   = 400
                $DeleteComputerObjectFromADButton.height                  = 20
                $DeleteComputerObjectFromADButton.location                = New-Object System.Drawing.Point(5,80)
                $DeleteComputerObjectFromADButton.Font                    = 'Microsoft Sans Serif,10'

                $global:DeleteComputerObjectFromADButtonInfo                        = New-Object system.Windows.Forms.label
                $DeleteComputerObjectFromADButtonInfo.text                   = "     This action will delete Windows from Active directory DataBase`n     This actoin can cause An Error ""trust relationship has been broken"""
                $DeleteComputerObjectFromADButtonInfo.AutoSize               = $true
                $DeleteComputerObjectFromADButtonInfo.width                  = 25
                $DeleteComputerObjectFromADButtonInfo.height                 = 10
                $DeleteComputerObjectFromADButtonInfo.location               = New-Object System.Drawing.Point(5,100)
                $DeleteComputerObjectFromADButtonInfo.Font                   = 'Microsoft Sans Serif,8'

                $globaL:DeleteComputerFromSCCMButton                  = New-Object system.Windows.Forms.RadioButton
                $DeleteComputerFromSCCMButton.text                    = "Delete Computer From SCCM"
                $DeleteComputerFromSCCMButton.width                   = 300
                $DeleteComputerFromSCCMButton.height                  = 20
                $DeleteComputerFromSCCMButton.location                = New-Object System.Drawing.Point(5,140)
                $DeleteComputerFromSCCMButton.Font                    = 'Microsoft Sans Serif,10'

                $global:DeleteComputerFromSCCMButtonInfo                        = New-Object system.Windows.Forms.label
                $DeleteComputerFromSCCMButtonInfo.text                   = "     This action will delete Windows from SCCM DataBase"
                $DeleteComputerFromSCCMButtonInfo.AutoSize               = $true
                $DeleteComputerFromSCCMButtonInfo.width                  = 25
                $DeleteComputerFromSCCMButtonInfo.height                 = 10
                $DeleteComputerFromSCCMButtonInfo.location               = New-Object System.Drawing.Point(5,160)
                $DeleteComputerFromSCCMButtonInfo.Font                   = 'Microsoft Sans Serif,8'

                
                Click-Button

                $MainFormPanel1.controls.AddRange(@($DeleteMACFromJAMFButton,$DeleteComputerObjectFromADButton,$DeleteComputerFromSCCMButton,$DeleteMACFromJAMFButtonInfo,$DeleteComputerObjectFromADButtonInfo,$DeleteComputerFromSCCMButtonInfo))
              }
        }
    
}

Function Clean-FormButton{
    switch ($ClickOn)
        {
            "Introduction" {$OffboardingButton.Dispose();$OnBoardingButton.Dispose();$DeleteMACFromJAMFButton.Dispose();$DeleteComputerObjectFromADButton.Dispose();$DeleteComputerFromSCCMButton.Dispose();$OffboardingButtonInfo.Dispose();$OnBoardingButtonInfo.Dispose();$DeleteMACFromJAMFButtonInfo.Dispose();$DeleteComputerObjectFromADButtonInfo.Dispose();$DeleteComputerFromSCCMButtonInfo.Dispose()}
            "UserAction"   {$DeleteMACFromJAMFButton.Dispose();$DeleteComputerObjectFromADButton.Dispose();$DeleteComputerFromSCCMButton.Dispose();$DeleteMACFromJAMFButtonInfo.Dispose();$DeleteComputerObjectFromADButtonInfo.Dispose();$DeleteComputerFromSCCMButtonInfo.Dispose()}
            "AssetsAction" {$OffboardingButton.Dispose();$OnBoardingButton.Dispose();$OffboardingButtonInfo.Dispose();$OnBoardingButtonInfo.Dispose()}
        }
}

Function Click-Button{

             $OffboardingButton.Add_Click({ Write-Host "OffboardingButton clicked" }) 
             $OnBoardingButton.Add_Click({ Write-Host "OnBoardingButton clicked" })
             $DeleteMACFromJAMFButton.Add_Click({ Write-Host "DeleteMACFromJAMFButton clicked" })
             $DeleteComputerObjectFromADButton.Add_Click({ Write-Host "DeleteComputerObjectFromADButton clicked" })
             $DeleteComputerFromSCCMButton.Add_Click({ Write-Host "DeleteComputerFromSCCMButton clicked" })
             
       
}


#Mouse hoverOver And leave Function
#**************************************************
$MainFormLabelIntroduction.Add_MouseHover({  
$Action="MouseHover-Introduction";MainForm-MouseBehavior -Action $Action
})

$MainFormLabelIntroduction.Add_MouseLeave({ 
$Action="MouseLeave-Introduction";MainForm-MouseBehavior -Action $Action

})

$MainFormLabelIntroduction.Add_Click({ 
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
