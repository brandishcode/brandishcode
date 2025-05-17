{ pkgs, config, ... }:

let
  profile = {
    bookmarks = import ./bookmarks.nix;
    extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      tridactyl
      tokyo-night-v2
    ];
    settings = import ./settings.nix;

  };
in {
  home.file = { } // (import ./external.nix {
    profile = "default";
    inherit pkgs;
    inherit config;
  }) // (import ./external.nix {
    profile = "youtube";
    inherit pkgs;
    inherit config;
  });
  programs.firefox = {
    enable = true;
    profiles = {
      default = profile;
      # default = profile // {
      #   userChrome = builtins.readFile ./userChrome.css;
      #   userContent = builtins.readFile ./userContent.css;
      # };
      youtube = {
        id = 1;
        isDefault = false;
      } // profile;
    };
  };
}
