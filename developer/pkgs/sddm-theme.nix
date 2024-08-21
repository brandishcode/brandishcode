{ qtbase, qtsvg, qtgraphicaleffects, qtquickcontrols2, wrapQtAppsHook
, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "tokyo-night-sddm";
  version = "1.0";
  dontBuild = true;
  src = fetchFromGitHub {
    owner = "brandishcode";
    repo = "tokyo-night-sddm";
    rev = "130d5cbf8712b5cd4e691ee966379b9f3d65ca5f";
    sha256 = "sha256-C59QyASd8QObcph0AbOqlB/GlH8v5KXTSlT5vr08V84=";
  };
  nativeBuildInputs = [ wrapQtAppsHook ];

  propagatedUserEnvPkgs = [ qtbase qtsvg qtgraphicaleffects qtquickcontrols2 ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/tokyo-night-sddm
  '';

}
