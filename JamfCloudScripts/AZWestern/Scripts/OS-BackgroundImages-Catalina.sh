﻿# BACKGROUND PICTURES
chmod -R 777 /Library/Desktop\ Pictures/AWC-Pictures
rm -rf /Library/Desktop\ Pictures/El\ Capitan.jpg
rm -rf /Library/Desktop\ Pictures/Sierra.jpg
rm -rf /Library/Desktop\ Pictures/Mojave.heic
rm -rf /System/Library/Desktop\ Pictures/Catalina.heic
cp -R /Library/Desktop\ Pictures/AWC-Pictures/AWC\ Desktop\ Image\ 1024x768.bmp /Library/Desktop\ Pictures/Sierra.jpg
cp -R /Library/Desktop\ Pictures/AWC-Pictures/AWC\ Desktop\ Image\ 1024x768.bmp /Library/Desktop\ Pictures/El\ Capitan.jpg
cp -R /Library/Desktop\ Pictures/AWC-Pictures/Mojave.heic /Library/Desktop\ Pictures/Mojave.heic
cp -R /Library/Desktop\ Pictures/AWC-Pictures/Mojave.heic /System/Library/Desktop\ Pictures/Catalina.heic


# SET BACKGROUND PICTURE FOR USER TEMPLATE
mkdir /System/Library/User\ Template/English.lproj/Library/Application\ Support/Dock
cp -R /Users/admin/Library/Application\ Support/Dock/desktoppicture.db /System/Library/User\ Template/English.lproj/Library/Application\ Support/Dock/
sqlite3 /System/Library/User\ Template/English.lproj/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '/Library/Desktop Pictures/AWC-Pictures/AWC Desktop Image 1024x768.bmp'";
