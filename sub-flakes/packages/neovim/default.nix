{
  pkgs,
  system,
  nixvim,
  jsSupport ? false,
  javaSupport ? false,
  jdt-language-server ? pkgs.jdt-language-server,
  jdk17 ? pkgs.openjdk17_headless,
  jdk24 ? pkgs.openjdk24_headless,
  ...
}:

let
  nixvimPkgs = nixvim.legacyPackages.${system};
in
nixvimPkgs.makeNixvimWithModule {
  inherit pkgs;
  module = {
    imports = [ ./modules.nix ];
  };
  extraSpecialArgs = {
    inherit
      jsSupport
      javaSupport
      jdt-language-server
      jdk17
      jdk24
      ;
  };
}
