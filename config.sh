#!/bin/bash

set -o errexit
set -o nounset

echo "Configuring psql with improved performance..."

sed -ri "s/^#*(fsync\s*=\s*)\S+/\1 off/" "$PGDATA"/postgresql.conf
sed -ri "s/^#*(full_page_writes\s*=\s*)\S+/\1 off/" "$PGDATA"/postgresql.conf
sed -ri "s/^#*(random_page_cost\s*=\s*)\S+/\1 2.0/" "$PGDATA"/postgresql.conf
sed -ri "s/^#*(checkpoint_segments\s*=\s*)\S+/\1 64/" "$PGDATA"/postgresql.conf
sed -ri "s/^#*(checkpoint_completion_target\s*=\s*)\S+/\1 0.9/" "$PGDATA"/postgresql.conf

grep fsync "$PGDATA"/postgresql.conf

