{ config, pkgs, lib, ... }:

{
  home = {
    username = "sek";
    homeDirectory = "/Users/sek";
    stateVersion = "23.11";
  };
  
  programs.home-manager.enable = true;

  imports = map (x: ./home + x) [
    /macos.nix
    /packages.nix
    /homebrew.nix 

    # programms
    /programs/fish.nix
    # /programs/starship.nix
    /programs/git.nix
  ];
}
