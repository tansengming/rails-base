#! /bin/bash

docker build -t demo .
docker run -p 3000:3000 -itP demo