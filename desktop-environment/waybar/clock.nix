{ lib, config }:

with config.theme.colors;
{
  tooltip-format = "{tz_list}";
  timezones = [
    "Asia/Tokyo"
    "Etc/UTC"
    "America/New_York"
    "Europe/Paris"
    "Asia/Manila"
  ];
  format = lib.concatStrings [
    ''<span weight="bold"> {0:%H:%M}</span>''
    ''<span size="small" rise="-1pt" color="${green}" weight="bold"> {0:%Z}</span>''
  ];
}
