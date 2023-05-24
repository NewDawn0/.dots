# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: darwin/yabai.nix
# Desc: Yabai WM configuration
{ lib, config, pkgs, ... }: {
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    config = {
      # General
      split_ratio = 0.5;
      auto_balance = "on";
      # Border
      window_border = "off";
      active_window_border_topmost = "on";
      window_border_width = 2;
      active_window_border_color = "0xffff3050";
      normal_window_border_color = "0xffaaaaaa";
      # Mouse
      mouse_action1 = "resize";
      mouse_action2 = "move";
      mouse_drop_action = "swap";
      mosue_modifier = "fn";
      mouse_follows_focus = "off";
      # Window
      active_window_opacity = 1.0;
      normal_window_opacity = 0.9;
      window_placement = "second_child";
      window_topmost = "on";
      window_shadow = "on";
      window_opacity = "on";
      # Layout
      layout = "bsp";
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;
    };
    extraConfig = ''
      yabai -m rule --add app='^Emacs$' manage=on
      yabai -m rule --add title='Preferences' manage=off layer=above
      yabai -m rule --add title='Library' manage=off layer=above
      yabai -m rule --add app='^System Preferences$' manage=off layer=above
      yabai -m rule --add app='Activity Monitor' manage=off layer=above
      yabai -m rule --add app='Finder' manage=off layer=above
      yabai -m rule --add app='^System Information$' manage=off layer=above
      yabai -m rule --add app="^balenaEtcher.*" manage=off layer=above
      yabai -m rule --add app="^raycast$" manage=off layer=above
      yabai -m rule --add app="^Font Book$" manage=off layer=above
      yabai -m rule --add app="^Calculator$" manage=off layer=above
      yabai -m rule --add app="^iTerm2$" manage=on
    '';
  };
}
