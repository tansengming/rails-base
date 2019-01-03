#! /usr/bin/env bash

set -e
[ -n "$RELEASE_DEBUG" ] && set -x

git up

export LAST_DEPLOY=$(git for-each-ref --format="%(refname)" --sort=-taggerdate --count=1 refs/tags | sed 's#refs/tags/##')
export NOW=`date "+%Y-%m-%d-%H%M"`
export RELEASE_NAME=$NOW-$USER

git flow release start $RELEASE_NAME

git flow release finish -m "$RELEASE_NAME" $RELEASE_NAME
git push --tags origin master
git checkout develop
git push origin develop

echo "--> This release will automatically deploy once master is green <--"