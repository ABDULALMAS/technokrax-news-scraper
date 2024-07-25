#!/bin/bash

echo "command - npx tsc"
npx tsc

echo "command - aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 654654573394.dkr.ecr.us-west-2.amazonaws.com"
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 654654573394.dkr.ecr.us-west-2.amazonaws.com

echo "command - docker build --platform linux/amd64 --progress=plain -t technokrax-news-scraper ."
docker build --platform linux/amd64 --progress=plain -t technokrax-news-scraper .

echo "command - docker tag technokrax-news-scraper:latest 654654573394.dkr.ecr.us-west-2.amazonaws.com/technokrax-news-scraper:latest"
docker tag technokrax-news-scraper:latest 654654573394.dkr.ecr.us-west-2.amazonaws.com/technokrax-news-scraper:latest

echo "command - docker push 654654573394.dkr.ecr.us-west-2.amazonaws.com/technokrax-news-scraper:latest"
docker push 654654573394.dkr.ecr.us-west-2.amazonaws.com/technokrax-news-scraper:latest