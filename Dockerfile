FROM eclipse-temurin:21-jre

# Install unzip for compiler unpack and jq just in case it will be useful
RUN apt-get update \
&& apt-get -y install jq unzip \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir /app

# Install Kotlin compiler
ARG KOTLINC_VERSION="2.0.0"
RUN wget -q "https://github.com/JetBrains/kotlin/releases/download/v$KOTLINC_VERSION/kotlin-compiler-$KOTLINC_VERSION.zip" && \
    unzip "kotlin-compiler-$KOTLINC_VERSION.zip" -d /usr/lib && \
    rm "kotlin-compiler-$KOTLINC_VERSION.zip"
ENV KOTLIN_HOME /usr/lib/kotlinc

ENV PATH $PATH:$KOTLIN_HOME/bin:/app
WORKDIR /app

# Cache dependencies and compilation result for better start-up speed in the app's folder
ENV KOTLIN_MAIN_KTS_COMPILED_SCRIPTS_CACHE_DIR /app

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
