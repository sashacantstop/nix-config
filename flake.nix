{
  description = "nix/nixOS config - cross-platform Nix for macOS & NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nixvim, flake-parts, ... }: {

    # ───────────────────────────────────────────────────────────────────
    # macOS - nix-darwin
    # ───────────────────────────────────────────────────────────────────
    darwinConfigurations."mbp17-de-sasha" = nix-darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      specialArgs = { inherit inputs self; };
      modules = [
        ./hosts/darwin/mbp17-de-sasha/default.nix
        ./modules/darwin/base.nix
        ./modules/darwin/packages.nix
        ./modules/darwin/system-defaults.nix
        ./modules/shared/sys-all.nix

        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bak";
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [ nixvim.homeModules.nixvim ];
            users.sfaye = { 
              imports = [
                ./home/sfaye/common.nix
                ./home/sfaye/darwin.nix
                ./home/sfaye/editors/nixvim.nix
              ];
            };
          };
        }
      ];
    };

    # ───────────────────────────────────────────────────────────────────
    # NixOS - Laptops with Hyprland
    # ───────────────────────────────────────────────────────────────────
#    nixosConfigurations."p16g1" = nixpkgs.lib.nixosSystem {
#      system = "x86_64-linux";
#      specialArgs = { inherit inputs self; };
#      modules = [
#        ./hosts/PC/P16G1/default.nix
#        ./modules/shared/sys-all.nix
#        ./modules/nixos/desktops/hyprland.nix
#
#        home-manager.nixosModules.home-manager
#        {
#          home-manager = {
#            useGlobalPkgs = true;
#            useUserPackages = true;
#            extraSpecialArgs = { inherit inputs; };
#            sharedModules = [ nixvim.homeModules.nixvim ];
#            users.sfaye = { 
#              imports = [
#                ./home/sfaye/common.nix
#                ./home/sfaye/linux.nix
#                ./home/sfaye/editors/nixvim.nix
#                ./home/sfaye/desktops/hyprland.nix
#              ]; 
#            };
#          };
#        }
#      ];
#    };
#
#    nixosConfigurations."t440" = nixpkgs.lib.nixosSystem {
#      system = "x86_64-linux";
#      specialArgs = { inherit inputs self; };
#      modules = [
#        ./hosts/PC/T440/default.nix
#        ./modules/shared/sys-all.nix
#        ./modules/nixos/desktops/hyprland.nix
#
#        home-manager.nixosModules.home-manager
#        {
#          home-manager = {
#            useGlobalPkgs = true;
#            useUserPackages = true;
#            extraSpecialArgs = { inherit inputs; };
#            sharedModules = [ nixvim.homeModules.nixvim ];
#            users.sfaye = { 
#              imports = [
#                ./home/sfaye/common.nix
#                ./home/sfaye/linux.nix
#                ./home/sfaye/editors/nixvim.nix
#                ./home/sfaye/desktops/hyprland.nix
#              ]; 
#            };
#          };
#        }
#      ];
#    };
  };
}
