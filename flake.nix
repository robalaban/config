{
  description = "Robert's darwin config";
  inputs = {
    # base imports
    utils.url = "github:numtide/flake-utils";

    # system.stateVersionos/nix-darwin dependencies
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, darwin, nixpkgs-darwin, nixpkgs, home-manager, utils, ... }:
    let
      inherit (darwin.lib) darwinSystem;
      inherit (inputs.nixpkgs.lib)
        attrValues makeOverridable optionalAttrs singleton;

      defaultSystems = [ "aarch64-darwin" ];

      # Configuration for `nixpkgs`
      nixpkgsConfig = {
        config = { allowUnfree = true; };
        overlays = attrValues self.overlays ++ singleton (
          # Sub in x86 version of packages that don't build on Apple Silicon yet
          final: prev:
          (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
            inherit (final.pkgs-x86)
            ;
          }));
      };
    in {
      darwinConfigurations = rec {
        robert = darwinSystem {
          system = "aarch64-darwin";
          modules = [
            # Main `nix-darwin` config
            ./darwin
            # `home-manager` module
            home-manager.darwinModules.home-manager
            ({ config, lib, pkgs, ... }:
              let primaryUser = "robert";
              in {
                nixpkgs = nixpkgsConfig;
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                users.users.${primaryUser}.home = "/Users/${primaryUser}";
                home-manager.users.robert = import ./home-manager;
              })
          ];
        };
      };

      overlays = {
        apple-silicon = final: prev:
          optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
            # Add access to x86 packages system is running Apple Silicon
            pkgs-x86 = import inputs.nixpkgs-master {
              system = "x86_64-darwin";
              inherit (nixpkgsConfig) config;
            };
          };
      };
    };
}
