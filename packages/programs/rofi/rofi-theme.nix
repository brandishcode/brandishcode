{ stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation {
  pname = "rofi-theme-tokyo-night";
  version = "1.0";
  dontBuild = true;
  src = fetchFromGitHub {
    owner = "brandishcode";
    repo = "Tokyonight-rofi-theme";
    rev = "27bbe6b2c05ffb19348052d02fc60936fb8d95d3";
    sha256 = "sha256-RGgcIZ2JNUbPzPp6CdyyWVdTMAKDfAnsbbe/fpvDwps=";
  };

  installPhase = ''
    mkdir -p $out/share/rofi/themes
    cp -aR $src $out/share/rofi/themes/tokyo-night
  '';
}
