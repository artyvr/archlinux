#!/usr/bin/env bash

host="192.168.122.42"
user="art"
paswd="hotwind"
resolution_wight=1920
resolution_hight=1015
vm_name=win10

function check_host {
	
}

function start_vm {
	echo "Start VM"
	virsh --connect qemu:///system start $vm_name
}

function connect_to_windows_host {
	echo "Connect to host (RDP)"
	xfreerdp3 /u:$user /p:$paswd /w:$resolution_wight /h:$resolution_hight /v:$host -wallpaper -themes -fonts &&
	exit 0
}

function start {
	start_vm
	sleep 20
	if check_host; then
		connect_to_windows_host
	else
		dunstify -t 1200000 "VM не запущина"
		exit 0
	fi
}

start