{ config }:

with config.theme.colors;
let
  background = config.theme.colors.background + "00";
  urgentBackground = red + "CC";
  border = background;
  indicator = background;
  childBorder = background;
in
{
  focused = {
    inherit border;
    inherit background;
    text = magenta;
    inherit indicator;
    inherit childBorder;
  };
  focusedInactive = {
    inherit border;
    inherit background;
    text = cyan;
    inherit indicator;
    inherit childBorder;
  };
  unfocused = {
    inherit border;
    inherit background;
    text = green;
    inherit indicator;
    inherit childBorder;
  };
  urgent = {
    inherit border;
    background = urgentBackground;
    text = foreground;
    inherit indicator;
    inherit childBorder;
  };
}
