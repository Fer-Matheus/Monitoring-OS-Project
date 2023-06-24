#!/bin/bash

rsync -ua --delete $1/ "$1/*" ~/workspace/backup 2>/dev/null