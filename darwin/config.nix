# _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: darwin/config.nix
# Desc: Darwin configuration options
{ pkgs, ... }: {
  users.users."<USER>" = {
    home = "<HOME>";
    shell = pkgs.zsh;
  };
  nix = {
    useDaemon = true;
    package = pkgs.nix;
    gc = {
      user = "<USER>";
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };
  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        showhidden = true;
      };
      NSGlobalDomain = {
        AppleFontSmoothing = 2;
        AppleInterfaceStyle = "Dark";
        AppleInterfaceStyleSwitchesAutomatically = true;
        NSAutomaticWindowAnimationsEnabled = true;
        NSTableViewDefaultSizeMode = 1;
        AppleShowScrollBars = "WhenScrolling";
        "com.apple.springing.delay" = 0.5;
        "com.apple.swipescrolldirection" = true;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleTemperatureUnit = "Celsius";
        AppleICUForce24HourTime = false;
        _HIHideMenuBar = false;
        # Finder
        AppleShowAllExtensions = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        # Sound
        "com.apple.sound.beep.volume" = 0.25;
        "com.apple.sound.beep.feedback" = 0;
        # Language & Keyboard
        # NSAutomaticSpellingCorrectionEnabled = true;
        InitialKeyRepeat = 25;
        KeyRepeat = 2;
      };
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
      trackpad = {
        Clicking = false;
        TrackpadRightClick = true;
      };
    };
    activationScripts.postUserActivation.text =
      "sudo chsh -s ${pkgs.zsh}/bin/zsh";
    stateVersion = 4;
  };
  programs.zsh.enable = true;
}
