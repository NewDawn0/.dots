# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: darwin/yabai.nix
# Desc: Skhd hotkey daemon configuration
{ lib, config, pkgs, ... }: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # Moving windows
      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      # Resize windows
      ctrl + alt - h : \
          yabai -m window --resize left:-100:0 ; \
          yabai -m window --resize right:-100:0

      ctrl + alt - j : \
          yabai -m window --resize bottom:0:100 ; \
          yabai -m window --resize top:0:100

      ctrl + alt - k : \
          yabai -m window --resize bottom:0:-100 ; \
          yabai -m window --resize top:0:-100

      ctrl + alt - l : \
          yabai -m window --resize right:100:0 ; \
          yabai -m window --resize left:100:0

      # Float and center window
      shift + alt - f : yabai -m window --toggle float;\
                      yabai -m window --grid 4:4:1:1:2:2

      # Float / Unfloat window
      shift + alt - space : yabai -m window --toggle float

      # Make fullscreen
      alt - f : yabai -m window --toggle zoom-fullscreen

      #rotate
      alt - r : yabai -m space --rotate 90

      # Mirror Space on X and Y Axis: shift + lalt + {x, y}
      ctrl + alt - x : yabai -m space --mirror x-axis
      ctrl + alt - y : yabai -m space --mirror y-axis

      # Equalize size of windows: ctrl + lalt + e
      ctrl + alt - e : yabai -m space --balance

      # Terminal
      cmd - return : open -a iterm
      lalt - return : open -a Orion

      # Switch back to the nearest desktop
      ctrl + alt - x : yabai -m space --focus recent
    '';
  };
}
