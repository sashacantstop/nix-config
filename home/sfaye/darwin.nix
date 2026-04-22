{ pkgs, ... }:

{
  home.homeDirectory = "/Users/sfaye";

  programs.alacritty = {
    enable = true;
  };

  home.packages = with pkgs; [
    mas
  ];
}

