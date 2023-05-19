# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/home.nix
# Desc: home-manager settings
{ pkgs, ... }: {
  home = {
    packages = with pkgs; [ ripgrep fd curl wget less gnat rustup git neovim ];
    sessionVariables = {
      PAGER = "less";
      EDITOR = "nvim";
      VISUAL = "nvim";
      GIT_EDITOR = "nvim";
      FIGNORE = "*.o:~:Application Scripts:CVS:.git";
      MANPAGER = "less -R --use-color -Dd+r +Gg -M -s";
      LESS =
        "--raw-control-chars -FXRadeqs -P--Less--?e?x(Next file: %x):(END).:?pB%pB%.";
      # Locale
      LANG = "C";
      LOCALE = "C";
      LC_ALL = "C";
      # General
      KEYTIMEOUT = 1;
      CLICOLOR = 1;
      CLICOLOR_FORCE = "yes";
      SYSTEMD_COLORS = "true";
      FZF_CTRL_R_OPTS = "--sort --exact";
      VI_MODE_RESET_PROMPT_ON_MODE_CHANGE = "true";
      VI_MODE_SET_CURSOR = "true";
    };
    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;
}
