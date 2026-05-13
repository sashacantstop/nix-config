# home/sfaye/darwin.nix

{ config, pkgs, ... }:
let
  h = config.home.homeDirectory; # = Users/sfaye
in
{
  home.homeDirectory = "/Users/sfaye";

  home.packages = with pkgs; [ mas aerospace ];

  programs.kitty.enable = true;
  programs.alacritty.enable = true;

# --- ALACRITTY CONF ---
  home.file.".config/alacritty/alacrittty.toml".source = config.lib.file.mkOutOfStoreSymlink "${h}/.config/alacritty/alacritty.toml";

# --- VIM CONF ---
  home.file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${h}/.vimrc";
  home.file.".vim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${h}/.vim";
    recursive = true;
  };

# --- NOTES --- 
  home.file."Notes" = {
    source = config.lib.mkOutOfStoreSymlink "${h}/Notes";
    recursive = true;
  };

# --- KITTY CONF ---
  home.file.".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${h}/.config/kitty/kitty.conf";
  home.file.".config/kitty/current-theme.conf".source = config.lib.file.mkOutOfStoreSymlink "${h}/.config/kitty/current-theme.conf";

}

