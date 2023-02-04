#!/bin/bash

# エラーで処理中断
set -ex

if [ "${LOCAL_DOCKER_COMPOSE_MODE}" = "" ]; then
  ln -sf /dev/stdout /usr/src/app/log/${RAILS_ENV}.log
fi

bin/rails db:create
bin/rails db:migrate

if [ "${MANUAL}" = "1" ] ; then
  echo "[MANUAL MODE]"
  tail -f /dev/null
else
  exec ${BASH_SOURCE%/*}/start_rails
fi

