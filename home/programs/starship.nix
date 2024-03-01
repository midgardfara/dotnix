{ config, pkgs, lib, ... }: {

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      format = ''
        [┌───────────────────>](bold green)$directory$rust$package
        [└─>](bold green) 
      '';
      character = {
        success_symbol = "➜";
        error_symbol = "➜";
        # Git Stuff
      };
      git_branch.format	 = "on [$symbol$branch(:$remote_branch)]($style) ";
    };
  };
}

