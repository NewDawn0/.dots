# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/starship.nix
# Desc: Starship prompt settings
{ pkgs, ... }: {
  home.packages = with pkgs; [ starship ];
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      # Enabled
      character = {
        success_symbol = "[ ](#ffa500)";
        error_symbol = "[ ](#ff5555)";
        vimcmd_symbol = "[ ](#a6da95)";
        disabled = false;
      };
      cmd_duration = {
        min_time = 1;
        format = "[ $duration ](fg:#ff7420 bg:none)";
        disabled = false;
      };
      directory = {
        format = "[ $path](fg:#ff5868 bg:none)";
        truncation_length = 3;
        truncate_to_repo = false;
        disabled = false;
      };
      # Disabled
      git_branch.disabled = true;
      git_status.disabled = true;
      git_commit.disabled = true;
      git_state.disabled = true;
      time.disabled = true;
      docker_context.disabled = true;
      hostname.disabled = true;
      username.disabled = true;
      battery.disabled = true;
      # Langs & Frameworks
      c = {
        format = "[ $symbol $version]($style)";
        symbol = "";
        disabled = false;
      };

      conda = {
        format = "[ $symbol $version Conda]($style)";
        disabled = false;
      };
      dart = {
        format = "[ $symbol $version Dart]($style)";
        disabled = false;
      };
      package = {
        format = "[ $symbol $version]($style)";
        symbol = "";
        disabled = false;
      };
      perl = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      php = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      ruby = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      java = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      lua = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      nodejs = {
        format = "[ $symbol $version]($style)";
        symbol = "";
        disabled = false;
      };
      swift = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      julia = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      python = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      rust = {
        format = "[ $symbol $version]($style)";
        symbol = "";
        disabled = false;
      };
      golang = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      haskell = {
        format = "[ $symbol $version]($style)";
        disabled = false;
      };
      elixir = { disabled = false; };
      kotlin = { disabled = false; };
    };
  };
}
