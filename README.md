```
      _       _         NewDawn0's macOS system config
   __| | ___ | |_ ___   https://github.com/NewDawn0/.dots
  / _` |/ _ \| __/ __|  ---------------------------------
 | (_| | (_) | |_\__ \  Author: NewDawn0
(_)__,_|\___/ \__|___/  License: MIT
```

My macOS Configurations using [nix-darwin](https://github.com/LnL7/nix-darwin)

## Installation

<details><summary><b>1. Install prerequisites (Nix, Nix-darwin, Home-Manmager)</b></summary>

1. Install Nix for macOS

```bash
sh <(curl -L https://nixos.org/nix/install)
```

Don't forget to run `nix-shell -p nix-info` in a new shell after installing Nix
If some paths could not be linked due to an invalid ca-certificate try

```bash
# From `https://github.com/NixOS/nix/issues/2899`
sudo launchctl setenv NIX_SSL_CERT_FILE $NIX_SSL_CERT_FILE
sudo launchctl kickstart -k system/org.nixos.nix-daemon
```

2. Install nix-darwin

```bash
cd /tmp
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```

3. Install Home-Manmager as a nix-darwin module

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

</details>
<b>2. Install my config</b>

```bash
cd ~/.config
git clone https://github.com/NewDawn0/.dots ./darwin
make
```
