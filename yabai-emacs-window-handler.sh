#!/bin/bash

# script for controlling how emacs frames are handled by yabai,
# based on the frame’s title parameter

data=$(yabai -m query --windows --window $YABAI_WINDOW_ID)

title=$(echo $data | jq .title)
display=$(echo $data | jq .display)

if  [[ $title =~ "link-hint" && $display == 1 ]]; then
    yabai -m window $YABAI_WINDOW_ID --toggle float --move abs:350:90
    yabai -m window $YABAI_WINDOW_ID --resize abs:730:700
elif
    [[ $title =~ "capture-popup" && $display == 1 ]]; then
    yabai -m window $YABAI_WINDOW_ID --toggle float --move abs:430:230
    yabai -m window $YABAI_WINDOW_ID --resize abs:655:300
    yabai -m window $YABAI_WINDOW_ID --focus
elif
    [[ $title =~ "small-popup" && $display == 1 ]]; then
    yabai -m window $YABAI_WINDOW_ID --toggle float --grid 9:4:1:2:2:3:
    yabai -m window $YABAI_WINDOW_ID --focus
elif
    [[ $title =~ "medium-popup" && $display == 1 ]]; then
    yabai -m window $YABAI_WINDOW_ID --toggle float --grid 6:8:2:1:4:4:
    yabai -m window $YABAI_WINDOW_ID --focus
elif
    [[ $title =~ "large-popup" && $display == 1 ]]; then
    yabai -m window $YABAI_WINDOW_ID --toggle float --grid 10:11:2:1:7:8:
    yabai -m window $YABAI_WINDOW_ID --focus
else
    false
fi
