#!/bin/sh

computerName=$(osascript -e 'with timeout of 86400 seconds
    tell application "SystemUIServer"
        set myRoomNumber to text returned of (display dialog "Please set the room number that this Mac will report for the inventory record in Jamf Pro."     default answer "" with title "Room Number" buttons {"Submit"} default button 1 with icon caution)
    end tell
end timeout')
echo $roomNumber >> /var/log/provisioning