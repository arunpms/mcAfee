################################################################################

# Script developed by: Megha Shyam Sathya Arun Potta, Enterprise Scheduling
# McAfee Remediation script for CSS

################################################################################

#$serverName = Get-Content "\\houdata04\it services\DATA CENTER\Autosys\Working On\Arun\servers.txt"
Write-Host $env:COMPUTERNAME

if(Get-ChildItem -File -Name cmdagent.exe -Path "c:\Program Files\McAfee\Agent\"){
    Write-Host "at agent"
    Start-Process -FilePath "c:\Program Files\McAfee\Agent\cmdagent.exe" -ArgumentList '/c'
    Start-Sleep -s 5
    Start-Process -FilePath "c:\Program Files\McAfee\Agent\cmdagent.exe" -ArgumentList '/e'
    Start-Sleep -s 5
    #Start-Process -FilePath "c:\Program Files (x86)\McAfee\VirusScan Enterprise\mcupdate.exe" -ArgumentList '/update'
}

if(Get-ChildItem -File -Name cmdagent.exe -Path "c:\Program Files (x86)\McAfee\Common Framework\"){
    Write-Host "at Common"
    Start-Process -FilePath "c:\Program Files (x86)\McAfee\Common Framework\cmdagent.exe" -ArgumentList '/c'
    Start-Sleep -s 5
    Start-Process -FilePath "c:\Program Files (x86)\McAfee\Common Framework\cmdagent.exe" -ArgumentList '/e'
    Start-Sleep -s 5
    #Start-Process -FilePath "c:\Program Files (x86)\McAfee\VirusScan Enterprise\mcupdate.exe" -ArgumentList '/update'
}

if(Get-ChildItem -File -Name mcupdate.exe -Path "c:\Program Files\McAfee\VirusScan Enterprise\"){
    Start-Process -FilePath "c:\Program Files\McAfee\VirusScan Enterprise\mcupdate.exe" -ArgumentList '/update'
}

if(Get-ChildItem -File -Name mcupdate.exe -Path "c:\Program Files (x86)\McAfee\VirusScan Enterprise"){
    Start-Process -FilePath "c:\Program Files (x86)\McAfee\VirusScan Enterprise\mcupdate.exe" -ArgumentList '/update'
}


Send-MailMessage -From meghashyam.sathyaarunpotta@invesco.com -To meghashyam.sathyaarunpotta@invesco.com -Subject "$env:COMPUTERNAME-McAfee Remediation-Complete" -SmtpServer "emailnasmtp.app.invesco.net"
