{ config, pkgs, lib, ... }:

let
  taps = [
    "homebrew/bundle"
    "homebrew/cask"
    "homebrew/cask-versions"
    "homebrew/cask-fonts"
    "homebrew/core"
    "homebrew/services"
    "koekeishiya/formulae"
  ];

  brews = [ 
  ];

  casks = [
    "figma"
    "slack"
    "visual-studio-code"
    "zoom"
  ];

in with lib; {
  home.sessionPath = [ "/opt/homebrew/bin" ];

  home.file.".Brewfile" = {
    text = (concatMapStrings (tap:
      ''tap "'' + tap + ''
        "
      ''

    ) taps) + (concatMapStrings (brew:
      ''brew "'' + brew + ''
        "
      ''

    ) brews) + (concatMapStrings (cask:
      ''cask "'' + cask + ''
        "
      ''

    ) casks);
    onChange = ''
      /opt/homebrew/bin/brew bundle install --cleanup --verbose --no-upgrade --force --no-lock --global
    '';
  };
}