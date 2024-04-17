#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

LAUNCH_KEY="$(tmux show-option -gv '@tmux_cssh_launch')"

if [ -z "$LAUNCH_KEY" ]; then
    LAUNCH_KEY="C"
fi

tmux bind "$LAUNCH_KEY" "run-shell -b \"$CURRENT_DIR/tcssh --menu\""
tmux set-option -g pane-base-index 1
