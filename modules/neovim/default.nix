{ ... }:

{
  imports = [ ./options.nix ./keymappings.nix ./plugins ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };
}
