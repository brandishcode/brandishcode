{ lib, config }:

with config.theme.colors; {
  default = {
    tooltip-format = "<tt><small>{calendar}</small></tt>";
    format = lib.concatStrings [
      ''<span size="large" color="${green}" weight="bold"> </span>''
      "<span> {0:%Y/%m/%d}</span>"
    ];
    calendar = {
      mode = "year";
      "mode-mon-col" = 3;
      "weeks-pos" = "right";
      "on-scroll" = 1;
      format = {
        months = ''<span color="${white}"><b>{}</b></span>'';
        days = ''<span color="${white}"><b>{}</b></span>'';
        weeks = ''<span color="${green}"><b>W{}</b></span>'';
        weekdays = ''<span color="${yellow}"><b>{}</b></span>'';
        today = ''<span color="${red}"><b><u>{}</u></b></span>'';
      };
    };
  };
}
