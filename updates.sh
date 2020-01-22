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

# bootable/recovery
changes=(
259720 # recovery: sdcard is data/media/0
265182 # updater: Fix lost capabilities of set_metadata
)
repopick -P bootable/recovery ${changes[@]}&

# build/make
changes=(
257177 # releasetools: Use the first entry of a mount point when reading fstab
257170 # build: Never set persist.sys.usb.config=none in recovery
257174 # releasetools: support reading release keys out of some sort of command
257175 # releasetools: Add script to sign zips
257176 # releasetools: Store the build.prop file in the OTA zip
257178 # build: allow forcing build of otatools
)
repopick -P build/make ${changes[@]}&

# device/qcom/sepolicy
changes=(
264669 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-13000-sm8150.0'
)
repopick -P device/qcom/sepolicy ${changes[@]}&

# device/lineage/sepolicy
changes=(
266115 # snap_app: Allow allow binder call with gpuservice
)
repopick -P device/lineage/sepolicy ${changes[@]}&

# device/xiaomi/common
changes=(
266162 # common: Import Xiaomi HAL definitions
266163 # common: Import Goodix biometrics fingerprint HAL definitions
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
267249 # DozeSensors: do not use binned brightness sensor for proximity if not supported
266130 # FODCircleView: Add Support for custom FP pressed icon
265531 # core: Add camera intents for camera state [1/2]
267437 # SystemUI: implement better partial screenshot
267439 # ScreenshotHelper: ignore timeout when taking partial screenshots
267459 # FODCircleView: Correct position on keyguard
)
repopick -P frameworks/base ${changes[@]}&

# hardware/qcom-caf/msm8996/audio
changes=(
260610 # audio: Fix flac offload not working
)
repopick -P hardware/qcom-caf/msm8996/audio ${changes[@]}&

# hardware/qcom-caf/sm8150/audio
changes=(
265341 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-12200-sm8150.0'
262311 # audio: Add missing includes
)
repopick -P hardware/qcom-caf/sm8150/audio ${changes[@]}&

# hardware/qcom-caf/sm8150/display
changes=(
264576/3 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-12200-sm8150.0'
264201 # gralloc: Upgrade mapper and allocator to 3.0
)
repopick -P hardware/qcom-caf/sm8150/display ${changes[@]}&

# hardware/qcom-caf/sm8150/media
changes=(
264578 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-12200-sm8150.0'
)
repopick -P hardware/qcom-caf/sm8150/media ${changes[@]}&

# lineage-sdk
changes=(
259996 # lineage-sdk: Update path to ChargingStarted.ogg
265380 # lineage-sdk: Add camera intents for camera state [2/2]
264593 # SensitivePhoneNumbers: Additionally check against the given sim operator
266410 # lineage-sdk: Drop Expanded Desktop API
)
repopick -P lineage-sdk ${changes[@]}&

# packages/apps/ExactCalculator
changes=(
263677 # ExactCalculator: prevent back gesture conflict
)
repopick -P packages/apps/ExactCalculator ${changes[@]}&

# packages/apps/Exchange
changes=(
266803 # Exchange: bump target sdk to 23
)
repopick -P packages/apps/Exchange ${changes[@]}&

# packages/apps/LineageParts
changes=(
260416 # Parts: Convert charging sound path to uri
266409 # LineageParts: Drop Expanded Desktop feature
)
repopick -P packages/apps/LineageParts ${changes[@]}&

# packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
259315 # One does not simply become a Developer
259455 # Settings: per-app cellular data, vpn and wifi restrictions
265509 # Phone ringtone setting for Multi SIM device
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick -P packages/apps/SetupWizard ${changes[@]}&

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
264230 # sepolicy: Optionally build sepolicy_freeze_test
264267 # file_contexts: Include legacy /system/vendor paths
264057 # Fix storaged access to /sys/block/mmcblk0/stat after 48027a00
264432 # sepolicy: Treat proc-based DT fstab the same and sys-based
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
266664 # overlay: Add more default packages from Google
265745 # default-permissions: Grant default permissions to com.android.exchange
259683 # lineage: Update installboot for Q
255667 # adb insecure by default
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

# build/make
repopick -P build/make -f 266145 # Sorry bro: 6 -> 3

# vendor/lineage
repopick -P vendor/lineage -f 262320 # aosp_audio: copy our own old AOSP alarm variants
