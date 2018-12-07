#!/bin/bash

# command
# ./toolchain.sh [configuration file] [ontologie naam] [template filenaam]
# ./toolchain.sh thema.config gebouw-voc.j2 gebouw-voc-0.0.1

# first we generate the JSON LD output
docker run -v $(pwd):/data -w /data eap2rdf jsonld --config $1 --name $2

# then we generate the HTML with the specification generator docker
docker run -v $(pwd):/data spec-gen node cls.js /data/$2.jsonld $3 /data/$2.html
