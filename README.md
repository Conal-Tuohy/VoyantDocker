## Voyant Docker
To build the docker application, naming the image `voyant-docker`:

```bash
docker build -t voyant-docker .
```

To launch the `voyant-docker` container:
```bash
docker run --publish 8888:8888 voyant-docker
```

```

