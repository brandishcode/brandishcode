{
  force = true;
  settings = [{
    name = "toolbar";
    toolbar = true;
    bookmarks = [
      {
        name = "ricing";
        bookmarks = [{
          name = "waybar wiki";
          url = "https://github.com/Alexays/Waybar/wiki";
        }];
      }
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
            url = "https://nix-community.github.io/home-manager/options.xhtml";
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
          {
            name = "Grid";
            url =
              "https://asliceofrendering.com/scene%20helper/2020/01/05/InfiniteGrid/";
          }
        ];
      }
    ];
  }];
}

