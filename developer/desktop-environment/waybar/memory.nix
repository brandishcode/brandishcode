{ config, lib }:

with config.theme.colors; {
  default = {
    interval = 60;
    format = lib.concatStrings [
      ''<span size="large" color="${red}"> </span>''
      ''<span size="small" rise="1pt" style="oblique"> {avail:0.1f}G</span>''
      ''<span color="${red}" weight="bold"> {used:0.1f}G</span>''
      ''<span size="small" rise="-1pt" style="oblique"> {total:0.1f}G</span>''
    ];
  };
}
