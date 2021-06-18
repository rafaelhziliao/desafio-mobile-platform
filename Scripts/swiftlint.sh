#!/bin/sh
if [ which "${PODS_ROOT}/SwiftLint/swiftlint" >/dev/null ] && [ ! -z "$CI" ]; 
then
    ${PODS_ROOT}/SwiftLint/swiftlint
fi