#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

## Script Termination
exit_on_signal_SIGINT () {
    { printf "\n\n%s\n" "Script interrupted." 2>&1; echo; }
    exit 0
}

exit_on_signal_SIGTERM () {
    { printf "\n\n%s\n" "Script terminated." 2>&1; echo; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Installation
rm "$SCRIPT_DIR"/archcraft-openbox-*.pkg.tar.zst

./build.sh

install_pkg () {
  echo -e "\nInstalling Package - \n"
  sudo pacman -U archcraft-openbox-*.pkg.tar.zst
}

install_pkg

## Copying files
cp -r /etc/skel/.config "$HOME"/.config

openbox --reconfigure
