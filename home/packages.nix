{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Tools1
    bottom
    httpie

    # Programming

    # LSPs and formatters

    # Nix
    
    # fonts
    
  ];


  programs.bat = {
    enable = true;
    config.theme = "ansi";
    extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batpipe
        batgrep
        batwatch
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = true;
    git = true;
    extraOptions = [ "--group-directories-first" ];
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.tealdeer = {
    enable = true;
    settings.updates.auto_update = true;
  };
}