# Entering the development environment
```sh
nix develop
nvim 
```
## Testing the flake

```vimscript
:MyPluginCmd
# should print the following
MyPluginCmd works
```
# Renaming the plugin
For your new plugin you have to rename the folder in `lua/myplugin` to `lua/<your-plugin-name>`

```sh
sed -i 's/myplugin/your-plugin-name/' ./flake.nix
```
