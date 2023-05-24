# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/pkgs.nix
# Desc: Installed packages
{ lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      # B
      bat
      bottom
      btop
      # C
      coreutils
      cppclean
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
      nixfmt
      # R
      ripgrep
      rustup
      # S
      shellcheck
      # T
      terminal-notifier
      # W
      wget
      # Y
      yt-dlp
    ] ++ lib.optionals stdenv.isDarwin [ iterm2 ];
}
