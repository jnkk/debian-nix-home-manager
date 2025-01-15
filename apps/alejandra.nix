{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    alejandra.url = "github:kamadorueda/alejandra/3.1.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {alejandra, nixpkgs, ...}: {
    nixosConfigurations = {
      example = nixpkgs.lib.nixosSystem rec {
        # We support: aarch64-darwin, aarch64-linux, i686-linux, x86_64-darwin, x86_64-linux
        system = "x86_64-linux";

        modules = [
          {
            environment.systemPackages = [alejandra.defaultPackage.${system}];
          }
          # Import your other modules here
          # ./path/to/my/module.nix
          # ...
        ];
      };
    };
  };
}