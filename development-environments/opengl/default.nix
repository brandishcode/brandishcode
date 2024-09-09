{ editor, makeWrapper, llvmPackages, pkg-config, cmake, spdlog, glfw-wayland
, libGLU, ... }:

let vendorLibraries = [ spdlog ];
in llvmPackages.stdenv.mkDerivation rec {

  pname = "";
  version = "";

  src = ./.;

  # Dependencies that should exist in the runtime environment
  buildInputs = [ glfw-wayland libGLU ] ++ vendorLibraries;
  # Dependencies that should only exist in the build environment
  nativeBuildInputs = [ makeWrapper pkg-config cmake ] ++ [ editor ];

  buildPhase = ''
    cmake ../
    cmake --build .
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ${pname} $out/bin
  '';

  shellHook = ''
    echo "Development Shell Started"
    runPhase configurePhase
    cd ../
    vim
  '';
}
