@ECHO OFF

net user "tc-certiport-acc" "T3sting!!!!" /add
net localgroup administrators tc-certiport-acc /add

EXIT /B