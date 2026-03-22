#!/bin/bash

SRC_PATH="$(readlink -f "${SRC_DIR:-.}")"
TARGET_PATH="$(readlink -f "${TARGET_PATH:-..}")"

if [ -z "$APPS" ]; then
	APPS="$(find $SRC_PATH -maxdepth 1 -type d -not -name ".*" | sed "s|^${SRC_PATH}/\?||")"
fi

src=()

for app in $APPS; do
	src+=("-R" "$app")
done

stow --dotfile --no-folding --dir "$SRC_PATH" --target "$TARGET_PATH" "${src[@]}"
