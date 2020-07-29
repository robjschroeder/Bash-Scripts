@echo off
net stop sppuinotify
sc config sppuinotify start= disabled
net stop sppsvc
del %windir%\system32\7B296FB0-376B-497e-B012-9C450E1B7327-5P-0.C7483456-A289-439d-8115-601632D005A0 /ah
del %windir%\system32\7B296FB0-376B-497e-B012-9C450E1B7327-5P-1.C7483456-A289-439d-8115-601632D005A0 /ah
del %windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\tokens.dat
del %windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\cache\cache.dat
net start sppsvc
cscript c:\windows\system32\slmgr.vbs /ipk 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
cscript c:\windows\system32\slmgr.vbs /ato
sc config sppuinotify start= demand