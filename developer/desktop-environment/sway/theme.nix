{ config }:

with config.theme.colors; {
  focused = {
    border = blue;
    background = brightblack;
    text = brightwhite;
    indicator = cyan;
    childBorder = blue;
  };
  focusedInactive = {
    border = blue;
    background = brightblack;
    text = brightwhite;
    indicator = cyan;
    childBorder = blue;
  };
  unfocused = {
    border = brightblack;
    background = black;
    text = white;
    indicator = cyan;
    childBorder = brightblack;
  };
  urgent = {
    border = yellow;
    background = yellow;
    text = black;
    indicator = cyan;
    childBorder = yellow;
  };
}
