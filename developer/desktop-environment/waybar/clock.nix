{ lib, config }:

with config.theme.colors; {
  tokyo = {
    timezone = "Asia/Tokyo";
    format = lib.concatStrings [
      "{0:%H:%M}"
      ''
        <span size="small" rise="-1pt" color="${yellow}" weight="bold"> {0:%Z}</span>''
    ];
  };
  paris = {
    timezone = "Europe/Paris";
    format = lib.concatStrings [
      "{0:%H:%M}"
      ''
        <span size="small" rise="-1pt" color="${yellow}" weight="bold"> {0:%Z}</span>''
    ];
  };
  manila = {
    timezone = "Asia/Manila";
    format = lib.concatStrings [
      "{0:%H:%M}"
      ''
        <span size="small" rise="-1pt" color="${yellow}" weight="bold"> {0:%Z}</span>''
    ];
  };
}
