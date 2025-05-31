{ config, lib }:

with config.theme.colors;
let
  createFormat = x:
    lib.concatStrings [
      ''<span size="large" color="${green}">${x}</span>''
      "<span>{free}</span>"
    ];
  interval = 60;
in {
  home = {
    inherit interval;
    format = createFormat "󰋜 ";
    path = "/home";
  };
  development = {
    inherit interval;
    format = createFormat " ";
    path = "/development";
  };
  documents = {
    inherit interval;
    format = createFormat "󰈙 ";
    path = "/documents";
  };
  root = {
    inherit interval;
    format = createFormat " ";
  };
}
