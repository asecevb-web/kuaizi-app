#!/bin/sh
# Gradle wrapper - downloads gradle if needed
GRADLE_VERSION=8.5
GRADLE_DIR="$HOME/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin"
GRADLE_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"

if [ ! -d "$GRADLE_DIR" ]; then
    echo "Downloading Gradle $GRADLE_VERSION..."
    mkdir -p "$GRADLE_DIR"
    curl -sL "$GRADLE_URL" -o /tmp/gradle.zip
    unzip -q /tmp/gradle.zip -d "$GRADLE_DIR"
    rm /tmp/gradle.zip
fi

GRADLE_HOME=$(find "$GRADLE_DIR" -maxdepth 1 -name "gradle-*" -type d | head -1)
exec "$GRADLE_HOME/bin/gradle" "$@"
