#!/bin/bash

set -eu

export HOME=/tmp

mkdir -p /tmp/${BUILD_NAME}
/usr/bin/xvfb-run /opt/Unity/Editor/Unity \
  -quit \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile /dev/console \
  -projectPath /mnt \
  "$@"

cd /tmp
zip -9 -r /mnt/${BUILD_NAME}.zip ${BUILD_NAME}
