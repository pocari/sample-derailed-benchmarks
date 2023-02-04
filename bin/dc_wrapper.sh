#!/bin/bash

set -ex

bundle install --system
yarn install

exec ${BASH_SOURCE%/*}/start_server.sh

