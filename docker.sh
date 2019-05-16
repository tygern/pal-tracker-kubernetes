#!/usr/bin/env bash

docker build applications/registration-server/ -t registration-server
docker build applications/allocations-server/ -t allocations-server
docker build applications/backlog-server/ -t backlog-server
docker build applications/timesheets-server/ -t timesheets-server

docker run -p8083:8080 -d -eSPRING_DATASOURCE_URL="jdbc:mariadb://host.docker.internal:3306/tracker_registration_dev?useSSL=false&useTimezone=true&serverTimezone=UTC&useLegacyDatetimeCode=false" registration-server
docker run -p8081:8080 -d -eREGISTRATION_SERVER_ENDPOINT="http://host.docker.internal:8083" -eSPRING_DATASOURCE_URL="jdbc:mariadb://host.docker.internal:3306/tracker_allocations_dev?useSSL=false&useTimezone=true&serverTimezone=UTC&useLegacyDatetimeCode=false" allocations-server
docker run -p8082:8080 -d -eREGISTRATION_SERVER_ENDPOINT="http://host.docker.internal:8083" -eSPRING_DATASOURCE_URL="jdbc:mariadb://host.docker.internal:3306/tracker_backlog_dev?useSSL=false&useTimezone=true&serverTimezone=UTC&useLegacyDatetimeCode=false" backlog-server
docker run -p8084:8080 -d -eREGISTRATION_SERVER_ENDPOINT="http://host.docker.internal:8083" -eSPRING_DATASOURCE_URL="jdbc:mariadb://host.docker.internal:3306/tracker_timesheets_dev?useSSL=false&useTimezone=true&serverTimezone=UTC&useLegacyDatetimeCode=false" timesheets-server
