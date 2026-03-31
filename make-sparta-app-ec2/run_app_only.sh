#!/bin/bash
# set DB connection (USE NEW DB PRIVATE IP)
export DB_HOST=mongodb://${aws_instance.db_instance.private_ip}:27017/posts


cd /home/ubuntu/tech601-sparta-app/app

npm install

pm2 start app.js --name app
