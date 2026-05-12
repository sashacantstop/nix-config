{ config, pkgs, ... }:

{
  home.homeDirectory = "/Users/sfaye";

  programs.alacritty = {
    enable = true;
  };

  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}"/.config/alacritty/alacritty.toml;
  home.file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink /Users/sfaye/.vimrc;
  home.file.".config/kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink .config/kitty;
    recursive = true;
  };
  home.file."Notes" = {
    source =  config.lib.file.mkOutOfStoreSymlink /Users/sfaye/Notes;
    recursive = true;
  };

  home.packages = with pkgs; [
    mas
  ];
}

