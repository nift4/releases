#!/bin/bash

export my_dir=$(pwd)

echo "Loading configuration..."
source "${my_dir}"/config.sh

if [ -z "${GITHUB_TOKEN}" ]; then
    echo "Please set GITHUB_TOKEN before continuing."
    exit 1
fi

# Email for git
git config --global user.email "${GITHUB_EMAIL}"
git config --global user.name "${GITHUB_USER}"

cd ~

if [ ! -d "${TWRP_DIR}" ]; then
mkdir "${TWRP_DIR}"
fi
cd "${TWRP_DIR}"

CLEAN_START=$(date +"%s")
echo "Cleaning out directory..."
telegram -M "Cleaning out directory..."
make clean -j$(nproc --all)
make clobber -j$(nproc --all)
CLEAN_END=$(date +"%s")
CLEAN_DIFF=$((CLEAN_END - CLEAN_START))
echo "Cleaned out directory in $((CLEAN_DIFF / 60)) minute(s) and $((CLEAN_DIFF % 60)) seconds"
telegram -N -M "Cleaned out directory in $((CLEAN_DIFF / 60)) minute(s) and $((CLEAN_DIFF % 60)) seconds"

if [ ! -d "${TWRP_DIR}/.repo" ]; then
echo "Initializing repository..."
repo init -u "${manifest_url}" -b "${branch}" --depth 1
fi
source "${my_dir}"/sync.sh
