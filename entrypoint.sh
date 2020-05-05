#!/usr/bin/env bash

echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
# https://askubuntu.com/a/691237
# figlet -w 72 -c -k Yamllint | gzip | base64
base64 -d <<<"\
H4sIAMJmsV4AA41QQQrAMAi77xW5rYNBPySkD/Hx0+q20l5aI5IYKwhsPb74OY7FEsmwerWEQg2F\
V2jOOc1qRgWbu0+imVtyVlNzTuoyy24oUb4YkXzeCyFv63mh9n8iR3RNlr0mk3XvenarB9cg3F1o\
AQAA" | gunzip
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"

if [[ -n "$INPUT_CONFIG_FILE" ]]; then
    options+=(-c "$INPUT_CONFIG_FILE")
fi

if [[ -n "$INPUT_CONFIG_DATA" ]]; then
    options+=(-d "$INPUT_CONFIG_DATA")
fi

options+=(-f "$INPUT_FORMAT")

if [[ "$INPUT_STRICT" == "true" ]]; then
    options+=(-s)
fi

shopt -s globstar
options+=(${INPUT_FILE_OR_DIR:-.})  # Use the current directory by default.
shopt -u globstar

yamllint "${options[@]}"
