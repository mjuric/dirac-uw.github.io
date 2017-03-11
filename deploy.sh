#!/bin/bash

set -e

#hugo
#rsync -avzc --delete public/ mjuric@research.majuric.org:/var/www/research.majuric.org/html/dirac2
#rm -rf public


if [[ $(git status -s) ]]; then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

UPSTREAM="git@github.com:dirac-uw/dirac-uw.github.io.git"
REV="$(git describe --always --dirty)"

if [[ ! -d public/.git || $(cd public && git remote get-url origin) != "$UPSTREAM" ]]; then
	echo "Cloning $UPSTREAM"
	rm -rf public
	git clone -n "$UPSTREAM" public
fi

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo

echo "Committing to $UPSTREAM master."
(cd public && git add --all && git commit --amend -m "Source built from $REV" -q)

echo "Publishing to $UPSTREAM"
(cd public && git push --force)
