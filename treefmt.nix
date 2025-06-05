# treefmt.nix
{ pkgs, ... }:
{
  settings.verbose = 1;
  # Used to find the project root
  projectRootFile = ".git/config";
  # Enable the terraform formatter
  programs.nixfmt.enable = true;
}
