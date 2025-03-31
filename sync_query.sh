#!/bin/bash
set -x

curl -H 'Content-Type: application/json' \
      -d '{ "subjects": [ "080f5a3d475f7c6f47bd5f78355038a9fff0cfe1bff2fcfff0c98c844c494c59" ] }' \
      -X POST \
      http://localhost:18080/metadata/sync > metadata_sync.json
 

 