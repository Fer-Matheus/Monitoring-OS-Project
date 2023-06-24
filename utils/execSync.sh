#!/bin/bash

rsync -ua --delete $1/ "$1/*" /home/matheus/workspace/backup 2>/dev/null