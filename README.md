# .nix

My personal macOS Home-Manager config

Manages dotfiles and cli tools via Home-Manager/Nix and casks via Homebrew

**Heavily** inspired by [okkdev/dotnix](https://github.com/okkdev/dotnix/tree/main)

## Install steps

1. Install nix using the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
> Restart the shell after installation
2. Install homebrew
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Disable analytics
/opt/homebrew/bin/brew analytics off
```
3. Clone config
```sh
git clone git@github.com:okkdev/dotnix.git
```
4. Symlink config
```sh
mkdir ~/.config
ln -s (pwd)/dotnix ~/.config/home-manager
```
5. Activate config
```sh
nix run . -- switch
```

🚨 Fish needs to be added to `/etc/shells` manually:
```sh
echo $HOME/.nix-profile/bin/fish | sudo tee -a /etc/shells
chsh -s $HOME/.nix-profile/bin/fish
```

## Apply new config

```sh
home-manager switch
```

## Update packages

```sh
nix flake update
home-manager switch
```

```sh
brew update
brew upgrade
```
