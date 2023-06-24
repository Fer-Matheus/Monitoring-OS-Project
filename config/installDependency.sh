#!/bin/bash

iwatch &>/dev/null

if test $? -eq 127
then
    printf "Instalando Iwatch...\n"
    sudo apt install iwatch -y
fi

rsync &>/dev/null

if test $? -eq 127
then
    sudo apt install rsync -y
fi
