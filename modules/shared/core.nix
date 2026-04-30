{ ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    warn-dirty = false;
    sandbox = true;
  };

  environment.variables = {
    EDITOR = "nvim";
    LANG = "en_EN.UTF-8";
  };
}
