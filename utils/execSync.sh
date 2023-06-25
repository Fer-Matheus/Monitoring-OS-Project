#!/bin/bash
# executa uma sincronização inicial, onde copia o conteudo do diretório "$1" para a pasta backup,
# não exibindo nenhuma saída, a fim de tornar o script mais legível.
rsync -ua --delete $1/ "$1/*" ~/workspace/backup 2>/dev/null