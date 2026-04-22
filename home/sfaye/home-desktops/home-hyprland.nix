{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
    ];

    extraConfig = ''
      source = ~/.config/hypr/legacy.conf
    '';
  };

  xdg.configFile."hypr/legacy.conf".source = ./hypr/legacy.conf;
}
