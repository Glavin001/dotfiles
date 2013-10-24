#!/bin/sh

# Source: http://stackoverflow.com/a/11258810/2578205

set -e

git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
while read path_key path
do
    url_key=$(echo $path_key | sed 's/\.path/.url/')
    url=$(git config -f .gitmodules --get "$url_key")
    git submodule add $url $path
done
