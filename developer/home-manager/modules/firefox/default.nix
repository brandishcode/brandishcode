{ pkgs, lib, ... }:

{
  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [ "tokyo-night-v2" ];
    };
  };
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tridactyl
          tokyo-night-v2
        ];
        settings = {
          "extensions.autoDisableScopes" = 0;
          "layout.css.prefers-color-scheme.content-override" =
            0; # force to dark mode
        };
      };
    };
  };
}
