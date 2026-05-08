{ ... }:

{
  imports = [
    ../../../modules/shared/core.nix
    ../../../modules/nixos/base.nix
    ../../../modulea/nixos/desktop/hyprland.nix
  ];

  networking.hostName = "P16G2";
  time.timeZone = "America/Los_Angeles";

}
