#!/bin/bash

docker network ls | grep -c "wordpress-network"

if [[ $? -eq 0 ]]
  then 
    docker ps | grep -c "mysql"

    if [[ $? -eq 0 ]]
    then 
        docker ps | grep -c "wordpress"

        if [[ $? -eq 0 ]]
        then 
            echo "done"
        fi
    fi
  fi
