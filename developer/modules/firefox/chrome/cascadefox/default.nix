{ config, stdenvNoCC, fetchFromGitHub, replaceVars }:

stdenvNoCC.mkDerivation rec {
  name = "firefox-cascadefox";
  src = fetchFromGitHub {
    url = "https://github.com/cascadefox/cascade";
    owner = "cascadefox";
    repo = "cascade";
    rev = "f8c6bb5a36f24aba61995204ff5497c865e78e50";
    hash = "sha256-aylkbsKLuCJqao8oeEZvSMaZUvjIxhlT/kGJ1DDsEt0=";
  };

  coloursConfig = with config.theme.colors;
    replaceVars ./cascade-colours.css {
      inherit foreground;
      inherit background;
      inherit black;
      inherit red;
      inherit green;
      inherit yellow;
      inherit blue;
      inherit magenta;
      inherit cyan;
      inherit white;
    };

  # unpackPhase = ''
  #   cp ${coloursConfig} $src/chrome/example.css
  # '';

  installPhase = ''
    mkdir -p $out/chrome/includes
    cp -r $src/chrome/userChrome.css $out/chrome/
    cp -r $src/chrome/includes/cascade-config.css \
    $src/chrome/includes/cascade-config-mouse.css  \
    $src/chrome/includes/cascade-floating-panel.css \
    $src/chrome/includes/cascade-layout.css \
    $src/chrome/includes/cascade-nav-bar.css \
    $src/chrome/includes/cascade-responsive.css \
    $src/chrome/includes/cascade-responsive-windows-fix.css \
    $src/chrome/includes/cascade-tabs.css \
    $out/chrome/includes/
    cp ${coloursConfig} $out/chrome/includes/cascade-colours.css
  '';
}
