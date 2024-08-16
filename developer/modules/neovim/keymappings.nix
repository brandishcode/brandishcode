{ config, lib, ... }:

{
  programs.nixvim = {

    globals = { mapleader = " "; };

    keymaps = let
      normal = lib.mapAttrsToList (key: action: {
        mode = "n";
        inherit action key;
      }) {
        "<Space>" = "<NOP>";
        "o" = "o<Esc>";
        "O" = "O<Esc>";
        "<leader>w" = ":Explore<CR>";
      };
      insert =

        lib.mapAttrsToList (key: action: {
          mode = "i";
          inherit action key;
        }) { "jj" = "<Esc>"; };
      helpers = config.lib.nixvim;
    in helpers.keymaps.mkKeymaps { options.silent = true; } (normal ++ insert);
  };
}
