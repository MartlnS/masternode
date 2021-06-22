#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/primestoned.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='Primestonecoin/PrimeStone'
# Display Name.
DAEMON_NAME='PrimeStone Core'
# Coin Ticker.
TICKER='PSC'
# Binary base name.
BIN_BASE='primestone'
# Directory.
DIRECTORY='.primestone'
# Conf File.
CONF='primestone.conf'
# Port.
DEFAULT_PORT=19941
# Explorer URL
EXPLORER_URL=http://primestone-explorer.com/
# Amount of Collateral needed.
COLLATERAL=1000
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=3

# Tip Address
TIPS='Xj8CcwnY5f4RWsjiZefHRAhpcZJ5cDpY5v'
# Dropbox Addnodes
DROPBOX_ADDNODES=''
# If set to 1 then use addnodes from dropbox.
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP=''
# If set to 1 then use bootstrap from dropbox.
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS=''

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "PRIMESTONE"
 ____       _                ____  _                      ____
|  _ \ _ __(_)_ __ ___   ___/ ___|| |_ ___  _ __   ___   / ___|___  _ __ ___
| |_) | '__| | '_ ` _ \ / _ \___ \| __/ _ \| '_ \ / _ \ | |   / _ \| '__/ _ \
|  __/| |  | | | | | | |  __/___) | || (_) | | | |  __/ | |__| (_) | | |  __/
|_|   |_|  |_|_| |_| |_|\___|____/ \__\___/|_| |_|\___|  \____\___/|_|  \___|

PRIMESTONE
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=$(( COUNTER + 1 ))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null
