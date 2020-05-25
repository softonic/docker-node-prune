# Node Prune

This creates an image with the node-prune binary on it.
The source code is obtained from the repository: https://github.com/tj/node-prune

# Usage

You can clean your `node_modules` directory with the next command:

```shell script
docker run --rm --name node-prune \
  -v $PWD:/app \
  --workdir=/app \
  softonic/node-prune:latest \
  -verbose /app/node_modules
```
Or you can use it in a stage of your `Dockerfile`'s with an specific stage like:

```dockerfile
...
FROM softonic/node-prune:latest AS pruner

COPY --from=builder /usr/src/app/node_modules /usr/src/app/node_modules

RUN node-prune /usr/src/app/node_modules

FROM builder AS production

COPY --from=pruner /usr/src/app/node_modules /usr/src/app/node_modules
...
```

# Build

The source code is automatically built by Docker Hub, but if you want to build it locally just execute:
```shell script
VERSION=latest docker build -t softonic/node-prune:$VERSION .
```