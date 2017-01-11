FROM alpine:edge
MAINTAINER Sebastian Wagner <2000sw@gmail.com>

RUN apk add --no-cache --update \
            prosody \
            nano


EXPOSE 5222 5269
#USER prosody
CMD ["prosodyctl", "start"]


# build
# docker build --force-rm --tag=sebastianwagner/prosody-alpine:latest -f Dockerfile .

# http://www.dendeer.com/post/docker-tmpfs/
# run with `docker run \
#       --rm \
#       --read-only \
#       --tmpfs=/var/run/prosody:uid=100,mode=1744 \
#       -it \
#       sebastianwagner/prosody-alpine`

# todo
# skip nano, configure host early, user prosody
# entrypoint, workdir
