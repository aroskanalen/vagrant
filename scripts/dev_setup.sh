#!/usr/bin/env bash
bold=$(tput bold)
normal=$(tput sgr0)

base_dir=$(cd $(dirname "${BASH_SOURCE[0]}")/../ && pwd)

cd $base_dir

mkdir packages
cd packages

mkdir os2display
cd os2display

GIT_ORGANIZATION=os2display

function clone_latest {
  git clone --branch=master https://github.com/$GIT_ORGANIZATION/$1.git

#  If you can use ssh access to the git repository, you can do this instead:
#  git clone --branch=master git@github.com:$GIT_ORGANIZATION/$1.git

  cd $1

  latesttag=$(git describe --tags)
  echo checking out ${latesttag}
  git checkout ${latesttag}

  cd ..
}

BUNDLES="core-bundle
media-bundle
admin-bundle
default-template-bundle"

for BUNDLE in $BUNDLES
do
(
    clone_latest $BUNDLE
)
done

cd ..

mkdir itk-os2display
cd itk-os2display

GIT_ORGANIZATION=itk-os2display

BUNDLES="aarhus-data-bundle
aarhus-second-template-bundle
lokalcenter-template-bundle
os2display-koba-integration
template-extension-bundle
vimeo-bundle"

for BUNDLE in $BUNDLES
do
(
    clone_latest $BUNDLE
)
done

cd ..

mkdir aakb
cd aakb

GIT_ORGANIZATION=aakb

clone_latest aakb/os2display-aarhus-templates

cd ..

cd ..
