{ pkgs, ... }:

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
  programs.firefox = {
    enable = true;
    profiles = {
      default = profile;
      youtube = {
        id = 1;
        isDefault = false;
      } // profile;
    };
  };
}
