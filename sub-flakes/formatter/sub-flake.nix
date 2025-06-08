{
  nixpkgs,
  flake-utils,
  treefmt-nix,
  ...
}:
let
  treefmt = {
    settings.verbose = 1;
    projectRootFile = ".git/config";
    programs.nixfmt.enable = true;
    programs.stylua = {
      enable = true;
      settings = {
        column_width = 100;
        line_endings = "Unix";
        indent_type = "Spaces";
        indent_width = 2;
        quote_style = "AutoPreferSingle";
        call_parentheses = "Input";
      };
    };
  };
in
flake-utils.lib.eachDefaultSystem (system: {
  formatter =
    (treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} treefmt).config.build.wrapper;
})
