#!/bin/sh

now=$(date +"%D - %T")
echo "Incrementally crawl at: $now"

echo "===test==="
echo "CONFIG=$(cat $1/algolia_configs/zh-tidb-v6.0.json | jq -r tostring)" 

# crawl zh tidb
docker run --rm --env-file="$1/.env" -e "CONFIG=$(cat $1/algolia_configs/zh-tidb-v6.0.json | jq -r tostring)" -e  "ISINCREMENTAL=True" -v $1/algolia_configs:/data $DOCKER_REGISTRY/algolia-docsearch-scraper-incremental:v0.2
