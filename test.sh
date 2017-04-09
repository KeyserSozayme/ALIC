#!/usr/bin/env bash

#set -o xtrace
#set -o verbose

declare acceptedDrives="^sd\|^hd\|^xvd"
declare drives="$(lsblk | grep "$acceptedDrives" | awk '{print $1}') sda sdb sdc"
declare -a driveList

function listDrives () {
    for dev in $drives; do
        driveList+=("$dev")
    done
}

listDrives

echo "${driveList[@]}"
