{
  description = "Knuspii Custom Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      hostname = "framework";
      username = "knuspii";
    in
    {
      nixosConfigurations = {
        # System-Level Setup
        "${hostname}" = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [ ./nixos/configuration.nix ];
          specialArgs = { inherit self nixpkgs home-manager; };
        };
      };

      homeConfigurations = {
        # User-Level Setup
        "${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./home-manager/home.nix ];
          extraSpecialArgs = { inherit self nixpkgs home-manager; };
        };
      };
    };
}
