{ lib, config }:

with config.theme.colors;
let
  createFormat =
    x:
    lib.concatStrings [
      ''<span size="large" color="${green}">${x} </span>''
      "{ifname}"
    ];
in
{
  default = {
    format-wifi = createFormat "󰖩 ";
    format-ethernet = createFormat "󰈀 ";
    tooltip-format-ethernet = lib.concatStrings [ "{ipaddr}" ];
  };
}
