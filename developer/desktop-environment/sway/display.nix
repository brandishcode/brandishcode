{ config, ... }:

{
  config = {
    wayland.windowManager.sway = {
      config = let helpers = import ./helpers;
      in { output = helpers.convertToSwayOutput config.monitor; };
    };
  };
}
