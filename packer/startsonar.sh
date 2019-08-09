#!/bin/bash
#
#       /etc/rc.d/init.d/docker
#
#       Daemon for docker.com
#
# chkconfig:   2345 95 05
# description: Daemon for docker.com

### BEGIN INIT INFO
# Provides:       docker
# Required-Start: $network cgconfig
# Required-Stop:
# Should-Start:
# Should-Stop:
# Default-Start: 2 3 4 5
# Default-Stop:  0 1 6
# Short-Description: start and stop docker
# Description: Daemon for docker.com
### END INIT INFO

# Source function library.
. /etc/rc.d/init.d/functions

if [ "$1" != "start" ]; then
   exit 0
fi

# this looks nicer
docker-compose -f /tmp/sonar.yml up -d

