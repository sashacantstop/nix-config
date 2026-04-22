{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
	
  users.users.sfaye = {
    isNormalUser = true;
    description = "sfaye";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  services.greetd.enable = true;
  services.greetd.settings.default_session.command =
    "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
}

