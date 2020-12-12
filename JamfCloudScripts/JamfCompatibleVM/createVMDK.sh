#!/bin/bash

#
# createVMDK.sh
#
# DESCRIPTION
# Creates custom vmdk file with a serial number and Apple hardware type
# for use with a Mobile Device Management platform (ie Jamf).
#
# CHANGE CONTROL LOG
#   2018-09-07 - Caine Hörr
#       Version 2.0
#       Added environmentSettings sub-section
#       Added vfuseCheck with installer routine
#   2018-07-23 - Caine Hörr
#       Version 1.0
#       Initial script creation
#

environmentSettings(){
    # USER EDITABLE VARIABLES
    virtualMachineName="Jamf_Compatible_Virtual_Machine"      # Name of Virtual Machine as known to Vmware Fusion
    virtualMachineHardwareType="iMac13,1"                   # Apple Macintosh hardware type
    virtualMachineSerialNumber="C02KPBSRDNCR"                           # "random" creates a random serial number, otherwise type in your own (needed for DEP testing)
    bootableDMG=osx-10.15.7-19H2.apfs.dmg       # Bootable macOS DMG as created by AutoDMG
    vfusePKG=vfuse-2.0.6.pkg                                    # vfuse PKG installer

    # DO NOT MODIFY BELOW THIS LINE
    currentDirectoryPath=`pwd`
    inputDMGpath=${currentDirectoryPath}/${bootableDMG}
    vfusePath=`which vfuse`
    dateTimeStamp=`date "+%Y-%m-%d_%H-%M-%S"`
}

main(){
    RunAsRoot
    environmentSettings
    vfuseCheck
    inputDMGpath
    configureVirtualMachine
}

RunAsRoot(){
    # Check for admin/root permissions
    if [ "$(id -u)" != "0" ]; then
        echo "ERROR: Script must be run as root, or have root privileges (ie. sudo)." 1>&2
        exit 1
    else
        echo "Running as root..."
    fi
}

vfuseCheck(){
    if [ "${vfusePath}" = "" ]; then    
        echo "vfuse not found. Installing..."
        sudo installer -pkg ${currentDirectoryPath}/${vfusePKG} -target /
        vfusePath=`which vfuse`
        echo "vfuse installed in" ${vfusePath}
        vfuseVersion=`vfuse --version`
        echo "vfuse" ${vfuseVersion} "installed"
    else
        echo "Found ${vfusePath}"
        vfuseVersion=`vfuse --version`
        echo "vfuse" ${vfuseVersion} "installed"
    fi
}

inputDMGpath(){
    if [ ! -f "${inputDMGpath}" ]; then   
        echo "${inputDMGpath} not found."
        exit 1
    else
        echo "Found ${inputDMGpath}"
    fi
}

configureVirtualMachine(){
    echo "Configuring Jamf compatible Virtual Machine"
    sudo ${vfusePath} -i ${inputDMGpath} -o ${currentDirectoryPath}/ -s ${virtualMachineSerialNumber} --hw-model ${virtualMachineHardwareType} -n "${virtualMachineName}-${dateTimeStamp}"
}

main

exit 0