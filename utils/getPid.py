import os

file = open("utils/log.txt", "+r")
lines = file.read()
full = lines.split(" ")

pid=str

for value in full:
    if value.split("=")[0] == "pid":
        pid = value.split("=")[1]
print(pid)

file.close()
os.remove("utils/log.txt")
# pid=21963