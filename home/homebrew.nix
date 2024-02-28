{ config, pkgs, lib, ... }:

let
  taps = [
    "homebrew/bundle"
    "homebrew/cask-versions"
    "homebrew/cask-fonts"
    "homebrew/services"
    "support/cyon-tools"
  ];

  brews = [ 
  ];

  casks = [
    "affinity-designer"
    "affinity-photo"
    "affinity-publisher"
    "amethyst"
    "docker"
    "figma"
    "firefox-developer-edition"
    "google-chrome"		
    "hyperkey"
    "iterm2"
    "maccy"
    "notion"
    "slack"
    "sony-ps-remote-play"
    "spaceman"
    "spotify"
    "todoist"
    "visual-studio-code"
    "whatsapp"
    "zoom"
    #cyon
    "1password"
    "seafile-client"
    #temp
    "miro"
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
