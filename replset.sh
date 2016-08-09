#!/bin/bash

mongo $MONGO_MASTER:27017/admin --eval "rs.initiate({\"_id\": \"$MONGO_REPLSET_NAME\", \"members\": [{\"_id\": 0, \"host\": \"$MONGO_MASTER:27017\"}]});"

hosts=$(echo $MONGO_SECONDARY | tr "," "\n")

for hst in $hosts
do
  mongo $MONGO_MASTER:27017/admin --eval "rs.add(\"$hst:27017\")";
done
