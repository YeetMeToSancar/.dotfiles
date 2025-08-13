#!/bin/sh

pushd ~/.dotfiles
sudo nixos-rebuild switch -I nixos-config=./system/GiggleByte/configuration.nix
popd
