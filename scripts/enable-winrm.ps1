
powershell.exe -Command "(Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 1 -Type DWord)"

powershell.exe -Command "(enable-psremoting -SkipNetworkProfileCheck -Force)"

powershell.exe -Command "(Set-WSManQuickConfig -SkipNetworkProfileCheck -Force)"

powershell.exe -Command "(Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 1 -Type DWord)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Client\TrustedHosts -Value * -Force)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Client\AllowUnencrypted -Value $true -Force)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Client\Auth\Basic -Value $true -Force)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true -Force)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true -Force)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB -Value 1024 -Force)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Shell\MaxShellsPerUser -Value 60 -Force)"

powershell.exe -Command "(Set-Item WSMan:\localhost\Listener\*\Port -Value 5985 -Force)"

powershell.exe -Command "(stop-service winrm)"

cmd /c sc config winrm start= disabled

