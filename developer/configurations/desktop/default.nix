{ pkgs, ... }:

{
  imports =
    [ ./display.nix (import ./desktop-environment.nix { inherit pkgs; }) ];
}
