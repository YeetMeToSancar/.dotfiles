#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/gorkem/home.nix
popd
