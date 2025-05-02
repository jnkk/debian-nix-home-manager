{
  description = "Home Manager configuration of jnkk";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # roc.url = "github:roc-lang/roc";
    # ghostty = {
    	# url = "github:ghostty-org/ghostty";
    	# inputs.ghostty.follows = "ghostty";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in {
      homeConfigurations."jnkk" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          # nixvim.homeManagerModules.nixvim
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

    };
}
