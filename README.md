This is a windows shell script to tap the F16 key every 3 minutes for a predetermined time to keep Teams in an active/green status. F16 no 
longer physically exists on most modern keyboards, but there is an allowance in the system for it to be used. Adding this file to a script 
folder and creating a persistent alias is suggested. To create a persistent alias, follow the steps below in Powershell:

1) Verify or create your Powershell profile
    A) Check if your profile already exists
       Test-Path $PROFILE
    B) If it returns TRUE, skip to Part 2. Else, create a new profile
       New-Item -Path $PROFILE -Type File -Force
2) Edit your profile
    A) Open in Notepad
       notepad $PROFILE
    B) Define the alias
       Set-Alias -Name <your-alias> -Value consoleOut.ps1
    C) Save and close Notepad
       CTRL-S
3) Apply changes
       . $PROFILE


This script will run for 30 minutes with no arguments. I named my alias "tap". If you want it to run for a specified time, simply append
the number of minute you want it to run after the alias. Eg: "tap 125" for 125 minutes (2 hours and 5 minutes). Otherwise, "tap" will end 
after 30 minutes.
