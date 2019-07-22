$FormStartingPoint = "Introduction"
[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$MainForm                             = New-Object system.Windows.Forms.Form
$MainForm.ClientSize                  = '700,400'
$MainForm.text                        = "Hey  $($env:USERNAME) And Welcome to My IT Automation Tasks"
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
$MainFormLabelIntroduction.ForeColor  = "#646da9"

$MainFormLabelUserAction              = New-Object system.Windows.Forms.Label
$MainFormLabelUserAction.text         = "User Action"
$MainFormLabelUserAction.AutoSize     = $true
$MainFormLabelUserAction.width        = 25
$MainFormLabelUserAction.height       = 10
$MainFormLabelUserAction.location     = New-Object System.Drawing.Point(10,60)
$MainFormLabelUserAction.Font         = 'Microsoft Sans Serif,10'
$MainFormLabelUserAction.ForeColor  = "#646da9"

$MainFormLabelAssetsAction            = New-Object system.Windows.Forms.Label
$MainFormLabelAssetsAction.text       = "Assets Action"
$MainFormLabelAssetsAction.AutoSize   = $true
$MainFormLabelAssetsAction.width      = 25
$MainFormLabelAssetsAction.height     = 10
$MainFormLabelAssetsAction.location   = New-Object System.Drawing.Point(10,120)
$MainFormLabelAssetsAction.Font       = 'Microsoft Sans Serif,10'
$MainFormLabelAssetsAction.ForeColor  = "#646da9"

$MainFormLabelsummary                 = New-Object system.Windows.Forms.Label
$MainFormLabelsummary.text            = "Summary"
$MainFormLabelsummary.AutoSize        = $true
$MainFormLabelsummary.width           = 25
$MainFormLabelsummary.height          = 10
$MainFormLabelsummary.location        = New-Object System.Drawing.Point(10,200)
$MainFormLabelsummary.Font            = 'Microsoft Sans Serif,10'
$MainFormLabelsummary.Enabled         = $false

$MainFormPanel1                       = New-Object system.Windows.Forms.Panel
$MainFormPanel1.height                = 320
$MainFormPanel1.width                 = 550
$MainFormPanel1.location              = New-Object System.Drawing.Point(120,20)
$MainFormPanel1.BackColor             = "#f0f4f4"
#$MainFormPanel1.UseWaitCursor=$True

$MainFormIntroductionExplain
$MainFormIntroductionExplain          = New-Object system.Windows.Forms.Label
$MainFormIntroductionExplainText      = "My IT Automation Task
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
$MainFormIntroductionExplain.ForeColor               = "#93939c"
$MainFormIntroductionExplain.location = New-Object System.Drawing.Point(0,0)
$MainFormIntroductionExplain.Font     = 'Microsoft Sans Serif,10,style=bold'
#$MainFormIntroductionExplain.BringToFront()

$MainFormcloseButton                  = New-Object system.Windows.Forms.Button
$MainFormcloseButton.text             = "Close"
$MainFormcloseButton.width            = 80
$MainFormcloseButton.height           = 20
$MainFormcloseButton.location         = New-Object System.Drawing.Point(600,360)
$MainFormcloseButton.Font             = 'Microsoft Sans Serif,10'


#Load Form And Object into Panel
$MainForm.controls.AddRange(@($MainFormcloseButton,$MainFormLabelUserAction,$MainFormPanel1,$MainFormLabelIntroduction,$MainFormLabelAssetsAction,$MainFormLabelsummary))
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
        "MouseLeave-Introduction" {$MainFormLabelIntroduction.ForeColor      = "#646da9";$MainForm.Cursor="Default" }
        "MouseLeave-UserAction"   {$MainFormLabelUserAction.ForeColor   = "#646da9";$MainForm.Cursor="Default"}
        "MouseLeave-AssetsAction" {$MainFormLabelAssetsAction.ForeColor = "#646da9";$MainForm.Cursor="Default"}       
    }
$Global:Action="No"
 }

Function MainForm-LabelClicked{
param(
 $ClickOn
 )
    Switch ($ClickOn)
        {
            "Introduction" {Write-Host "$ClickOn clicked";Change-LabelText;MainForm-Explain;Create-Button;}
            "UserAction" {Write-Host "$ClickOn clicked";Change-LabelText;MainForm-Explain;Create-Button;Create-Progressbar}
            "AssetsAction"{Write-Host "$ClickOn clicked";Change-LabelText;MainForm-Explain;Create-Button;Create-Progressbar}
            "summary"{Write-Host "$ClickOn clicked"}
        }
}

Function Create-Progressbar{   
    if ($MainFormProgressbar) {$MainFormProgressbar.Dispose()} 
    $Global:MainFormProgressbar             = New-Object system.Windows.Forms.ProgressBar
    $MainFormProgressbar.width              = 450    
    $MainFormProgressbar.height             = 10
    #$MainFormProgressbar.BackColor          = "#21aed3"
    $MainFormProgressbar.location           = New-Object System.Drawing.Point(120,350)       
    $MainForm.controls.AddRange(@($MainFormProgressbar))

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

                $OffboardingButton.Add_Click({ Write-Host "OffboardingButton clicked" ;$SubMenu="Offboarding";User-CreateSubMenu;}) 
                $OnBoardingButton.Add_Click({ Write-Host "OnBoardingButton clicked" ;$SubMenu="OnBoarding";User-CreateSubMenu})
                                 

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

                
                $DeleteMACFromJAMFButton.Add_Click({ Write-Host "DeleteMACFromJAMFButton clicked" ;$SubMenu="DeleteMACFromJAMF";User-CreateSubMenu})
                $DeleteComputerObjectFromADButton.Add_Click({ Write-Host "DeleteComputerObjectFromADButton clicked" ;$SubMenu="DeleteComputerObjectFromAD";User-CreateSubMenu})
                $DeleteComputerFromSCCMButton.Add_Click({ Write-Host "DeleteComputerFromSCCMButton clicked" ;$SubMenu="DeleteComputerFromSCCM";User-CreateSubMenu})

                $MainFormPanel1.controls.AddRange(@($DeleteMACFromJAMFButton,$DeleteComputerObjectFromADButton,$DeleteComputerFromSCCMButton,$DeleteMACFromJAMFButtonInfo,$DeleteComputerObjectFromADButtonInfo,$DeleteComputerFromSCCMButtonInfo))
              }
        }
    
}

Function Clean-FormButton{
    switch ($ClickOn)
        {
            "Introduction" {if ($OffboardingButton){$OffboardingButton.Dispose()};if ($OnBoardingButton){$OnBoardingButton.Dispose()};if ($DeleteMACFromJAMFButton){$DeleteMACFromJAMFButton.Dispose()};if ($DeleteComputerObjectFromADButton){$DeleteComputerObjectFromADButton.Dispose()};if ($DeleteComputerFromSCCMButton){$DeleteComputerFromSCCMButton.Dispose()};if ($OffboardingButtonInfo){$OffboardingButtonInfo.Dispose()};if ($OnBoardingButtonInfo){$OnBoardingButtonInfo.Dispose()};if ($DeleteMACFromJAMFButtonInfo){$DeleteMACFromJAMFButtonInfo.Dispose()};if ($DeleteComputerObjectFromADButtonInfo){$DeleteComputerObjectFromADButtonInfo.Dispose()};if ($DeleteComputerFromSCCMButtonInfo){$DeleteComputerFromSCCMButtonInfo.Dispose()};if ($OffboardingComboBox){$OffboardingComboBox.Dispose()};if ($OffboardingComboBoxTitle){$OffboardingComboBoxTitle.Dispose()};if ($MainFormProgressbar){$MainFormProgressbar.Dispose()};Clean-SubMenuButton}
            "UserAction"   {if ($DeleteMACFromJAMFButton){$DeleteMACFromJAMFButton.Dispose()};if ($DeleteComputerObjectFromADButton){$DeleteComputerObjectFromADButton.Dispose()};if ($DeleteComputerFromSCCMButton){$DeleteComputerFromSCCMButton.Dispose()};if ($DeleteMACFromJAMFButtonInfo){$DeleteMACFromJAMFButtonInfo.Dispose()};if ($DeleteComputerObjectFromADButtonInfo){$DeleteComputerObjectFromADButtonInfo.Dispose()};if ($DeleteComputerFromSCCMButtonInfo){$DeleteComputerFromSCCMButtonInfo.Dispose()};if ($OffboardingComboBox){$OffboardingComboBox.Dispose()};if ($OffboardingComboBoxTitle){$OffboardingComboBoxTitle.Dispose()};Clean-SubMenuButton}
            "AssetsAction" {if ($OffboardingButton){$OffboardingButton.Dispose()};if ($OnBoardingButton){$OnBoardingButton.Dispose()};if ($OffboardingButtonInfo){$OffboardingButtonInfo.Dispose()};if ($OnBoardingButtonInfo){$OnBoardingButtonInfo.Dispose()};if ($OffboardingComboBox){$OffboardingComboBox.Dispose()};if ($OffboardingComboBoxTitle){$OffboardingComboBoxTitle.Dispose()};Clean-SubMenuButton}
        }
}

Function Clean-SubMenuButton{
    if ($OnBoardingTitle){$OnBoardingTitle.Dispose()}
    if ($OnBoardinglabelEnterUserFirstName){$OnBoardinglabelEnterUserFirstName.Dispose()}
    if ($OnBoardinglabelEnterUserFirstNameTextBox){$OnBoardinglabelEnterUserFirstNameTextBox.Dispose()}
    if ($OnBoardinglabelEnterUserLastName){$OnBoardinglabelEnterUserLastName.Dispose()}
    if ($OnBoardinglabelEnterUserLastNameTextBox){$OnBoardinglabelEnterUserLastNameTextBox.Dispose()}
    if ($OnBoardinglabelEnterUserName){$OnBoardinglabelEnterUserName.Dispose()}
    if ($OnBoardinglabelEnterUserNameTextBox){$OnBoardinglabelEnterUserNameTextBox.Dispose()}
    if ($OnBoardinglabelEnterDescriptionTitle){$OnBoardinglabelEnterDescriptionTitle.Dispose()}
    if ($OnBoardinglabelEnterDescriptionTitleTextBox){$OnBoardinglabelEnterDescriptionTitleTextBox.Dispose()}
    if($OnBoardinglabelEnterManagerUserNameTextBox){$OnBoardinglabelEnterManagerUserNameTextBox.Dispose()}
    if($OnBoardinglabelEnterManagerUserNameTitle){$OnBoardinglabelEnterManagerUserNameTitle.Dispose()}

}



Function User-CreateSubMenu{
    switch ($SubMenu)
        {
            "Offboarding" {Write-Host "Offboarding menu need to create";CleanAndBuild-UserActionSubMenu}
            "OnBoarding" {Write-Host "OnBoarding menu need to create";CleanAndBuild-UserActionSubMenu}
            "DeleteMACFromJAMF" {Write-Host "DeleteMACFromJAMF menu need to create";CleanAndBuild-AssetActionSubMenu}
            "DeleteComputerObjectFromAD" {Write-Host "DeleteComputerObjectFromAD menu need to create";CleanAndBuild-AssetActionSubMenu}
            "DeleteComputerFromSCCM" {Write-Host "DeleteComputerFromSCCM menu need to create";CleanAndBuild-AssetActionSubMenu}
        }

}

Function CleanAndBuild-UserActionSubMenu{
    Write-Host "Clean SubMenu"
    $OffboardingButton.Dispose()
    $OffboardingButtonInfo.Dispose()
    $OnBoardingButton.Dispose()
    $OnBoardingButtonInfo.Dispose()
    switch ($SubMenu)
        {
            "Offboarding"{Write-Host "Need to create Offboarding SubMenu";Offboarding-SubMenu}
            "OnBoarding"{Write-Host "Need to create OnBoarding SubMenu";OnBoarding-SubMenu}
        }
}

Function Offboarding-SubMenu{    
    
    $MainFormProgressbar.Increment(+20)
    $global:OnBoardingTitle                 = New-Object system.Windows.Forms.label
    $OnBoardingTitle.text                   = "                          OFFBoarding process"
    $OnBoardingTitle.AutoSize               = $true
    $OnBoardingTitle.width                  = 25
    $OnBoardingTitle.height                 = 10
    $OnBoardingTitle.location               = New-Object System.Drawing.Point(5,10)
    $OnBoardingTitle.Font                   = 'Microsoft Sans Serif,10,style=bold,Underline'

    $MainFormProgressbar.text ="Loading"    
    $global:OffboardingComboBoxTitle                 = New-Object system.Windows.Forms.label
    $OffboardingComboBoxTitle.text                   = "Choose a USER to start the OFFBoarding Procces"
    $OffboardingComboBoxTitle.AutoSize               = $true
    $OffboardingComboBoxTitle.width                  = 25
    $OffboardingComboBoxTitle.height                 = 10
    $OffboardingComboBoxTitle.location               = New-Object System.Drawing.Point(5,40)
    $OffboardingComboBoxTitle.Font                   = 'Microsoft Sans Serif,8'

    $global:OffboardingComboBox                    = New-Object system.Windows.Forms.ComboBox
    $OffboardingComboBox.text                      = "Select User"
    $OffboardingComboBox.width                     = 100
    $OffboardingComboBox.height                    = 20
    $OffboardingComboBox.location                  = New-Object System.Drawing.Point(5,80)
    $OffboardingComboBox.Font                      = 'Microsoft Sans Serif,10'    
    $ADUsers = (Get-ADUser -Filter "name -like '*'" -Properties enabled | where {$_.enabled -like "true"}).SamAccountName | sort -Descending
    foreach ($ADuser in $ADUsers)
    {     
    $OffboardingComboBox.Items.Add(($ADuser));    
    }$MainFormProgressbar.Increment(+80)
    $MainFormPanel1.controls.AddRange(@($OffboardingComboBox,$OffboardingComboBoxTitle,$OnBoardingTitle))    
}

Function OnBoarding-SubMenu{ 
    $MainFormProgressbar.Increment(+20)
    $MainFormProgressbar.text ="Loading"    
    $global:OnBoardingTitle                = New-Object system.Windows.Forms.label
    $OnBoardingTitle.text                   = "                          OnBoarding process"
    $OnBoardingTitle.AutoSize               = $true
    $OnBoardingTitle.width                  = 25
    $OnBoardingTitle.height                 = 10
    $OnBoardingTitle.location               = New-Object System.Drawing.Point(5,10)
    $OnBoardingTitle.Font                   = 'Microsoft Sans Serif,10,style=bold,Underline'

    $global:OnBoardinglabelEnterUserFirstName                = New-Object system.Windows.Forms.label
    $OnBoardinglabelEnterUserFirstName.text                   = "Enter User First Name : "
    $OnBoardinglabelEnterUserFirstName.AutoSize               = $true
    $OnBoardinglabelEnterUserFirstName.width                  = 25
    $OnBoardinglabelEnterUserFirstName.height                 = 10
    $OnBoardinglabelEnterUserFirstName.location               = New-Object System.Drawing.Point(5,45)
    $OnBoardinglabelEnterUserFirstName.Font                   = 'Microsoft Sans Serif,8,style=Underline'

    $global:OnBoardinglabelEnterUserFirstNameTextBox                    = New-Object system.Windows.Forms.TextBox
    $OnBoardinglabelEnterUserFirstNameTextBox.text                      = "FirstName"
    $OnBoardinglabelEnterUserFirstNameTextBox.width                     = 100
    $OnBoardinglabelEnterUserFirstNameTextBox.height                    = 10
    $OnBoardinglabelEnterUserFirstNameTextBox.location                  = New-Object System.Drawing.Point(140,40)
    $OnBoardinglabelEnterUserFirstNameTextBox.Font                      = 'Microsoft Sans Serif,10'
    
    $global:OnBoardinglabelEnterUserLastName                = New-Object system.Windows.Forms.label
    $OnBoardinglabelEnterUserLastName.text                   = "Enter User Last Name : "
    $OnBoardinglabelEnterUserLastName.AutoSize               = $true
    $OnBoardinglabelEnterUserLastName.width                  = 25
    $OnBoardinglabelEnterUserLastName.height                 = 10
    $OnBoardinglabelEnterUserLastName.location               = New-Object System.Drawing.Point(5,85)
    $OnBoardinglabelEnterUserLastName.Font                   = 'Microsoft Sans Serif,8,style=Underline'

    $global:OnBoardinglabelEnterUserLastNameTextBox                    = New-Object system.Windows.Forms.TextBox
    $OnBoardinglabelEnterUserLastNameTextBox.text                      = "LastName"
    $OnBoardinglabelEnterUserLastNameTextBox.width                     = 100
    $OnBoardinglabelEnterUserLastNameTextBox.height                    = 10
    $OnBoardinglabelEnterUserLastNameTextBox.location                  = New-Object System.Drawing.Point(140,80)
    $OnBoardinglabelEnterUserLastNameTextBox.Font                      = 'Microsoft Sans Serif,10'   
    
    $global:OnBoardinglabelEnterUserName                = New-Object system.Windows.Forms.label
    $OnBoardinglabelEnterUserName.text                   = "Enter User  Name : "
    $OnBoardinglabelEnterUserName.AutoSize               = $true
    $OnBoardinglabelEnterUserName.width                  = 25
    $OnBoardinglabelEnterUserName.height                 = 10
    $OnBoardinglabelEnterUserName.location               = New-Object System.Drawing.Point(5,125)
    $OnBoardinglabelEnterUserName.Font                   = 'Microsoft Sans Serif,8,style=Underline'

    $global:OnBoardinglabelEnterUserNameTextBox                    = New-Object system.Windows.Forms.TextBox
    $OnBoardinglabelEnterUserNameTextBox.text                      = "UserName"
    $OnBoardinglabelEnterUserNameTextBox.width                     = 100
    $OnBoardinglabelEnterUserNameTextBox.height                    = 10
    $OnBoardinglabelEnterUserNameTextBox.location                  = New-Object System.Drawing.Point(140,120)
    $OnBoardinglabelEnterUserNameTextBox.Font                      = 'Microsoft Sans Serif,10'  
    
    $global:OnBoardinglabelEnterDescriptionTitle                = New-Object system.Windows.Forms.label
    $OnBoardinglabelEnterDescriptionTitle.text                   = "Enter Description/Title : "
    $OnBoardinglabelEnterDescriptionTitle.AutoSize               = $true
    $OnBoardinglabelEnterDescriptionTitle.width                  = 25
    $OnBoardinglabelEnterDescriptionTitle.height                 = 10
    $OnBoardinglabelEnterDescriptionTitle.location               = New-Object System.Drawing.Point(5,165)
    $OnBoardinglabelEnterDescriptionTitle.Font                   = 'Microsoft Sans Serif,8,style=Underline'

    $global:OnBoardinglabelEnterDescriptionTitleTextBox                    = New-Object system.Windows.Forms.TextBox
    $OnBoardinglabelEnterDescriptionTitleTextBox.text                      = "Description/Title"
    $OnBoardinglabelEnterDescriptionTitleTextBox.width                     = 120
    $OnBoardinglabelEnterDescriptionTitleTextBox.height                    = 5
    $OnBoardinglabelEnterDescriptionTitleTextBox.location                  = New-Object System.Drawing.Point(140,160)
    $OnBoardinglabelEnterDescriptionTitleTextBox.Font                      = 'Microsoft Sans Serif,10'  
    
    $global:OnBoardinglabelEnterManagerUserNameTitle                = New-Object system.Windows.Forms.label
    $OnBoardinglabelEnterManagerUserNameTitle.text                   = "Enter ManagerUser Name : "
    $OnBoardinglabelEnterManagerUserNameTitle.AutoSize               = $true
    $OnBoardinglabelEnterManagerUserNameTitle.width                  = 25
    $OnBoardinglabelEnterManagerUserNameTitle.height                 = 10
    $OnBoardinglabelEnterManagerUserNameTitle.location               = New-Object System.Drawing.Point(5,205)
    $OnBoardinglabelEnterManagerUserNameTitle.Font                   = 'Microsoft Sans Serif,8,style=Underline'

    $global:OnBoardinglabelEnterManagerUserNameTextBox                    = New-Object system.Windows.Forms.TextBox
    $OnBoardinglabelEnterManagerUserNameTextBox.text                      = "ManagerUserName"
    $OnBoardinglabelEnterManagerUserNameTextBox.width                     = 140
    $OnBoardinglabelEnterManagerUserNameTextBox.height                    = 5
    $OnBoardinglabelEnterManagerUserNameTextBox.location                  = New-Object System.Drawing.Point(150,200)
    $OnBoardinglabelEnterManagerUserNameTextBox.Font                      = 'Microsoft Sans Serif,10'      
             
    $MainFormProgressbar.Increment(+80)
    $MainFormPanel1.controls.AddRange(@($OnBoardingTitle,$OnBoardinglabelEnterUserFirstName,$OnBoardinglabelEnterUserFirstNameTextBox,$OnBoardinglabelEnterUserLastName,$OnBoardinglabelEnterUserLastNameTextBox,$OnBoardinglabelEnterUserName,$OnBoardinglabelEnterUserNameTextBox,$OnBoardinglabelEnterDescriptionTitle,$OnBoardinglabelEnterDescriptionTitleTextBox,$OnBoardinglabelEnterManagerUserNameTitle,$OnBoardinglabelEnterManagerUserNameTextBox)) 
}

Function CleanAndBuild-AssetActionSubMenu{
    $DeleteMACFromJAMFButton.Dispose()
    $DeleteMACFromJAMFButtonInfo.Dispose()
    $DeleteComputerObjectFromADButton.Dispose()
    $DeleteComputerObjectFromADButtonInfo.Dispose()
    $DeleteComputerFromSCCMButton.Dispose()
    $DeleteComputerFromSCCMButtonInfo.Dispose()
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

remove-Variable -Name DeleteComputer*
remove-Variable -Name MainForm*
remove-Variable -Name Offboarding*
remove-Variable -Name OnBoarding*