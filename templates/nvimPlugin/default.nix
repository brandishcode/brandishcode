{
  lib,
  pname,
  mkShell,
  replaceVars,
  neovim,
  ...
}:

let
  moduleName = lib.removeSuffix ".nvim" pname;
  neovimWrapped = neovim.extend {
    extraConfigLuaPost = builtins.readFile (replaceVars ./config.lua { inherit moduleName; });
  };
in
mkShell {
  packages = [
    neovimWrapped
  ];

  inputsFrom = [ ];

  shellHook = '''';
}
