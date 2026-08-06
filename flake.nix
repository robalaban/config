{
  description = "Robert's darwin config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
    inputs@{
      self,
      darwin,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      mkHost =
        hostModule:
        darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            # Main `nix-darwin` config
            ./darwin
            # Per-host config (personal vs work)
            hostModule
            # `home-manager` module
            home-manager.darwinModules.home-manager
            (
              {
                config,
                lib,
                pkgs,
                ...
              }:
              let
                primaryUser = "robert";
              in
              {
                nixpkgs.config.allowUnfree = true;
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                users.users.${primaryUser}.home = "/Users/${primaryUser}";
                home-manager.users.${primaryUser} = import ./home-manager;
              }
            )
          ];
        };
    in
    {
      # Attribute names match each machine's LocalHostName so that
      # `darwin-rebuild switch --flake .` auto-selects the right one.
      darwinConfigurations = {
        robert = mkHost ./hosts/personal.nix;
        robert-work = mkHost ./hosts/work.nix;
      };
    };
}
