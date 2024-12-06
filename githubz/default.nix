{ config, pkgs, ... }:

let
  # Define the go-blueprint package using fetchFromGitHub
  go-blueprint = pkgs.buildGoModule {
    pname = "go-blueprint";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "Melkeydev";
      repo = "go-blueprint";
      rev = "389802aa986d1be3b082e5ddf719d6fbff4bddd7"; # Use a commit hash for reproducibility
      sha256 = "sha256-PZugw45Qy/lWtEQurvMZTgrQM4B4e661PaEnrLPX9xo="; # Replace with the actual SHA256
    };
    vendorSha256 = null; # Add this if the repo requires vendored dependencies
  };
in
{
  home.packages = with pkgs; [
    go # Include Go if needed for other projects
    
  ];
}
