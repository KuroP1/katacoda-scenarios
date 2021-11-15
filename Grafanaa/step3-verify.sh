#!/bin/bash

docker exec -it mysql cat etc/my.cnf | grep -c "general_log = 1"

if [[ $? -eq 0 ]]
  then 
    echo "done"
  fi