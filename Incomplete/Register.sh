#!/bin/bash

################################ READ THROUGH THIS SCRIPT IN ITS ENTIRETY AND DEFINITELY CUSTOMIZE TO YOUR ENVIRONMENT! DO NOT RUN THIS AS IS!!##########################################

touch /var/log/provisioning.log

# ENTER RELEVANT SERVER INFO HERE
apiUser="admin"
apiPass="sKyW4lk3r!"
jssUrl="https://azwestern.jamfcloud.com"
serial=`system_profiler SPHardwareDataType | awk '/Serial/ {print $4}'`

echo $jssUrl >> /var/log/provisioning.log
echo $serial >> /var/log/provisioning.log
echo $osrevision >> /var/log/provisioning.log


# HAVE THE TECH CHOOSE A DEPARTMENT FROM A LIST
departmentName=$(osascript -e 'with timeout of 86400 seconds
    tell application "SystemUIServer"
        set myDepartmentName to choose from list {“Department 1”, "Department 2”, "Department 3”, "Department 4”, "Department 5”, "Department 6”, "Department 7”, "Department 8”} with title "Jamf Pro Department" with prompt "Please choose which department that this Mac will report for the inventory record in Jamf Pro."
    end tell
end timeout')
echo $departmentName >> /var/log/provisioning.log

# HAVE THE TECH INPUT AN ASSET TAG
assetTag=$(osascript -e 'with timeout of 86400 seconds
    tell application "SystemUIServer"
        set myAssetTag to text returned of (display dialog "Please insert the asset tag here.” default answer "" with title “Asset Tag Entry” buttons {"Submit"} default button 1 with icon caution)
    end tell
end timeout')
echo $assetTag >> /var/log/provisioning.log

# HAVE THE TECH CHOOSE A BUILDING FROM A LIST
buildingName=$(osascript -e 'with timeout of 86400 seconds
    tell application "SystemUIServer"
        set myBuildingName to (choose from list {“Building 1”, "Building 2”, "Building 3”, "Building 4”, "Building 5”, "Building 6”, "Building 7”, "Building 8”, "Building 9”, "Building 10”, "Building 11”, "Building 12”, "Building 13”, "Building 14”, "Building 15”, "Building 16”, "Building 17”, "Building 18”, "Building 19”} with title "Building Choice" with prompt "Please choose which building this machine will be assigned to. This step is necessary for inventory reporting." default items "Building 1")
    end tell
end timeout')
echo $buildingName >> /var/log/provisioning.log

# HAVE THE TECH INPUT A ROOM NUMBER
roomNumber=$(osascript -e 'with timeout of 86400 seconds
    tell application "SystemUIServer"
        set myRoomNumber to text returned of (display dialog "Please set the room number that this Mac will report for the inventory record in Jamf Pro."     default answer "" with title "Room Number" buttons {"Submit"} default button 1 with icon caution)
    end tell
end timeout')
echo $roomNumber >> /var/log/provisioning

# HAVE THE TECH INPUT A POSITION
#position=$(osascript -e 'with timeout of 86400 seconds
 #   tell application "SystemUIServer"
 #       set the_button to button returned of (display dialog "Will this lab computer be a student, staff or building administrator machine?" buttons {"Student", "Staff", "Administrator"} default button 1)
 #   end tell
#end timeout')
#echo $position >> /var/log/provisioning.log

# IN MY CASE MY SCRIPT DOES DEFINE ALL THESE PARAMETERS. I ALSO CHOSE TO USE CURL INSTEAD OF A RECON COMMAND AS CURL IS CURRENTLY NATIVE TO THE MAC
curl -X PUT -H "Accept: application/xml" -H "Content-type: application/xml" -k -u "${apiUser}:${apiPass}" -d "<computer><location><building>$buildingName</building><department>$departmentName</department><room>$roomNumber</room></location></computer>" "${jssUrl}/JSSResource/computers/serialnumber/${serial}"