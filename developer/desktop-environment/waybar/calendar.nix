{ lib, config }:

with config.theme.colors; {
  default = {
    format = lib.concatStrings [
      ''<span size="large" color="${yellow}" weight="bold"> </span>''
      ''<span style="oblique"> {0:%Y/%m/%d}</span>''
      ''<span weight="bold"> {0:%H:%M}</span>''
      ''
        <span size="small" rise="-1pt" color="${yellow}" weight="bold"> {0:%Z}</span>''
    ];
  };
}
