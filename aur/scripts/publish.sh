#!/bin/bash

set -e  # Exit on error
VERSION="$1"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone "ssh://aur@aur.archlinux.org/cmonk.git"

cd cmonk

rm -rf PKGBUILD
rm -rf .SRCINFO
ls -la

cp  ../aur/PKGBUILD .
cp  ../aur/.SRCINFO .
ls -la

cat PKGBUILD
cat .SRCINFO

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"
git add PKGBUILD .SRCINFO

git status

# git commit -m "Chipmunk release $VERSION"
# git push origin master

