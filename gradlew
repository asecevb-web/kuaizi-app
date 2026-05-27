#!/bin/sh
# Gradle wrapper script for GitHub Actions
GRADLE_VERSION=8.5

# Use Gradle from system if available (GitHub Actions has it)
if command -v gradle >/dev/null 2>&1; then
    exec gradle "$@"
fi

# Otherwise download
GRADLE_DIR="$HOME/.gradle"
GRADLE_HOME="$GRADLE_DIR/gradle-${GRADLE_VERSION}"

if [ ! -d "$GRADLE_HOME" ]; then
    echo "Downloading Gradle $GRADLE_VERSION..."
    mkdir -p "$GRADLE_DIR"
    curl -sL "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o /tmp/gradle.zip
    unzip -q /tmp/gradle.zip -d "$GRADLE_DIR"
    rm -f /tmp/gradle.zip
fi

exec "$GRADLE_HOME/bin/gradle" "$@"
