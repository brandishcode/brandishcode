{ qtbase, qtsvg, qt5compat, wrapQtAppsHook, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "tokyo-night-sddm";
  version = "2.0";
  dontBuild = true;
  src = fetchFromGitHub {
    owner = "brandishcode";
    repo = "tokyo-night-sddm";
    rev = "44dcd06feb57d9390b0a4b8b9248f53d0eeb6aef";
    sha256 = "sha256-qY6HVBwoGbs8y4z1HTU8IbagU7BJ1yyjqn/Ginss8IE=";
  };

  buildInputs = [ qtbase ];
  nativeBuildInputs = [ wrapQtAppsHook ];
  propagatedUserEnvPkgs = [ qtsvg qt5compat ];

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/tokyo-night-sddm
  '';

}
