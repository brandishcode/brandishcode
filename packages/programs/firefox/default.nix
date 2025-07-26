{
  pkgs,
  config,
  lib,
  ...
}:

let
  profile = {
    bookmarks = import ./bookmarks.nix;
    extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      tridactyl
    ];
    settings = import ./settings.nix;
    search = {
      default = "ddg";
      order = [
        "ddg"
        "google"
      ];
      force = true;
    };
  };
  firefoxChrome = pkgs.callPackage ./chrome/cascadefox { inherit config; };
  searchEngines = import ./search-engines.nix;
in
{
  home.packages = [ firefoxChrome ];
  home.file.".mozilla/firefox/default/chrome" = {
    source = "${firefoxChrome}/cascadefox/chrome";
    recursive = true;
  };
  home.file.".mozilla/firefox/youtube/chrome" = {
    source = "${firefoxChrome}/cascadefox/chrome";
    recursive = true;
  };
  home.file.".mozilla/firefox/netflix/chrome" = {
    source = "${firefoxChrome}/cascadefox/chrome";
    recursive = true;
  };
  programs.firefox = {
    enable = true;
    profiles = {
      default = lib.mkMerge [
        profile
        searchEngines
      ];
      # default = profile // {
      #   userChrome = builtins.readFile ./userChrome.css;
      #   userContent = builtins.readFile ./userContent.css;
      # };
      youtube = {
        id = 1;
        isDefault = false;
      }
      // profile;
      netflix = {
        id = 2;
        isDefault = false;
      }
      // profile;
    };
  };
}
