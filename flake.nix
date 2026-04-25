 {
  description = "sfaye cross-platform Nix config (nix-darwin now, NixOS scaffold next)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

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
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nixvim, ... }: {

    # -----------------------------------------------------------------------
    # macOS - nix-darwin
    # -----------------------------------------------------------------------
    darwinConfigurations."mbp17-de-sasha" = nix-darwin.lib.darwinSystem
    {
      system = "x86_64-darwin";
      specialArgs = { inherit inputs self; };
      modules = [
        ./hosts/mac/mbp17-de-sasha/default.nix
        ./modules/darwin/system.nix
        ./modules/shared/core.nix

        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bak";
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [ nixvim.homeManagerModules.nixvim ];
            users.sfaye = { imports = [
              ./home/sfaye/common.nix
              ./home/sfaye/darwin.nix
              ./home/sfaye/editors/nixvim.nix
            ]; };
          };
        }
      ];
    };   

    # -------------------------------------------------------------------
    # NixOS — x86_64 workstation 
    # -------------------------------------------------------------------
    nixosConfigurations."pc-workstation" = nixpkgs.lib.nixosSystem {
      system      = "x86_64-linux";
      specialArgs = { inherit inputs self; };
      modules = [
        ./hosts/pc/workstation/default.nix
        ./modules/nixos/base.nix
        ./modules/shared/core.nix
	./modules/nixos/desktops/hyprland.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs    = true;
            useUserPackages  = true;
            extraSpecialArgs = { inherit inputs; };
            sharedModules    = [ nixvim.homeManagerModules.nixvim ];
            users.sfaye      = { imports = [
              ./home/sfaye/common.nix
              ./home/sfaye/linux.nix
              ./home/sfaye/editors/nixvim.nix
      	      ./home/sfaye/desktops/hyprland.nix
            ]; };
          };
        }
      ];
    };
  };
}
