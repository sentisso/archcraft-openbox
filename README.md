# archcraft-openbox

### custom scripts:

`apply-config.sh` - A script that can build the whole openbox package, install it via pacman and "apply it", which results in applying the changes made here
- because the pacman installation only copies the config files into `/etc/skel/.config` (see `_configdir` in `PKGBUILD`)...
    - ...we gotta copy them into the ours `~/.config` folder _(which can of course overwrite some of the stuff located there, which is kinda what we want)_
- although the PKGBUILD could be probably modified to copy the config files to the `~/.config` right away, _idk_
- I also set the default shell in the xfce4 terminal to **fish** in this script, remove those lines if you just don't want to do that...
- usage: `./apply-config.sh`
