#!/bin/bash
set -e

pgid=${PGID:-$(id -u root)}
puid=${PUID:-$(id -g root)}

conf=${CONF_FILE:-"/config.json"}
host=${HOST:-"0.0.0.0"}
port=${PORT:-5000}

exec "$@" -c $conf --host $host --port $port
