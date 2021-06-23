#!/bin/sh
# if which "${PODS_ROOT}/SwiftLint/swiftlint" >/dev/null; 
# then
#     ${PODS_ROOT}/SwiftLint/swiftlint
# else
#     echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
# fi


if  [ "$CI" == "false" ]; 
then
    echo "CI don't run swiflint script"
elif which "${PODS_ROOT}/SwiftLint/swiftlint" >/dev/null; 
then
    ${PODS_ROOT}/SwiftLint/swiftlint
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi