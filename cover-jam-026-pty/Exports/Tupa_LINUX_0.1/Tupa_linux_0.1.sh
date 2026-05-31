#!/bin/sh
printf '\033c\033]0;%s\a' CoverJam026_PTY
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Tupa_linux_0.1.x86_64" "$@"
