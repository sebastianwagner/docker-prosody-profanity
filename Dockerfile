FROM alpine:edge
MAINTAINER Sebastian Wagner <2000sw@gmail.com>

RUN apk add --no-cache --update \
            lua5.1-dbi-sqlite3 \
            prosody \
 && sed --in-place --expression 's/\(daemonize = \)true/\1false/' /etc/prosody/prosody.cfg.lua \
 && luac -p /etc/prosody/prosody.cfg.lua


EXPOSE 5222 5269
USER prosody
WORKDIR /var/lib/prosody/
CMD ["prosodyctl", "start"]

VOLUME ["/etc/prosody","/var/lib/prosody"]

# build
# docker build --force-rm --tag=sebastianwagner/prosody-alpine:latest -f Dockerfile .

# http://www.dendeer.com/post/docker-tmpfs/
# run with `docker run \
#       --rm \
#       --read-only \
#       --tmpfs=/var/run/prosody:uid=100,suid,mode=5744 \
#       -v `pwd`/etc/prosody:/etc/prosody:ro
#       --name=prosody \
#       sebastianwagner/prosody-alpine:latest

# todo
# configure host early
# entrypoint
