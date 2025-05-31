{ lib }:

let
  myLib = import ./lib/type-checker.nix { inherit lib; };
  myTypes = import ./types { inherit myLib lib; };
in { inherit myLib myTypes; }
