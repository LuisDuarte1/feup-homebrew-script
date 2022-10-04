# FEUP BREW INSTALL SCRIPT

To run this script, after cloning do:

```
 chmod +x install.sh && chmod +x scripts/brew-install && ./install.sh
```

This script runs a install script that stores homebrew in /tmp
this is needed because the /home directory in feup computers are 
limited to 300MB ish because it's stored in a remote server.
This also circumvents the need for sudo to install stuff.

To better install stuff (without taking up much time, because Cellar in this case will always be different than the default location, and therefore, most packages install from source) we have a script called brew-install, that forces installing the bottle of the dependencies and then the final package.

Example:

```
brew-install rustup-init
```
