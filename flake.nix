{
  description = "My Awesome System Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-25.05";
    nix-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nix-unstable, home-manager, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true;  };
    };
    
    lib = nixpkgs.lib;
    
  in {
    nixosConfigurations = {
      GiggleByte = lib.nixosSystem {
        inherit system;

        modules = [
          ./system/GiggleByte/configuration.nix
        ];
      };
    };


  };
}
