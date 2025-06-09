{ flake-utils, nixvim, ... }:

flake-utils.lib.eachDefaultSystemPassThrough (system: {
  overlays.default = import ./. { inherit nixvim; };
})
