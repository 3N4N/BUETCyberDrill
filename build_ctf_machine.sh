#!/bin/env bash

USRBINDIR="$HOME/.local/bin"
USRMANDIR="$HOME/.local/share/man/man1"

mkdir -p "$USRBINDIR" "$USRMANDIR"


apt_pkgs="python3 python3-pip steghide valgrind build-essential netcat-traditional nmap dirb wabt hashcat upx-ucl"
sudo apt install -y $apt_pkgs

pip_pkgs="stegoveritas flask-unsign decompyle3"
pip3 install --user --upgrade $pip_pkgs


# if ! hash upx 2>/dev/null ; then
#     UPXVER="3.96-amd64_linux"
#     UPXLINK="https://github.com/upx/upx/releases/download/v3.96/upx-$UPXVER.tar.xz"
#     wget -O upx-$UPXVER.tar.xz "$UPXLINK"
#     tar xvJf upx-$UPXVER.tar.xz
#     cp upx-$UPXVER/upx "$USRBINDIR"
#     cp upx-$UPXVER/upx.1 "$USRMANDIR"
# fi


if ! grep -qEi 'source.*gef' $HOME/.gdbinit ; then
    mkdir -p $HOME/.config/gdb/modules
    wget -O $HOME/.config/gdb/modules/gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
    echo "source $HOME/.config/gdb/modules/gef.py" >> $HOME/.gdbinit
fi


if ! hash extract 2>/dev/null ; then
    wget -O $HOME/.local/bin/extract https://raw.githubusercontent.com/3N4N/dotFiles/master/bin/extract
    chmod +x $HOME/.local/bin/extract
fi
