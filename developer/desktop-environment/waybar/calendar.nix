{ lib, config }:

with config.theme.colors; {
  default = {
    format = lib.concatStrings [
      ''<span size="large" color="${blue}" weight="bold"> </span>''
      "{0:%Y/%m/%d}"
    ];
  };
}
