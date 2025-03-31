#!/bin/sh
set -x

POSTGRES_DB=cf_token_metadata_registry
POSTGRES_USER=cardano
POSTGRES_PASSWORD=metadata1337_

# Set password
mkdir -p /pgpass
PGADMIN_PASSWORD_FILE=/pgpass/pgpass
rm -rf $PGADMIN_PASSWORD_FILE;

cat >$PGADMIN_PASSWORD_FILE <<EOL 
*:*:*:${POSTGRES_USER}:${POSTGRES_PASSWORD}
EOL

# PG server file
PGADMIN_SERVER_JSON_FILE=/pgadmin4/servers.json ;
rm -rf $PGADMIN_SERVER_JSON_FILE ;

cat >$PGADMIN_SERVER_JSON_FILE <<EOL
{
    "Servers": {
        "1": {
            "Group": "Servers",
            "Name": "Token registry",
            "Host": "db",
            "Port": 5432,
            "MaintenanceDB": "${POSTGRES_DB}",
            "Username": "${POSTGRES_USER}",
            "Favorite": true,
            "ConnectionParameters": {
                "sslmode": "prefer",
                "connect_timeout": 10,
                "passfile": "/pgpass/pgpass"
            }
        }
    }
}
EOL

# Set permissions
chmod 600 $PGADMIN_PASSWORD_FILE



