get-childitem "C:\Users\mec6\Desktop\Silverlight\*" *.bat |  
Foreach-Object {copy-item $_.fullname -destination C:\Users\mec6\Desktop\Archived}