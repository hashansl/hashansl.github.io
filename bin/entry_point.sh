#!/bin/bash
set -euo pipefail

echo "Entry point script running"

CONFIG_FILE=_config.yml

# Function to manage Gemfile.lock
manage_gemfile_lock() {
    git config --global --add safe.directory '*'
    if command -v git &> /dev/null && [ -f Gemfile.lock ]; then
        if git ls-files --error-unmatch Gemfile.lock &> /dev/null; then
            echo "Gemfile.lock is tracked by git, keeping it intact"
            git restore Gemfile.lock 2>/dev/null || true
        else
            echo "Gemfile.lock is not tracked by git, removing it"
            rm Gemfile.lock
        fi
    fi
}

start_jekyll() {
    manage_gemfile_lock
    bundle exec jekyll serve --watch --force_polling --port=8080 --host=0.0.0.0 --livereload --livereload-port=35729 --drafts --trace &
}

start_jekyll

last_config_checksum="$(sha256sum "$CONFIG_FILE" | awk '{print $1}')"

while true; do
    sleep 2
    current_config_checksum="$(sha256sum "$CONFIG_FILE" | awk '{print $1}')"
    if [ "$current_config_checksum" != "$last_config_checksum" ]; then
        echo "Change detected to $CONFIG_FILE, restarting Jekyll"
        jekyll_pid="$(pgrep -f 'jekyll serve' || true)"
        if [ -n "$jekyll_pid" ]; then
            kill -TERM $jekyll_pid
            wait $jekyll_pid 2>/dev/null || true
        fi
        last_config_checksum="$current_config_checksum"
        start_jekyll
    fi
done
