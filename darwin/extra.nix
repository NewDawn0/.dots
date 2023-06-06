# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: darwin/extra.nix
# Desc: Additional settings for mac
{ lib, config, pkgs, ... }: {
  programs.zsh.shellAliases = {
    wmre =
      "sudo launchctl kickstart -k gui/501/org.nixos.yabai && killall skhd && skhd -c /etc/skhdrc >/dev/null 2>&1 &"; # Restart window manager + hotkey daemon
    wmon = "launchctl load ~/Library/LaunchAgents/org.nixos.yabai.plist";
    wmoff = "launchctl unload ~/Library/LaunchAgents/org.nixos.yabai.plist";
  };
}
