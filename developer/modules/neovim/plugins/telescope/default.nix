{ pkgs, ... }:

{
  programs.nixvim = {
    # needed for telescope grep_string
    extraPackages = with pkgs; [ ripgrep ];

    plugins.telescope = { enable = true; };
  };

  imports = [ ./keymappings.nix ];
}
