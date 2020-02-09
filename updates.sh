#!/bin/bash

set -e
source build/envsetup.sh

#repopick -P vendor/lineage 264429 # build: add the 'picklist' utility

#source build/envsetup.sh

#picklist picks.yml

# art
changes=(
265485 # Trigger GC when 90% heap is utilized
)
repopick -P art ${changes[@]}&

# bionic
changes=(
267304 # bionic: Support wildcards in cached hosts file
)
repopick -P bionic ${changes[@]}&

# build/make
changes=(
257170 # build: Never set persist.sys.usb.config=none in recovery
257176 # releasetools: Store the build.prop file in the OTA zip
268008 # build: Add vendor.prop and odm.prop capability
)
repopick -P build/make ${changes[@]}&

# device/qcom/sepolicy
changes=(
264669 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-13000-sm8150.0'
267998 # sepolicy: Allow system_server to read vendor camera props
)
repopick -P device/qcom/sepolicy ${changes[@]}&

# device/xiaomi/common
changes=(
268009 # common: Import goodix HAL definitions
268010 # common: Import Xiaomi TouchFeature HAL definitions
268011 # common: Import Xiaomi HAL definitions
268012 # common: Define soong namespace
)
repopick -P device/xiaomi/common ${changes[@]}&

# frameworks/base
changes=(
258303 # power: Re-introduce custom charging sounds
258546 # Camera button support
258820 # SystemUI: Add visualizer feature
260002 # fw/b: Squash of app fw restriction commits
265508 # Phone ringtone setting for Multi SIM device
265511 # Don't change public API
266938 # SystemUI: get rid of build text in qs
267249 # DozeSensors: do not use binned brightness sensor for proximity if not supported
267480 # Context-aware Bluetooth airplane mode
267565 # SystemUI: Bring back ic_qs_bluetooth_connected.xml
266130 # FODCircleView: Add Support for custom FP pressed icon
267459 # FODCircleView: Correct position on keyguard
265531 # core: Add camera intents for camera state [1/2]
267306 # Camera: Squashed support for Aux camera {black,white}list feature
267312 # Camera: Force HAL1 for predefined package list.
)
repopick -P frameworks/base ${changes[@]}&

# hardware/qcom-caf/msm8996/audio
changes=(
260610 # audio: Fix flac offload not working
)
repopick -P hardware/qcom-caf/msm8996/audio ${changes[@]}&

# lineage-sdk
changes=(
259996 # lineage-sdk: Update path to ChargingStarted.ogg
265380 # lineage-sdk: Add camera intents for camera state [2/2]
264593 # SensitivePhoneNumbers: Additionally check against the given sim operator
266410 # lineage-sdk: Drop Expanded Desktop API
)
repopick -P lineage-sdk ${changes[@]}&

# packages/apps/Backgrounds
changes=(
268102
268105
268104
)
repopick -P packages/apps/Backgrounds ${changes[@]}&

# packages/apps/ExactCalculator
changes=(
263677 # ExactCalculator: prevent back gesture conflict
)
repopick -P packages/apps/ExactCalculator ${changes[@]}&

# packages/apps/LineageParts
changes=(
260416 # Parts: Convert charging sound path to uri
266409 # LineageParts: Drop Expanded Desktop feature
)
repopick -P packages/apps/LineageParts ${changes[@]}&

# packages/apps/Recorder
changes=(
267929 # Recorder: Enable requestLegacyExternalStorage
)
repopick -P packages/apps/Recorder ${changes[@]}&

# packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
259315 # One does not simply become a Developer
259455 # Settings: per-app cellular data, vpn and wifi restrictions
265509 # Phone ringtone setting for Multi SIM device
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/inputmethods/LatinIME
changes=(
266617 # LatinIME: Update emojis
)
repopick -P packages/inputmethods/LatinIME ${changes[@]}&

# packages/services/Telecomm
changes=(
265510 # Phone ringtone setting for Multi SIM device
)
repopick -P packages/services/Telecomm ${changes[@]}&

# system/core
changes=(
265551 # adb_root: Bypass few more checks
265553 # adb_root: Allow root uid to get root status
267253 # adb: host: Fix windows build after 5c0999c
)
repopick -P system/core ${changes[@]}&

# system/core
changes=(
266061 # keymaster: use log/log.h instead of cutils/log.h
)
repopick -P system/core ${changes[@]}&

# system/netd
changes=(
260003 # system/netd: Squash of app fw restriction commits
)
repopick -P system/netd ${changes[@]}&

# system/sepolicy
changes=(
264406 # sepolicy: New type sdcard_posix for labeled filesystems
)
repopick -P system/sepolicy ${changes[@]}&

# system/vold
changes=(
258169 # vold: add support for more filesystems for public storage
258170 # vold: Fix fsck on public volumes
258171 # vold: Support internal storage partitions
258172 # vold: Honor mount options for ext4/f2fs partitions
258173 # vold: Mount ext4/f2fs portable storage with sdcard_posix
258174 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
258175 # Fix the group permissions of the sdcard root.
258176 # vold: skip first disk change when converting MBR to GPT
258178 # vold: Accept Linux GPT partitions on external SD cards
)
repopick -P system/vold ${changes[@]}&

# vendor/lineage
changes=(
259683 # lineage: Update installboot for Q
266664 # overlay: Add more default packages from Google
)
repopick -P vendor/lineage ${changes[@]}&

# vendor/qcom/opensource/interfaces
changes=(
264665 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-11600-sm8150.0'
264666 # interfaces: Regenerate blueprints
259980 # interfaces: Introduce qcom bluetooth_audio and btconfigstore HALs
)
repopick -P vendor/qcom/opensource/interfaces ${changes[@]}&

wait

# hardware/qcom-caf/sm8150/{audio,display,media}
repopick -t LA.UM.8.9.r1-07700-SM6xx.0
repopick -t  qtc_mapper_allocator_3.0

changes=(
268143 # Revert "audio: Skip libhdmipassthru on OSS builds"
268200 # hal: Add missing includes
268533 # hal: Remove hardcoded dependencies on libaudioparsers
)
repopick -P hardware/qcom-caf/sm8150/audio ${changes[@]}&

# build/make
repopick -P build/make -f 266145 # Sorry bro: 6 -> 3

# vendor/lineage
repopick -P vendor/lineage -f 262320 # aosp_audio: copy our own old AOSP alarm variants

repopick -t android-10.0.0_r27
