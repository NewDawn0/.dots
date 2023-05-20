#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/packages.nix
# Desc: System level packages
{ pkgs, ... }: {
  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      # B
      bat
      bottom
      btop
      # C
      coreutils
      ctags
      curl
      # E
      exa
      # F
      fd
      figlet
      file
      fzf
      # G
      git
      gnat
      gnused
      # J
      jq
      # L
      less
      # M
      mdcat
      # N
      nasm
      neovim
      # R
      ripgrep
      rustup
      # S
      shellcheck
      # W
      wget
      # Y
      yt-dlp
    ];
  };
}
