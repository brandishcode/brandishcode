{
  lib,
  pname,
  mkShell,
  replaceVars,
  neovim,
  wrapNeovimUnstable,
  vimPlugins,
  ...
}:

let
  moduleName = lib.removeSuffix ".nvim" pname;
  pluginDeps = with vimPlugins; [ plenary.nvim ];
  neovimWrapped = wrapNeovimUnstable neovim {
    luaRcContent = builtins.readFile (replaceVars ./config.lua { inherit pname moduleName; });
    plugins = with vimPlugins; [
      lazy-nvim
    ] ++ pluginDeps;
  };

in
mkShell {
  packages = [
    neovimWrapped
  ];

  shellHook = '''';
}
