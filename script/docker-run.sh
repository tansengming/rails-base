#! /bin/bash

docker build -t rails-base .
docker run -p 3000:3000 -itP rails-base