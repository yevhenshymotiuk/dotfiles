#!/usr/bin/env bash

FILE="/home/yevhens/screen.png"

while getopts "s" opt; do
    case "$opt" in
        s)
            SELECT=true
    esac
done

options=("Default" "Imgur")
choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu);
[ $? = 0 ] || exit

if [ "$SELECT" == true ]; then
    maim --select "$FILE" --hidecursor
else
    maim --capturebackground "$FILE" --hidecursor
fi

case $choice in
    "Default")
        cat "$FILE" | xclip -selection clipboard -target image/png;;
    "Imgur")
        notify-send "Uploading to imgur..."
        imgur "$FILE";;
esac

notify-send "Screenshot was saved to" "$FILE"
