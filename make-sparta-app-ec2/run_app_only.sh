#!/bin/bash

cd /home/ubuntu/tech601-sparta-app/app

npm install

pm2 start app.js --name app
