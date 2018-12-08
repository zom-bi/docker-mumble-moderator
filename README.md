## Mumble-moderator ("mumo")
Mumble Moderator is a python interface to moderate Mumble

### Building mumo

```
docker build -t zombi/mumble-moderator .
```

### Running the mumo
Mumo needs to attach to a running mumble server, in order to work properly.
We usually do this by directly attaching the networks of both containers to
each other, like this:

```
   docker run -d \
    --name mumo \
    -v /data/mumo:/data \
    -v /etc/localtime:/etc/localtime:ro \
    --net="container:mumble" \
    zombi/mumo
```

