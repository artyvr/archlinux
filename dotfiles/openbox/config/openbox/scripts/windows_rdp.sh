#!/usr/bin/env bash

host="192.168.0.30"
user="art"
paswd="hotwind"
resolution_wight=1920
resolution_hight=1015

xfreerdp3 /u:$user /p:$paswd /w:$resolution_wight /h:$resolution_hight /v:$host -wallpaper -themes -fonts &&
exit 0
