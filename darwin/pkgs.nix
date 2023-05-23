#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: darwin/pkgs.nix
# Desc: Installed darwin packages
{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [
    iterm2
  ];
}
