#!/bin/bash

iwatch &>/dev/null

if test $? -eq 127
then
    printf "Instalando Iwatch...\n"
    sudo apt install iwatch -y
    sleep(2)
fi

rsync &>/dev/null

if test $? -eq 127
then
    printf "Instalando rsync...\n"
    sudo apt install rsync -y
    sleep(2)
fi

audit &>/dev/null

if test $? -eq 127
then
    printf "Instalando audit...\n"
    sudo apt install auditd -y
    sleep(2)
fi