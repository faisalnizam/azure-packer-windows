
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

cmd /c sc config winrm start=  enable

netsh advfirewall firewall set rule group="remote administration" new enable=yes
netsh advfirewall firewall add rule name="Open Port 5985" dir=in action=allow protocol=TCP localport=5985

winrm quickconfig -q
winrm quickconfig -transport:http
winrm set winrm/config '@{MaxTimeoutms="7200000"}'
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="0"}'
winrm set winrm/config/winrs '@{MaxProcessesPerShell="0"}'
winrm set winrm/config/winrs '@{MaxShellsPerUser="0"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/client/auth '@{Basic="true"}'

net stop winrm
sc.exe config winrm start= auto
net start winrm
