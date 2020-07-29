@ECHO OFF

:: File Name: DropboxInstall.bat
:: Created by: Robert Schroeder
:: Date Created: Jan 8, 2015

:: Installs Dropbox on logged in user's profile
::=======================================================================================
:Variable-1
:: Define location variable
SET loc="\\adroot\tss\dist\Pub\Applications\Dropbox"
::=======================================================================================
:CopyInstall
:: Copies the .exe for Dropbox from the server to C:\temp\
COPY /Y "%loc%\DropboxInstaller.exe" "C:\Temp\DropboxInstaller.exe"
::=======================================================================================
:Install
:: Installs Dropbox
"C:\Temp\DropboxInstaller.exe" /S
"\\adroot\tss\deploy\Kaseya-PC\Tools\Wait\Wait.exe" 90
::=======================================================================================
:RemoveInstaller
:: Removes .exe from C:\temp
DEL "C:\Temp\DropboxInstaller.exe"
