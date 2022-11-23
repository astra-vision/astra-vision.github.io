#!/bin/bash
GIT_REPO_URL=$(git config --get remote.origin.url)

bundle exec jekyll build --trace

mkdir .deploy
cp -R _site/* .deploy
cd .deploy
git init .
git remote add github $GIT_REPO_URL
git checkout -b gh-pages
git add .
git commit -am "Static site deploy"
git push github gh-pages --force
cd ..
rm -rf .deploy