# builddockers
--------
docker templates for buildcoin
- usage:
```
docker run \
  -v `pwd`/GenesisH0:/GenesisH0 \
  -v `pwd`/.ccache:/root/.ccache \
  -v `pwd`/src:/src \
  usrcoin/newcoin:1.0.0 /bin/bash -c \
  "cd /src;ls -lat"
```
