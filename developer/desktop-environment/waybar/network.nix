{ lib, config }:

with config.theme.colors; {
  default = {
    format-ethernet = lib.concatStrings [
      ''<span size="large" color="${green}">󰈀 </span>''
      "{ifname}"
    ];
    tooltip-format-ethernet = lib.concatStrings [ "{ipaddr}" ];
  };
}
