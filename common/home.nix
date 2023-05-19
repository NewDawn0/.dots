#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/home.nix
# Desc: Home-Manager configuration
{ pkgs, ... }: {
  # Home manager config
  home = {
    stateVersion = "23.05";
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
      TERM = "xterm-256color";
      COLORTERM = "24bit";
      SYSTEMD_COLORS = "true";
      FZF_CTRL_R_OPTS = "--sort --exact";
      VI_MODE_RESET_PROMPT_ON_MODE_CHANGE = "true";
      VI_MODE_SET_CURSOR = "true";
    };
  };
  programs = { home-manager.enable = true; };
}
