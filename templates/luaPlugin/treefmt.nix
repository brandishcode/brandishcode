{ pkgs, ... }:

{
  projectRootFile = "flake.nix";
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
  programs.nixfmt.enable = true;
}
