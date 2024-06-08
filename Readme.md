# Kotlin Scripting

This repo simplifies work with Kotlin scripts.

Docker image also have bash, unzip, and jq for scripts.

## Dockerfile use case

```Dockerfile
FROM stepin/kotlin-scripting

COPY json.main.kts ./

# Cache dependencies and compilation result for better start-up speed
RUN /app/json.main.kts

ENTRYPOINT ["/app/json.main.kts"]
```

## Non-Dockerfile examples

```shell
# run inline script
docker run --rm -i stepin/kotlin-scripting -e 'println("Hello, world!")'

# run script from file
# NOTE: interactive scripts will not work in this case
docker run --rm -i stepin/kotlin-scripting - < simple.main.kts

# run script from file for interactive case
docker run --rm -it \
  -v "$(PWD):/data" \
  -w /data \
  stepin/kotlin-scripting \
  simple.main.kts

# interactive shell
docker run --rm -i stepin/kotlin-scripting
```
