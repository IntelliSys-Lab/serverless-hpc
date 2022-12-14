#!/usr/bin/env bash

DOCKER_USERNAME=adhinneupane

cd ../dynamic-html

# docker build -t python3action:web-application-rendering .

# docker tag python3action:web-application-rendering $DOCKER_USERNAME/python3action:web-application-rendering

# docker push $DOCKER_USERNAME/python3action:web-application-rendering

# wsk action delete web-app-wsk

wsk action create web-app-wsk --docker $DOCKER_USERNAME/python3action:web-application-rendering action.py  

wsk action invoke web-app-wsk --result | tee /Users/admin/project-defense/serverless-hpc/web-app/static/response.html

cd /Users/admin/project-defense/serverless-hpc/web-app/static/

cat response.html| jq '.numpy' > response2.html


