#!/bin/sh

echo "Publishing javadocs to GitHub pages..."

git clone --quiet --branch=gh-pages https://tus-bot:$GITHUB_TOKEN@github.com/tus/tus-android-client.git ../gh-pages
commit=$(git rev-parse HEAD)
javadoc io.tus.android.client -sourcepath ./tus-android-client/src/main/java -d ../gh-pages/javadoc

cd ../gh-pages

git config user.email "tim@transloadit.com"
git config user.name "tus' bot from Travis CI"

git add ./javadoc
git commit -m "Update javadoc for ${commit}"
git push origin gh-pages --quiet

cd ../tus-android-client
