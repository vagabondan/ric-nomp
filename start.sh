docker run --rm -it \
    --name nomp \
    -v $(pwd)/config:/opt/config \
    --network=garlicoin-test \
    --entrypoint=/bin/bash \
    -p 80:80 \
    -p 3333:3333 \
    nomp
