#!/bin/bash

docker ps | grep -c "grafana"

if [[ $? -eq 0 ]]
  then 
    echo "done"
  fi