# Entering the development environment

```sh
nix develop
nvim #this automatically loads the plugin via lazy
```

## Reloading changes made to your lua plugin

```vimscript
:MyPluginCmd
```

# Setup

Once you have decided with the plugin name execute the following commands and re run `nix develop`.

```sh
sed -i 's/myplugin/newPluginName/' ./flake.nix
mv lua/myplugin lua/newPluginName
```
