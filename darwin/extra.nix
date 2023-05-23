#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: darwin/extra.nix
# Desc: Additional settings for mac
{ config, lib, pkgs, ... }: {
  programs.zsh.shellAliases = {
    wmre = "sudo launchctl kickstart -k gui/501/org.nixos.yabai && sudo launchctl kickstart -k gui/501/org.nixos.skhd"; # Restart window manager + hotkey daemon
  };
}
