{ myLib, lib }:

(import ./monitor-types.nix { inherit lib; })
// (import ./theme-types.nix { inherit lib; })
// (import ./display-manager-types.nix { inherit lib myLib; })
// (import ./workspace-types.nix { inherit lib myLib; })
// (import ./user-types.nix { inherit lib; })
