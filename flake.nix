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
    {
      darwinConfigurations = {
        robert = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            # Main `nix-darwin` config
            ./darwin
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
      };
    };
}
