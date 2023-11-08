#!/usr/bin/env bash

set -e

STEP_CNT=4

echo_step() {
cat <<EOF

######################################################################


Init Step ${1}/${STEP_CNT} [${2}] -- ${3}


######################################################################

EOF
}
ADMIN_PASSWORD="admin"

# Initialize the database
echo_step "1" "Starting" "Applying DB migrations"
superset db upgrade
echo_step "1" "Complete" "Applying DB migrations"

# Create an admin user
echo_step "2" "Starting" "Setting up admin user ( admin / $ADMIN_PASSWORD )"
superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password $ADMIN_PASSWORD
echo_step "2" "Complete" "Setting up admin user"
# Create default roles and permissions
echo_step "3" "Starting" "Setting up roles and perms"
superset init
echo_step "3" "Complete" "Setting up roles and perms"

# echo_step "4" "Starting" "Import THE ICONIC database configs"
# if [ -d /app/ti_databases ]; then
#     for f in $(ls /app/ti_databases); do
#         superset import_datasources -p /app/ti_databases/$f
#     done
# fi
# echo_step "4" "Complete" "Import THE ICONIC database configs"
