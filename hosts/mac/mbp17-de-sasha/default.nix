# hosts/mac/mbp17-de-sasha/default.nix
# Host-specific configuration for mbp17-de-sasha

{ pkgs, self, ... }:

{
  networking.hostName = "mbp17-de-sasha";

  users.users.sfaye = {
    name  = "sfaye";
    home  = "/Users/sfaye";
    shell = pkgs.zsh;
  };

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;
}
