#!/bin/bash
# deleta a key, se ela já existir
sudo auditctl -D -k $1
# cria uma nova key, passando a pasta a ser auditada(-w) e o que será auditado (-p) 
# aw(recursivo, escrita, leitura, deleção, alteração) e a chave(-k) $1 
sudo auditctl -w ~/workspace/Monitoring-OS-Project/${1} -p aw -k $1
# limpa o terminal
clear
# recarrega o audit para que as novas regras e nova chave adicionada entrem em vigor
sudo auditctl restart