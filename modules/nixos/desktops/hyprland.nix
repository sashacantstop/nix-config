{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    hyprlock
    hypridle
    hyprpaper
    waybar
    mako
    wl-clipboard
    grim
    slurp
    brightnessctl
    playerctl
    networkmanagerapplet
    pavucontrol
    alacritty
  ];
}
