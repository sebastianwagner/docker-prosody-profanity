

# config created with
`mkdir etc
docker run -it --tmpfs=/var/run/prosody:uid=100,suid,mode=5744 --rm --name=prosody sebastianwagner/prosody-alpine:latest sh \
 && docker cp prosody:/etc/prosody/ ./etc/`

# build with
`docker build \
 --force-rm \
 --tag=sebastianwagner/prosody-alpine:latest \
 .`


# run with
`docker run \
 --read-only \
 -it \
 --tmpfs=/var/run/prosody:uid=100,suid,mode=5744 \
 --rm -v `pwd`/etc/prosody:/etc/prosody:ro \
 --name=prosody \
 --publish=5222:5222 \
 --publish=5269:5269 \
 sebastianwagner/prosody-alpine:latest`
