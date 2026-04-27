{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs =
    {
      nixpkgs,
      sops-nix,
      niri,
      noctalia,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit noctalia niri; };
        modules = [
          ./configuration.nix
          sops-nix.nixosModules.sops
          niri.nixosModules.niri
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.yoko = import ./home.nix;
          }
          (
            { pkgs, modulesPath, ... }:
            {
              imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
            }
          )
        ];
      };
    };
}
