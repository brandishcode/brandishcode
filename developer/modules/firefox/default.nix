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
  cascadefox = pkgs.callPackage ./chrome/cascadefox { inherit config; };
in {
  home.packages = [ cascadefox ];
  home.file.".mozilla/firefox/default/chrome" = {
    source = "${cascadefox}/chrome";
    recursive = true;
  };
  home.file.".mozilla/firefox/youtube/chrome" = {
    source = "${cascadefox}/chrome";
    recursive = true;
  };
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
