#!/bin/bash
    
# Run the MySQL query and store the result in a Bash variable

wsrep_ready=`/bin/cat /secrets/mariadb-root-password | /usr/bin/mysql -h $3 -u root -p -e "SELECT VARIABLE_VALUE FROM information_schema.global_status WHERE VARIABLE_NAME = 'wsrep_ready';" -N`
if [ $? -ne 0 ]; then
  echo Error: Unable to connect to MySQL or query failed
  exit 1
fi

if [ $wsrep_ready != "ON" ]; then
  echo Error: wsrep_ready is not ON, actual status is: $WSREP_READY
  exit 1
fi

exit 0 