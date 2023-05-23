#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: darwin/default.nix
# Desc: Darwin configuration
{ pkgs, ... }: {
  nix = {
    settings = {
      sandbox = true;
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
      extra-sandbox-paths = [ "/private/tmp" "/usr/bin/env" ];
    };
    configureBuildUsers = true;
    useDaemon = true;
    package = pkgs.nix;
    gc = {
      user = "tom";
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-derivations = true
      keep-outputs = true
    '';
  };
  programs.nix-index.enable = true;
  # Env
  environment = {
    shells = with pkgs; [ bash zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  # System config
  system = {
    defaults = {
      screencapture = {
        disable-shadow = false;
        location = "<HOME>/Pictures";
      };
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
  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
    caskArgs.no_quarantine = false;
    global.brewfile = true;
    masApps = { };
    casks = [ "raycast" ]; # Apps
    taps = [ ];
    brews = [ "imagemagick" ];
  };
  services.nix-daemon.enable = true;
  # here go the darwin preferences and config items
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = false;
}
