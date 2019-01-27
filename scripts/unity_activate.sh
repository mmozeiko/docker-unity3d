#!/bin/bash

set -eu

HOST_UID=`stat -c "%u" /tmp/.local`
HOST_GID=`stat -c "%g" /tmp/.local`

export HOME=/tmp
sudo -E -u \#${HOST_UID} -g \#${HOST_GID} /opt/Unity/Editor/Unity
