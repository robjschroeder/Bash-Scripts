COPY /Y "\\adroot\tss\deploy\Kaseya-PC\TC\APPS\WGU\ESSecureBrowser\ESSecureBrowser.msi" "C:\temp\"
COPY /Y "\\adroot\tss\deploy\Kaseya-PC\TC\APPS\WGU\ESSecureBrowser\setup.exe" "C:\temp\"
"C:\temp\setup.exe" /quiet /passive
DEL "C:\temp\ESSecureBrowser.msi"
DEL "C:\temp\setup.exe"