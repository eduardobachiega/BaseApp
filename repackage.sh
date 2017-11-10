#!/usr/bin/env bash
set -x
sed -i "" "s/applicationId \"eduardobachiega.baseapp\"/applicationId \"$1\"/g" app/build.gradle
sed -i "" "s/package=\"eduardobachiega.baseapp/package=\"$1/g" app/src/main/AndroidManifest.xml
appPath=$(echo -n $1 | sed "s/\./\//g")
mkdir -p app/src/main/java/$appPath
mv app/src/main/java/eduardobachiega/baseapp/* app/src/main/java/$appPath
rm -rf app/src/main/java/eduardobachiega
find . -name "*.java" -exec sed -i "" "s/$appPath/g" {} +