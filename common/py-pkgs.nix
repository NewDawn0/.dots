# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/py-pkgs.nix
# Desc: Packages for python
{ lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python3
    python3.pkgs.ipython
    python3.pkgs.jupyter
    python3.pkgs.matplotlib
    python3.pkgs.numpy
    python3.pkgs.nose
    python3.pkgs.pandas
    python3.pkgs.pip
    python3.pkgs.scipy
    python3.pkgs.sympy
    python3.pkgs.virtualenv
    python3.pkgs.virtualenvwrapper
  ];
}
