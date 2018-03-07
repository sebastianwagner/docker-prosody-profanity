

# config created with
`mkdir etc
docker run -it --tmpfs=/var/run/prosody:uid=100,suid,mode=5744 --rm --name=prosody sebastianwagner/prosody-alpine:latest sh \
 && docker cp prosody:/etc/prosody/ ./etc/`

# build with
`docker build --no-cache --force-rm --tag=sebastianwagner/prosody-alpine:0.10_alpine-edge .`


# run with
`docker run \
 --read-only \
 -it \
 --tmpfs=/var/run/prosody:uid=100,suid,mode=5740 \
 --rm -v `pwd`/etc/prosody:/etc/prosody:ro \
 -v prosodydata:/var/lib/prosody \
 --name=prosody \
 --publish=5222:5222 \
 --publish=5269:5269 \
 --publish=5000:5000 \
  -h example.com \
  sebastianwagner/prosody-alpine:0.10_alpine-edge /bin/sh`


# export with

`docker save -o sebastianwagner_prosody-alpine:0.10_alpine-edge_`date -I`.tar.xz sebastianwagner/prosody-alpine:0.10_alpine-edge`

