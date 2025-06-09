{
  # Import all your configuration modules here
  imports = [
    ./options.nix
    ./keymappings.nix
    ./plugins
  ];

  viAlias = true;
  vimAlias = true;

  colorschemes.tokyonight = {
    enable = true;
    settings = {
      style = "night";
    };
  };
}
