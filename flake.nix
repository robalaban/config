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
    {
      darwin,
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
            {
              nixpkgs.config.allowUnfree = true;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.robert = import ./home-manager;
            }
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
