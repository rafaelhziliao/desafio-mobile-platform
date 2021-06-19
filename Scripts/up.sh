#!/bin/bash

bundle_install() {
    echo "🔮  Installing bundle content"
    bundle install
}

tuist_generate_project() {
    echo "🔮  Generating project and workspace from tuist"
    ./.tuist-bin/tuist generate
}

pod_install() {
    echo "🔮  Installing pods"
    bundle exec pod install
}

open_workspace() {
    echo "🛠  Openning workspace"
    open desafio.xcworkspace
}

bundle_install
tuist_generate_project
pod_install
open_workspace