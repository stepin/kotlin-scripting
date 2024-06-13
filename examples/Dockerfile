FROM stepin/kotlin-scripting

COPY json.main.kts ./

# Cache dependencies and compilation result for better start-up speed
RUN /app/json.main.kts && find /app/.m2 -type f -exec chmod 644 {} \;

ENTRYPOINT ["/app/json.main.kts"]
