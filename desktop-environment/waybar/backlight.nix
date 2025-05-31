{ config, lib }:

with config.theme.colors; {
  device = "intel_backlight";
  format = lib.concatStrings [
    ''<span size="large" color="${magenta}">{icon}</span>''
    "<span> {percent}%</span>"
  ];
  format-icons = [ "󰃞 " ];
}
