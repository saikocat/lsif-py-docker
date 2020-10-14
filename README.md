# lsif-py-docker
Docker container for sourcegraph lsif-py.

## Usage
### Get the image
```
$ docker pull saikocat/lsif-py:<tag>
```

### Run
You need to mount directory before able to run the indexer
```
$ docker run --rm -v "/path/to/workspace:/work" lsif-py -v /work/
# Run without arg/flag you need to specify the exectuable
$ docker run --rm -it -v "/path/to/workspace:/work" lsif-py lsif-py /work/
```

# Build instruction
```
$ env LATEST_RELEASE_VERSION=<semver> make build push-registry
```
