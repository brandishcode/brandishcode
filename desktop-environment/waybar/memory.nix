{ config, lib }:

with config.theme.colors;
{
  default = {
    interval = 60;
    tooltip-format = "{used:0.1f} used out of {total:0.1f} ({percentage}%)";
    format = lib.concatStrings [
      ''<span size="large" color="${green}"> </span>''
      "<span> {used:0.1f}G</span>"
    ];
  };
}
