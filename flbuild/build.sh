#!/bin/bash
# build flutter engine
cp /build/.gclient /src/
cd /src
gclient sync
src/flutter/tools/gn --unoptimized --runtime-mode=debug --no-goma
ninja -C src/out/host_debug_unopt
