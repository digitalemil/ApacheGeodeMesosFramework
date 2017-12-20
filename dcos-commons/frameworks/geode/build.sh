#!/usr/bin/env bash
set -e

FRAMEWORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_DIR=$FRAMEWORK_DIR/build/distributions

GEODE_DOCUMENTATION_PATH="http://MESOSPHERE.COM/DOCS" \
GEODE_ISSUES_PATH="http://MESOSPHERE.COM/SUPPORT" \
    $FRAMEWORK_DIR/../../tools/build_framework.sh \
        geode \
        $FRAMEWORK_DIR \
        --artifact "$BUILD_DIR/executor.zip" \
        --artifact "$BUILD_DIR/$(basename $FRAMEWORK_DIR)-scheduler.zip" \
        $@
