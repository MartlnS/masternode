#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/solarisd.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='Solaris-Project/Solaris'
# Display Name.
DAEMON_NAME='Solaris Core'
# Coin Ticker.
TICKER='XLR'
# Binary base name.
BIN_BASE='solaris'
# Directory.
DIRECTORY='.solaris'
# Conf File.
CONF='solaris.conf'
# Port.
DEFAULT_PORT=60020
# Explorer URL.
EXPLORER_URL='https://solaris.blockexplorer.pro/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=1000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Multiple on single IP.
MULTI_IP_MODE=1
SLOW_DAEMON_START=1


# Tip Address.
TIPS='SfrGDKcKbx4bkehKHjyxmaTbkacUuogb4t'
# Dropbox Addnodes.
DROPBOX_ADDNODES='djvy3h22jvnqyt4'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='37zpcv88qnd5hl7'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='1w87o7ta1ia0ix9'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "SOLARIS"
 ____        _            _        ____
/ ___|  ___ | | __ _ _ __(_)___   / ___|___  _ __ ___
\___ \ / _ \| |/ _` | '__| / __| | |   / _ \| '__/ _ \
 ___) | (_) | | (_| | |  | \__ \ | |__| (_) | | |  __/
|____/ \___/|_|\__,_|_|  |_|___/  \____\___/|_|  \___|

SOLARIS
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

