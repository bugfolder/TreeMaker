#!/bin/bash
# This script rebuilds the wxWidgets libraries from the supplied Xcode
# project without changing the existin setup.h or chkconf.h.

WX_DIR=wxMac-2.6

if [ ! -d build/$WX_DIR ]; then
  echo "Error: directory build/$WX_DIR doesn't exist."
  exit 1
fi

# Build the wxWidgets static libraries
cd build/$WX_DIR/src
if ! xcodebuild -project wxWindows.xcodeproj -target static -configuration Development
then
  exit 1
fi
if ! xcodebuild -project wxWindows.xcodeproj -target static -configuration Deployment
then
  exit 1
fi
cd ../../..

exit 0
