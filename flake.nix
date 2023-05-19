{
  description = "NewDawn0's system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Nix darwin
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, darwin, home-manager, nixpkgs }: {
    darwinConfigurations.<HOST> = darwin.lib.darwinSystem {
      system = "<ARCH>";
      modules = [
        ./config.nix
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { };
            users."<USER>".imports = [ ./home.nix ];
          };
        }
      ];
    };
  };
}
