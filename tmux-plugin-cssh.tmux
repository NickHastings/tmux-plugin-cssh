#!/usr/bin/env bash
#
# Copyright 2024 Nick Hastings <nicholaschastings@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LAUNCH_KEY="$(tmux show-option -gv '@tmux_cssh_launch')"

if [ -z "$LAUNCH_KEY" ]; then
    LAUNCH_KEY="C"
fi

tmux bind-key "$LAUNCH_KEY" "run-shell -b \"$CURRENT_DIR/tcssh --menu\""
tmux set-option -g pane-base-index 1
