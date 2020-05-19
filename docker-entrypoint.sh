#!/bin/bash
set -e

if [[ -n "$BEANSTALKD_HOST" ]]; then
  if [[ -z "$BEANSTALKD_PORT" ]]; then
    BEANSTALKD_PORT=11300
  fi
  sed -ir "s/'servers'.*$/'servers'=> array('Default Beanstalkd' => 'beanstalk:\/\/$BEANSTALKD_HOST:$BEANSTALKD_PORT'),/g" /var/www/html/config.php
fi

exec /usr/local/bin/apache2-foreground
