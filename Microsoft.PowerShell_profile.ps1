set-location c:/Users/ividito/Desktop/Dev
Import-Module Get-ChildItemColor
Import-Module -Name posh-git

function Test-Administrator{
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

Start-SshAgent

function Restart-PowerShell{
    Start-Process PowerShell # Launch PowerShell host in new window
    exit # Exit existing PowerShell host window
}
Set-Alias -Name rps -Value Restart-PowerShell

Function Touch-File
{
    $file = $args[0]
    if($file -eq $null){
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}

Function Profile-Builder{
    # Creates profile if doesn't exist then edits it
    if (!(Test-Path -Path $PROFILE)){ New-Item -Path $PROFILE -ItemType File } ; ise $PROFILE
}

Set-Alias -Name prof -Value Profile-Builder