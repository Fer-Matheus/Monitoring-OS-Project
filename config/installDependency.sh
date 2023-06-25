#!/bin/bash
# tenta executar o iwatch
iwatch &>/dev/null
# se houver erro (variável $? registra erros), instala o iwatch
if test $? -eq 127
then
    printf "Instalando Iwatch...\n"
    # chama a instalação do iwatch
    sudo apt install iwatch -y
fi
# análogo ao iwatch
rsync &>/dev/null

if test $? -eq 127
then
    printf "Instalando rsync...\n"
    sudo apt install rsync -y
fi
# análogo ao iwatch
audit &>/dev/null

if test $? -eq 127
then
    printf "Instalando audit...\n"
    sudo apt install auditd -y
fi