#!/bin/bash
# Recebe um caminho para a pasta a ser monitorada
printf "\n Digite o caminho do diretório que deseja monitor, ou apenas um nome para que seja criado o diretório:\n"
read dir

# verifica se o usuário possui todas as dependencias para o script
printf "Verificando todas as dependencias"
./config/installDependency.sh

# verifica se existe o diretório, caso contrário, cria o diretório

if test -e $dir; then 
    printf ""
else
    mkdir ${dir}
fi 

clear
#chama o arquivo de configuração do audit, passando o diretório dado como argumento
./config/auditConfig.sh $dir
#chama uma sincronização incial da pasta, copiando o que já havia antes nela
./utils/execSync.sh $dir

# Inicia o iwatch, -r para recursivamente monitorado(pasta e subpastas), executa o comando passado após '-c',
# chama o script auxiliar create log e dá 5 segundos de intervalo para não haver sobrescrita entre os logs,
# configura os eventos a serem monitorados, que estão após o '-e', passa o diretório '$dir' a ser monitorado como argumento e,
# coloca a saída do iwatch no arquivo auxiliar de log (em logs/temp)
iwatch -r -c "./utils/execSync.sh ${dir} | (echo -n;sleep 5;./utils/createLog.sh ${dir})" -e attrib,modify,create,delete,delete_self,move,moved_from,moved_to $dir >> logs/temp 
