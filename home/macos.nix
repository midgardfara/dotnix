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
    };
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