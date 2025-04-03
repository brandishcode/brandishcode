{ lib }:

{
  workspaceType = lib.mkOptionType {
    name = "workspace";
    description = ''
      Workspace definitions.

      label - label of the workspace
      output - the monitor output where this workspace belong
    '';
    check = x:
      lib.hasAttr "label" x && lib.isString x.label && lib.hasAttr "output" x
      && lib.isString x.output;
  };
}
