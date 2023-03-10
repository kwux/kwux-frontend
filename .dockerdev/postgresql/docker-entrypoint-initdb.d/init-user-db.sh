#!/bin/bash
set -e

initialize_user_db()
{
  connection_params=()
  connection_params+=("-h" "${1:-postgres}")
  psql ${1:+${connection_params[@]}} --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER kwux_frontend WITH CREATEDB LOGIN password 'kwux_frontend' SUPERUSER;
    CREATE DATABASE kwux_frontend;
    GRANT ALL PRIVILEGES ON DATABASE kwux_frontend TO kwux_frontend;
EOSQL
}

initialize_user_db "$1" || true
