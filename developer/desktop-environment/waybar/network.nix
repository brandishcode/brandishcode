{ lib, config }:

with config.theme.colors; {
  default = {
    format-ethernet = lib.concatStrings [
      ''<span size="large" color="${red}">󰈀 </span>''
      "{ifname}"
    ];
    tooltip-format-ethernet = lib.concatStrings [ "{ipaddr}" ];
  };
}
