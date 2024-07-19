#!/bin/bash
keyboard () {
    t=$(xset -q | grep LED)
    code=${t##*mask:  }
    if [[ $code -eq "00000000" ]]; then
            result="en"
    else
            result="ru"
    fi
printf "%s %s \\n" "$result"
}
keyboard