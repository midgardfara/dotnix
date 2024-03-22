{ config, pkgs, lib, ... }:

{
  targets.darwin.defaults = {
    "com.apple.dock" = {
      autohide = true;
      show-recents = false;
      static-only = true;
    };
    NSGlobalDomain = {
      InitialKeyRepeat = 15;
      KeyRepeat = 1;
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      "com.apple.swipescrolldirection" = true;
    };
    "com.apple.screencapture".location = "~/Desktop/Screenshots/";
  };

  home.file.".hushlogin".text = "";

  fonts.fontconfig.enable = true;

  launchd.agents.load-ssh-keys = {
    enable = true;
    config = {
      UserName = "sek";
      ProgramArguments = [ "/usr/bin/ssh-add" "--apple-load-keychain" ];
      RunAtLoad = true;
    };
  };
  
}

