{ pkgs, ... }:

{
  home.packages = with pkgs; [ brandishcode.default ];
}
