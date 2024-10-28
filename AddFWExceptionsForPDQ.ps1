New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name LocalAccountTokenFilterPolicy -Value 1
winrm /quickconfig
New-Item -Path "HKLM:\SOFTWARE\Policies\" -Name "Microsoft" -ErrorAction Continue
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\" -Name "WindowsFirewall" -ErrorAction Continue
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\" -Name "StandardProfile" -ErrorAction Continue
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" -Name "IcmpSettings" -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowOutboundDestinationUnreachable   -Value 0 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowOutboundSourceQuench			    -Value 0 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowRedirect						    -Value 0 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowInboundEchoRequest			    -Value 1 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowInboundRouterRequest			    -Value 0 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowOutboundTimeExceeded			    -Value 0 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowOutboundParameterProblem		    -Value 0 -ErrorAction Continue         	
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowInboundTimestampRequest		    -Value 0 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowInboundMaskRequest			    -Value 1 -ErrorAction Continue
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\IcmpSettings" -Name AllowOutboundPacketTooBig	            -Value 0 -ErrorAction Continue
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" -Name "Services"
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\Services" -Name "FileAndPrint"
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\Services\FileAndPrint" -Name Enabled		                -Value 1
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile\Services\FileAndPrint" -Name RemoteAddresses              -Value "XXX.XXX.XXX.XXX" #IP of PDQ Server
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\" -Name "FirewallRules"
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\" -Name WINRM-HTTP-In-TCP-PUBLIC -Value "v2.31|Action=Allow|Active=TRUE|Dir=In|Protocol=6|Profile=Public|LPort=5985|RA4=LocalSubnet|RA6=LocalSubnet|App=System|Name=@FirewallAPI.dll,-30253|Desc=@FirewallAPI.dll,-30256|EmbedCtxt=@FirewallAPI.dll,-30267|"
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\" -Name WINRM-HTTP-In-TCP -Value "v2.31|Action=Allow|Active=TRUE|Dir=In|Protocol=6|Profile=Domain|Profile=Private|LPort=5985|App=System|Name=@FirewallAPI.dll,-30253|Desc=@FirewallAPI.dll,-30256|EmbedCtxt=@FirewallAPI.dll,-30267|"
