FROM stepin/kotlin-scripting

COPY json.main.kts ./

# Cache dependencies and compilation result for better start-up speed
RUN /app/json.main.kts

ENTRYPOINT ["/app/json.main.kts"]
