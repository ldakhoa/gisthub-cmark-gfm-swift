#!/bin/bash

cd Example/

xcodebuild build-for-testing \
    -sdk iphonesimulator \
    -scheme Example \
    -destination 'platform=iOS Simulator,name=iPhone 8,OS=16.2' \
