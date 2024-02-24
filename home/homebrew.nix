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
    "support/cyon-tools"
  ];

  brews = [ 
  ];

  casks = [
    "1password"
    "amethyst"
    "docker"
    "figma"
    "firefox-developer-edition"
    "google-chrome"		
    "hyperkey"
    "iterm2"
    "maccy"
    "seafile-client"
    "slack"
    "notion"
    "sony-ps-remote-play"
    "affinity-publisher"
    "affinity-photo"
    "affinity-designer"
    "spaceman"
    "spotify"
    "todoist"
    "visual-studio-code"
    "whatsapp"
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
