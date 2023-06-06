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
      cmake
      coreutils
      ctags
      curl
      # D
      docker
      # E
      exa
      # F
      fd
      ffmpeg
      figlet
      file
      fzf
      # G
      git
      gnused
      gnupg
      # H
      haxe
      # J
      jq
      # L
      less
      luajit
      # M
      mdcat
      mpv
      # N
      nasm
      neko
      neovim
      nixfmt
      # P
      pass
      podman
      # Q
      qemu
      # R
      ripgrep
      rustup
      # S
      shellcheck
      # T
      terminal-notifier
      tldr
      # W
      wget
      # Y
      yt-dlp
      # Z
      zig
    ] ++ lib.optionals stdenv.isDarwin [ iterm2 skhd ];
}
