#!/usr/bin/env bash

FILE="/home/yevhens/screen.png"

while getopts s opt; do
    case "$opt" in
        s)
            maim --select "$FILE" --hidecursor;;
    esac
done

if [ "$#" == 0 ]; then
  maim --capturebackground ~/screen.png --hidecursor
fi

cat "$FILE" | xclip -selection clipboard -target image/png
notify-send "Screenshot was saved to" "$FILE"
