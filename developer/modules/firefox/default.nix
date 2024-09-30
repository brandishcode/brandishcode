{ pkgs, ... }:

{
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
              url = "https://github.com/brandishcode?tab=repositories";
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
                {
                  name = "nixvim";
                  url = "https://nix-community.github.io/nixvim";
                }
              ];
            }
            {
              name = "neovim";
              bookmarks = [
                {
                  name = "conform.nvim";
                  url = "https://github.com/stevearc/conform.nvim";
                }
                {
                  name = "nvim-lspconfig";
                  url = "https://github.com/neovim/nvim-lspconfig";
                }
                {
                  name = "mason-lspconfig.nvim";
                  url = "https://github.com/williamboman/mason-lspconfig.nvim";
                }
              ];
            }
            {
              name = "3D";
              bookmarks = [
                {
                  name = "Projection Matrix";
                  url = "http://www.songho.ca/opengl/gl_projectionmatrix.html";
                }
                {
                  name = "Learn OpenGL";
                  url = "https://learnopengl.com/";
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
          "browser.startup.homepage" = "https://github.com/brandishcode";
          "extensions.autoDisableScopes" = 0;
          "layout.css.prefers-color-scheme.content-override" =
            0; # force to dark mode
        };
      };
    };
  };
}
