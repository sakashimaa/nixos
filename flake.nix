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
    claude-code.url = "github:sadjow/claude-code-nix";
  };

  outputs =
    {
      nixpkgs,
      sops-nix,
      niri,
      noctalia,
      claude-code,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit noctalia niri; };
        modules = [
          {
            nixpkgs.overlays = [ claude-code.overlays.default ];
          }

          ./configuration.nix
          sops-nix.nixosModules.sops
          niri.nixosModules.niri

          home-manager.nixosModules.home-manager
          {
            home-manager.sharedModules = [
              sops-nix.homeManagerModules.sops
            ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.yoko = import ./home.nix;
          }
        ];
      };
    };
}
