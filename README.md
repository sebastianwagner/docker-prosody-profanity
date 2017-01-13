

# config created with
`mkdir etc
docker run -it --tmpfs=/var/run/prosody:uid=100,suid,mode=5744 --rm --name=prosody sebastianwagner/prosody-alpine:latest sh \
 && docker cp prosody:/etc/prosody/ ./etc/`

