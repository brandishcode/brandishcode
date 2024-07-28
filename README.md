# Home Configuration for brandishcode
##### Work in progress
###### this is managed by nix flakes, home-manager, and nixvim


## GUI setup
This is an installation on a non-NixOS system. Inorder for `sway` to work, you have to have it installed with your own distro's package manager.
For more on how to install `sway` see this good documentation on [Arch Wiki](https://wiki.archlinux.org/title/Sway).

## Git setup
Create a copy of the Git variables.

```bash
cp ./git/variables.example.nix ./git/variables.nix
```

Set the `userName` and `userEmail`.
