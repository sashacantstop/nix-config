{ ... }:

{
  home.homeDirectory = "/home/sfaye";

  imports = [m./home-desktops/hyprland.nix; ];
}
