FROM debian:bookworm

# Install JRE
ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:21-jre $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install unzip for compiler unpack and jq just in case it will be useful
RUN apt-get update \
&& apt-get -y install jq unzip curl wget \
&& rm -rf /var/lib/apt/lists/*

# Install Kotlin compiler
ARG KOTLINC_VERSION="2.1.10"
RUN wget -q "https://github.com/JetBrains/kotlin/releases/download/v$KOTLINC_VERSION/kotlin-compiler-$KOTLINC_VERSION.zip" && \
    unzip "kotlin-compiler-$KOTLINC_VERSION.zip" -d /usr/lib && \
    rm "kotlin-compiler-$KOTLINC_VERSION.zip"
ENV KOTLIN_HOME /usr/lib/kotlinc

RUN useradd -ms /bin/bash --home /app app
USER app

ENV PATH $PATH:$KOTLIN_HOME/bin:/app
WORKDIR /app
# Cache dependencies and compilation result for better start-up speed in the app's folder
ENV KOTLIN_MAIN_KTS_COMPILED_SCRIPTS_CACHE_DIR /app

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
