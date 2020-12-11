#!/bin/bash
mkdir -p "/Library/Application Support/OpenDNS Roaming Client/"
DATA='<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>APIFingerprint</key>
<string>543f510f9ad43cb1a9b9e010e1cc32bb</string>
<key>APIOrganizationID</key>
<string>2579700</string>
<key>APIUserID</key>
<string>10669796</string>
<key>InstallMenubar</key>
<true/>
</dict>
</plist>'
echo "$DATA" > "/Library/Application Support/OpenDNS Roaming Client/OrgInfo.plist"