{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Utils
    bitwarden-cli
    fontconfig
    
    # Tools
    bottom
    curl
    fd
    fzf
    httpie
    nix-prefetch-github
    ripgrep
    vim
    wget
    wireguard-tools

    # Programming
    elixir
    nodejs_21
    corepack_21
    php
    python39
    ruby

    # LSPs and formatters
    json_c
    sass
    vscode-langservers-extracted
    
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
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };
}
