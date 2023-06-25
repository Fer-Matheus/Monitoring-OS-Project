#!/bin/bash
# coloca a saída dos logs do audit, que contém o nome da pasta a ser monitorada, no arquivo log.txt
cat /var/log/audit/audit.log | grep $1 >> utils/log.txt

# executa um script python que trata a string de log.txt para adquirir
# apenas o id do processo que fez a alteração na pasta.
pid=`python3 utils/getPid.py`

# pega o log temporário gerado pelo iwatch que contém a data e hora e mudança feita na pasta.
lines=`cat logs/temp`
# esvazia o arquivo para o próximo log
> logs/temp
# coloca o id do processo que fez a mudança e o log gerado pelo iwatch(${lines}) no arquivo 'nomeDaPasta'.txt
printf "pid: ${pid} \n${lines}\n" >> logs/$1.txt