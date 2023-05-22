#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/fonts.nix
# Desc: Installed fonts
{ pkgs, ... }: {
  fonts = {
    fontDir.enable = false;
    fonts = with pkgs; [
      source-code-pro
      font-awesome
      (nerdfonts.override {
        fonts = [
          "Meslo"
          "FiraCode"
          "Hermit"
          "Iosevka"
          "Hack"
          "JetBrainsMono"
          "DroidSansMono"
          "VictorMono"
        ];
      })
    ];
  };
}
