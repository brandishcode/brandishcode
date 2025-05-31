{ lib, myLib }:

{
  workspaceType = lib.mkOptionType {
    name = "workspace";
    description = ''
      Workspace definitions.

      label - label of the workspace
      output - the monitor output where this workspace belong
      shortcut - 0-9 integer value for shortcut (by default it is Super+<shortcut>)
      apps - list of applications that open in this workspace by default
    '';
    check = x:
      lib.hasAttr "label" x && lib.isString x.label && lib.hasAttr "output" x
      && lib.isString x.output && lib.hasAttr "shortcut" x
      && lib.isInt x.shortcut && x.shortcut >= 0 && x.shortcut <= 9
      && lib.hasAttr "apps" x && myLib.isListOf lib.types.package x.apps;
  };
}
