#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/phonecoind.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='phonecoin-PHON/PhoneCoinCore'
# Display Name.
DAEMON_NAME='PhoneCoin Core'
# Coin Ticker.
TICKER='PHON'
# Binary base name.
BIN_BASE='phonecoin'
# Directory.
DIRECTORY='.phonecoin'
# Conf File.
CONF='phonecoin.conf'
# Port.
DEFAULT_PORT=12222
# Explorer URL.
EXPLORER_URL='http://chain.phonecoin.space/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL='60000
70000
80000'
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1


# Tip Address.
TIPS='pJMwqGRjpU2uNAdRT6tWoULX3kWc4dsGB9'
# Dropbox Addnodes.
DROPBOX_ADDNODES='q7n74rf6uxnjdyg'
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='qd4oyf55yf9514a'
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='7fnxbuw5smbumrm'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "PHONECOIN"
 ____  _                       ____      _          ____               
|  _ \| |__   ___  _ __   ___ / ___|___ (_)_ __    / ___|___  _ __ ___ 
| |_) | '_ \ / _ \| '_ \ / _ \ |   / _ \| | '_ \  | |   / _ \| '__/ _ \
|  __/| | | | (_) | | | |  __/ |__| (_) | | | | | | |__| (_) | | |  __/
|_|   |_| |_|\___/|_| |_|\___|\____\___/|_|_| |_|  \____\___/|_|  \___|

PHONECOIN
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
  wget -4qo- gist.githubusercontent.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=1
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

