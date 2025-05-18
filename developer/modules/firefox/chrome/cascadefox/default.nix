{ config, stdenvNoCC, replaceVars }:

stdenvNoCC.mkDerivation rec {
  name = "firefox-cascadefox";
  src = builtins.fetchGit {
    url = "https://github.com/cascadefox/cascade";
    rev = "f8c6bb5a36f24aba61995204ff5497c865e78e50";
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

  appendToUserChrome = ''
    cat ${./userChrome.css} >> $out/cascadefox/chrome/userChrome.css
  '';

  installPhase = ''
    mkdir -p $out/cascadefox/chrome/includes
    cat $src/chrome/userChrome.css >> $out/cascadefox/chrome/userChrome.css
    cp -r $src/chrome/includes/* $out/cascadefox/chrome/includes/
    rm $out/cascadefox/chrome/includes/cascade-colours.css
    cp ${coloursConfig} $out/cascadefox/chrome/includes/cascade-colours.css
  '' + appendToUserChrome;
}
