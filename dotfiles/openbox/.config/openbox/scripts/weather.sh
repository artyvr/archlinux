#!/bin/bash
weather=$(curl -s https://wttr.in/Moscow\?format\=1)
printf "%s %s \n" "$weather"