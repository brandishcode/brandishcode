{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = { nixd.enable = true; };
      };
    };
  };

  imports = [ ./docker.nix ./markdown.nix ./lua.nix ./cpp.nix ./python.nix ];
}
