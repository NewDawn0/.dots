#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/alacritty.nix
# Desc: Alacritty term configuration
{ pkgs, ... }: {
  programs = {
    alacritty = {
      enable = true;
      settings = {
        font = rec {
          normal.family = "FiraCode Nerd Font";
          bold = { style = "Bold"; };
          size = 12;
        };
        offset = {
          x = -1;
          y = 0;
        };
      };
    };
  };
}
