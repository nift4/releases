#!/bin/bash

export GITHUB_USER="kiam001"
export GITHUB_EMAIL="blablatupfen@gmail.com"

export ROM="Mint-OS"
export ROM_DIR="${WORKSPACE}/MintOS"
export ROM_VERSION="2.1"
export official="false"
export local_manifest_url="https://github.com/nift4/Mint-OS/raw/master/99-mintos.xml"
export manifest_url="https://github.com/LineageOS/android"
export rom_vendor_name="lineage"
export branch="lineage-17.1"
export bacon="bacon"
export buildtype=""
export clean="installclean"
export upload_recovery="true"

export ccache="true"
export ccache_size="100"

export jenkins="true"

export release_repo="nift4/releases"
[ "$device" == "cedric" ] && export sf_target="kiam001@frs.sourceforge.net:/home/frs/project/motog5/MintOS/"
export sf_http_target="motog5/files/MintOS"

export timezone="GMT+1"
