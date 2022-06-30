# FEUP BREW INSTALL SCRIPT

To run this script, after cloning do:

```
 chmod +x install.sh && ./instal.sh
```

This script runs a install script that stores homebrew in /tmp
this is needed because the /home directory in feup computers are 
limited to 300MB ish because it's stored in a remote server.
This also circumvents the need for sudo to install stuff.
