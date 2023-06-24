#!/bin/bash

printf "\n Digite o caminho do diretório que deseja monitor, ou apenas um nome para que seja criado o diretório:\n"
read dir

printf "Verificando todas as dependencias"
./config/installDependency.sh

if test -e $dir; then 
    printf ""
else
    mkdir ${dir}
fi 

clear

./config/auditConfig.sh $dir
./utils/execSync.sh $dir

# Ponto de configuração do iwatch
iwatch -r -c "./utils/execSync.sh ${dir} | (echo -n;sleep 5;./utils/createLog.sh ${dir})" -e attrib,modify,create,delete,delete_self,move,moved_from,moved_to $dir >> logs/temp 
