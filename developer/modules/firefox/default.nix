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
        bookmarks = [{
          name = "toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "git";
              tags = [ "git" ];
              keyword = "git";
              url = "https://github.com/brandishcode";
            }
            {
              name = "nix";
              bookmarks = [
                {
                  name = "home-manager-options";
                  url =
                    "https://nix-community.github.io/home-manager/options.xhtml";
                }
                {
                  name = "nixos-package";
                  url = "https://search.nixos.org/packages";
                }
                {
                  name = "nixos-options";
                  url = "https://search.nixos.org/options?";
                }
              ];
            }
          ];
        }];
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tridactyl
          tokyo-night-v2
        ];
        settings = {
          "browser.startup.homepage" = "about:blank";
          "extensions.autoDisableScopes" = 0;
          "layout.css.prefers-color-scheme.content-override" =
            0; # force to dark mode
        };
      };
    };
  };
}
