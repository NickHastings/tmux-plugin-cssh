#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$CURRENT_DIR/tcssh  --list
tmux command-prompt -p "Select cluster:" "run-shell '$CURRENT_DIR/tcssh %% 2>&1'"
