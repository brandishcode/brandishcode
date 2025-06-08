{
  lib,
  pname,
  mkShell,
  replaceVars,
  lua,
  spring-boot-cli,
  neovim,
  wrapNeovimUnstable,
  vimPlugins,
  ...
}:

let
  luaWithPackages = lua.withPackages (packages: with packages; [ ]);
  moduleName = lib.removeSuffix ".nvim" pname;
  neovimWrapped = wrapNeovimUnstable neovim {
    luaRcContent = builtins.readFile (replaceVars ./config.lua { inherit pname moduleName; });
    plugins = with vimPlugins; [
      lazy-nvim
    ];
  };

in
mkShell {
  packages = [
    luaWithPackages
    spring-boot-cli
    neovimWrapped
  ];

  shellHook = '''';
}
