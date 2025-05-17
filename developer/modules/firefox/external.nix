{ pkgs, config, profile }:

{
  ".mozilla/firefox/${profile}/chrome" = {
    source = "${
        pkgs.fetchFromGitHub {
          url = "https://github.com/cascadefox/cascade";
          owner = "cascadefox";
          repo = "cascade";
          rev = "f8c6bb5a36f24aba61995204ff5497c865e78e50";
          hash = "sha256-aylkbsKLuCJqao8oeEZvSMaZUvjIxhlT/kGJ1DDsEt0=";
        }
      }/chrome";
    recursive = true;
  };
  # ".mozilla/firefox/${profile}/chrome/includes/cascade-colours.css" = {
  #   source = with config.theme.colors;
  #     pkgs.replaceVars ./customization/cascade-config.css {
  #       inherit foreground;
  #       inherit background;
  #       inherit black;
  #       inherit red;
  #       inherit green;
  #       inherit yellow;
  #       inherit blue;
  #       inherit magenta;
  #       inherit cyan;
  #       inherit white;
  #     };
  #   force = true;
  # };
  # ".mozilla/firefox/${profile}/chrome/userChrome.css".source = ./userChrome.css;
  # ".mozilla/firefox/${profile}/chrome/userContent.css".source =
  #   ./userContent.css;
}
