#!/bin/bash

export GITHUB_USER="kiam001"
export GITHUB_EMAIL="blablatupfen@gmail.com"

export ROM="Mint-OS"
export ROM_DIR="${WORKSPACE}/MintOS"
export ROM_VERSION="3.0pre1"
export official="false"
export local_manifest_url="https://github.com/nift4/Mint-OS/raw/master/99-mintos.xml"
export manifest_url="https://github.com/LineageOS/android"
export rom_vendor_name="lineage"
export branch="lineage-18.1"
export bacon="bacon"
export buildtype=""
export clean="installclean"
export upload_recovery="false"

export ccache="true"
export ccache_size="100"

export jenkins="true"
export TARGET_UNOFFICIAL_BUILD_ID="Mint-v$ROM_VERSION"
[ "$WITH_GAPPS" == "true" ] && export TARGET_UNOFFICIAL_BUILD_ID="$TARGET_UNOFFICIAL_BUILD_ID-GApps"

export release_repo="nift4/releases"
export sf_target="kiam001@frs.sourceforge.net:/home/frs/project/mint-os-project/$device/Next/"
export sf_http_target="mint-os-project/files/$device/Next"
[ "$device" == "cedric" ] && export sf_target="kiam001@frs.sourceforge.net:/home/frs/project/motog5/MintOS/Next/"
[ "$device" == "cedric" ] && export sf_http_target="motog5/files/MintOS/Next/"
[ "$WITH_GAPPS" == "true" ] && export sf_target="${sf_target}GApps/"
[ "$WITH_GAPPS" == "true" ] && export sf_http_target="$sf_http_target/GApps"

export timezone="Europe/Berlin"
