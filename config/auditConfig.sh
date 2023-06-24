#!/bin/bash

sudo auditctl -D -k $1

sudo auditctl -w /home/matheus/workspace/Monitoring-OS-Project/${1} -p aw -k $1

# clear

sudo auditctl restart