#!/bin/bash

export outdir="${TWRP_DIR}/out/target/product/${device}"
BUILD_START=$(date +"%s")
echo "Build started for ${device}"
if [ "${jenkins}" == "true" ]; then
    telegram -M "Build ${BUILD_DISPLAY_NAME} started for ${device}: [See Progress](${BUILD_URL}console)"
else
    telegram -M "Build started for ${device}"
fi
source build/envsetup.sh
lunch "omni_${device}-eng"
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
mka recoveryimage
BUILD_END=$(date +"%s")
BUILD_DIFF=$((BUILD_END - BUILD_START))

export finalimg_path=$(ls "${outdir}/recovery.img" | tail -n -1)
export tag="twrp-${device}-$(date +%m%d%Y-%H%m)"
if [ -e "${finalimg_path}" ]; then
    echo "Build completed successfully in $((BUILD_DIFF / 60)) minute(s) and $((BUILD_DIFF % 60)) seconds"

    cp "${outdir}/recovery.img" "${outdir}/${tag}.img"

    echo "Uploading"

    github-release "${release_repo}" "${tag}" "master" "TWRP for ${device}

Date: $(env TZ="${timezone}" date)" "${outdir}/${tag}.img"

    echo "Uploaded"

    telegram -M "Build completed successfully in $((BUILD_DIFF / 60)) minute(s) and $((BUILD_DIFF % 60)) seconds

Download: ["${tag}.img"]("https://github.com/${release_repo}/releases/download/${tag}/${tag}.img")"
curl --data parse_mode=HTML --data chat_id=$TELEGRAM_CHAT --data sticker=CAADBQADGgEAAixuhBPbSa3YLUZ8DBYE --request POST https://api.telegram.org/bot$TELEGRAM_TOKEN/sendSticker

else
    echo "Build failed in $((BUILD_DIFF / 60)) minute(s) and $((BUILD_DIFF % 60)) seconds"
    telegram -N -M "Build failed in $((BUILD_DIFF / 60)) minute(s) and $((BUILD_DIFF % 60)) seconds"
    curl --data parse_mode=HTML --data chat_id=$TELEGRAM_CHAT --data sticker=CAADBQADGgEAAixuhBPbSa3YLUZ8DBYE --request POST https://api.telegram.org/bot$TELEGRAM_TOKEN/sendSticker
    exit 1
fi
