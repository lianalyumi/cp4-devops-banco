#!/bin/bash
sqlplus -s $APP_USER/$APP_USER_PASSWORD@//localhost/XEPDB1 @/container-entrypoint-initdb.d/challenge.sql