# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/nvim-pkgs.nix
# Desc: Packages for neovim
{ lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    black
    npm
    python3
    python3.pkgs.reorder-python-imports
    statix
    nixfmt
    rust
    luarocks
    fzf
    nodejs
    yarn
    ghc
    cabal-install
    stack
    ghcide
  ];
}
