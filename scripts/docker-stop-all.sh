#!/bin/bash

docker update --restart=no $(docker ps -q) && docker stop $(docker ps -q)
