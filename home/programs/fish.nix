{ config, pkgs, ... }: {
 
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "hydro";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "hydro";
          rev = "41b46a05c84a15fe391b9d43ecb71c7a243b5703";
          sha256 = "sha256-zmEa/GJ9jtjzeyJUWVNSz/wYrU2FtqhcHdgxzi6ANHg=";
        };
      }
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "79b62958ecf4e87334f24d6743e5766475bcf4d0";
          sha256 = "sha256-3d/qL+hovNA4VMWZ0n1L+dSM1lcz7P5CQJyy+/8exTc=";
        };
      }
    ];

    loginShellInit =
      "fish_add_path --move --prepend --path $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin";

    shellInit = ''
      # Sources
      /opt/homebrew/bin/brew shellenv | source

      # Paths
      fish_add_path $HOME/.local/bin

      if test -d (brew --prefix)"/share/fish/completions"
          set -gx fish_complete_path (brew --prefix)/share/fish/completions $fish_complete_path 
      end

      if test -d (brew --prefix)"/share/fish/vendor_completions.d"
          set -gx fish_complete_path (brew --prefix)/share/fish/vendor_completions.d $fish_complete_path 
      end

      # Hydro
      set -g hydro_symbol_prompt "$(shell_level)▶"
      set -U hydro_multiline true
      set -U fish_prompt_pwd_dir_length 2
      set -U hydro_color_git "#CC5500"
      set -U hydro_color_duration	grey
    '';

    shellAliases = { 
      ll = "eza -abhl --icons --group-directories-first";
      cl = "clear";
      mkdir = "mkdir -pv";
      svi = "sudo vi";
      cpwd = "pwd | tr -d '\n' | pbcopy && echo $PWD' copied to clipboard'";
      ".." = "z ..";
      "..." = "z ../..";
      "...." = "z ../../..";
      "....." = "z ../../../..";
      "......" = "z ../../../../..";
    };

    functions = {
      hmm = {
        description = "Home Manager Manager";
        argumentNames = "DO";
        body = ''
          switch $DO
            case brew
              vim $HOME/repos/private/dotnix/home/homebrew.nix
            case pkgs
              vim $HOME/repos/private/dotnix/home/packages.nix
            case '*'
              home-manager $DO
          end
        '';
      };
      fish_greeting = {
        description = "Overwrites default Greeting to show when starting a fish shell";
        body = "echo 'Hey 🐻'";
      };
      shell_level = {
        description = "show the current shell level as icon";
        body = ''
          switch (math "$SHLVL - 1")
            case 0
                echo " "
            case 1
                echo ⋅
            case 2
                echo ∶
            case 3
                echo ∴
            case 4
                echo ∷
            case '*'
                echo (math "$SHLVL - 1")
          end
        '';
      };
    };
  };
}

