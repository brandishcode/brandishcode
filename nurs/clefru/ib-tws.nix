{ pkgs, clefru-nur, system, ... }:

let
  ib-tws = pkgs.symlinkJoin {
    name = "ib-tws";
    paths = [ clefru-nur.packages.${system}.ib-tws ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/ib-tws --set _JAVA_AWT_WM_NONREPARENTING 1
    '';
  };
in { home.packages = [ ib-tws ]; }
