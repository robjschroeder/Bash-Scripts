$computer = gc env:computername

$key = "YDRBP-3D83W-TY26F-D46B2-XCKRJ"

$service = get-wmiObject -query "select * from SoftwareLicensingService" -computername $computer

$service.InstallProductKey($key)

$service.RefreshLicenseStatus()