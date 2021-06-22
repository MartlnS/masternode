#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/blastxd.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='BlastX-Core/BlastX'
# Display Name.
DAEMON_NAME='Blastx Core'
# Coin Ticker.
TICKER='BLAS'
# Binary base name.
BIN_BASE='blastx'
# Directory.
DIRECTORY='.blastxcore'
# Conf File.
CONF='blastx.conf'
# Port.
DEFAULT_PORT=30009
# Explorer URL.
EXPLORER_URL='https://explorer.blastexchange.com/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=10000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1


# Tip Address.
TIPS='BAggyk6eGov43NAAhqga4W2x3rEpUpHtoL'
# Dropbox Addnodes.
DROPBOX_ADDNODES='djazn7lldgukrb6'
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='jo67613xcu9iw8w'
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='zf5mzj695aujwbu'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "BLASTX"
 ____  _           _           ____               
| __ )| | __ _ ___| |___  __  / ___|___  _ __ ___ 
|  _ \| |/ _` / __| __\ \/ / | |   / _ \| '__/ _ \
| |_) | | (_| \__ \ |_ >  <  | |__| (_) | | |  __/
|____/|_|\__,_|___/\__/_/\_\  \____\___/|_|  \___|

BLASTX
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

