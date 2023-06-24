#!/bin/bash

printf "\n Digite o caminho do diretório que deseja monitor, ou apenas um nome para que seja criado o diretório:\n"
read dir

printf "Verificando todas as dependencias"
./config/installDependency

if test -e $dir; then 
    printf ""
else
    mkdir ${dir}
fi 

# touch iwatchConfig.xml
# echo "<config>" >>

clear

rsync -ua --delete ${dir}/ ${dir}/* /home/matheus/workspace/backup

# Ponto de configuração do iwatch
iwatch -r -c "rsync -uah --delete ${dir}/ ${dir}/* /home/matheus/workspace/backup" -e attrib,modify,create,delete,delete_self,move,moved_from,moved_to $dir >> logs/${dir}

ls -la $dir