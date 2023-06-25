import os
# le o arquivo que contém o log do audit
file = open("utils/log.txt", "+r")
lines = file.read()
# divide o arquivo pelos espaços em branco e coloca o array retornado em 'full'
full = lines.split(" ")

# incializa a variavel pid
pid=str

# itera sobre os elementos de full
for value in full:
    # divide os elementos de full pelo "=" (os elementos de full são do tipo:
    # kay=value) e verifica se é uma key de 'pid'
    if value.split("=")[0] == "pid":
        # caso positivo, coloca o 'value' na variável pid
        pid = value.split("=")[1]
# retorna o pid
print(pid)
# fecha o arquivo
file.close()
#apaga o arquivo utilitário temporário.
os.remove("utils/log.txt")