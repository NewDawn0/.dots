# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: common/zsh.nix
# Desc: Z-Shell settings
{ lib, config, pkgs, ... }: {
  home.packages = with pkgs; [ zsh exa gnat neovim git ];
  programs.zsh = {
    enable = true;
    autocd = false;
    dotDir = ".config/zsh";
    oh-my-zsh.enable = false;
    shellAliases = {
      # Nix
      nixse = "nix search nixpkgs";
      nixrm = "nix-env --uninstall";
      nixls = "nix-env --query";
      nixup =
        "nix-channel --update && nix-env -iA nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist";
      nix-gc = "nix-collect-garbage";
      # Cargo
      cargoup = "cargo install-update -a";
      # Utils
      reload = "~/.zshrc";
      ls = "exa";
      lsa = "exa --all --all";
      lt = "exa -T --color=always --group-directories-first";
      lta = "exa -aT --color=always --group-directories-first";
      grep = "grep --color=auto";
      mv = "mv -i";
      cp = "cp -i";
      exit = "kill -9 $$";
      "g++" = "g++ -std=c++17";
      # Media
      vim = "nvim";
      ytdl-mp3 = "yt-dlp -x --audio-format mp3 --embed-thumbnail";
      # Git
      add = "git add";
      push = "git push";
      pull = "git pull";
      commit = "git commit -m";
    };
    history = {
      size = 100000;
      path = "/Users/tom/zsh/history";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    sessionVariables = { MAILCHECK = 30; };
    initExtra = ''
      # Syntax
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ffcc00,bg=none"
      # Functions
      function gvim() { neovide "$@" }
      function ex () {
          if [ -f "$1" ] ; then
              case $1 in
                  *.tar.bz2)   tar xjf $1   ;;
                  *.tar.gz)    tar xzf $1   ;;
                  *.bz2)       bunzip2 $1   ;;
                  *.rar)       unrar x $1   ;;
                  *.gz)        gunzip $1    ;;
                  *.tar)       tar xf $1    ;;
                  *.tbz2)      tar xjf $1   ;;
                  *.tgz)       tar xzf $1   ;;
                  *.zip)       unzip $1     ;;
                  *.Z)         uncompress $1 ;;
                  *.7z)        7z x $1      ;;
                  *.deb)       ar x $1      ;;
                  *.tar.xz)    tar xf $1    ;;
                  *.tar.zst)   unzstd $1    ;;
                  *)           echo "'$1' cannot be extracted via ex()" ;;
              esac
          else
              echo "'$1' is not a valid file"
          fi
      }
      function up () {
          local d=""
          local limit="$1"

          # Default to limit of 1
          if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
              limit=1
          fi

          for ((i=1;i<=limit;i++)); do
              d="../$d"
          done
          # perform cd. Show error if cd fails
          if ! cd "$d"; then
              echo "Couldn't go up $limit dirs.";
          fi
      }
      setopt HIST_FCNTL_LOCK
      setopt HIST_IGNORE_DUPS
      setopt HIST_IGNORE_SPACE
      unsetopt SHARE_HISTORY
      unsetopt EXTENDED_HISTORY
      # Keys
      set -o vi
      bindkey -v
      bindkey '^a' autosuggest-accept
      autopair-init
      # Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      # End Nix
      clear
    '';
    profileExtra = ''
      export PATH=$PATH:/usr/local/bin:~/.local/bin/:/run/current-system/sw/bin:~/.cargo/bin
    '';
    plugins = with pkgs; [
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autopair";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
          sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
        };
        file = "autopair.zsh";
      }
    ];
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
