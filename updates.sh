#!/bin/bash

set -e
source build/envsetup.sh

# art
changes=(
265485 # Trigger GC when 90% heap is utilized
)
repopick -P art ${changes[@]}&

# build/make
changes=(
257170 # build: Never set persist.sys.usb.config=none in recovery
257176 # releasetools: Store the build.prop file in the OTA zip
)
repopick -P build/make ${changes[@]}&

# device/qcom/sepolicy
changes=(
267998 # sepolicy: Allow system_server to read vendor camera props
)
repopick -P device/qcom/sepolicy ${changes[@]}&

# device/xiaomi/sm6150-common
changes=(
268940
268972
268984
)	
repopick -P device/xiaomi/sm6150-common ${changes[@]}&	

# device/xiaomi/davinci
changes=(
268985
)	
repopick -P device/xiaomi/davinci ${changes[@]}&	

# frameworks/base
changes=(
258303 # power: Re-introduce custom charging sounds
258546 # Camera button support
258820 # SystemUI: Add visualizer feature
260002 # fw/b: Squash of app fw restriction commits
265508 # Phone ringtone setting for Multi SIM device
265511 # Don't change public API
267249 # DozeSensors: do not use binned brightness sensor for proximity if not supported
267565 # SystemUI: Bring back ic_qs_bluetooth_connected.xml
265531 # core: Add camera intents for camera state [1/2]
267306 # Camera: Squashed support for Aux camera {black,white}list feature
267312 # Camera: Force HAL1 for predefined package list.
267916 # RingtoneManager: Don't crash if the ringtone doesn't have a numerical ID
268800 # Enlarge EPSILON to 0.01 for android.display.cts.DisplayTest#testModeSwitch pass
268802 # Allow zero stride
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

# packages/apps/Eleven
changes=(
268192 # Refactor music playback service binding logic.
268634 # Use SystemClock.elapsedRealtime() for notification tracking time
268635 # Fix notification foreground tracking behavior
268193 # Stop playback button updates when playback fragment is stopped.
268194 # Bind/unbind service on start/stop instead of create/destroy.
268248 # Simplify queue change notification handling.
268249 # Refactor AUDIO_BECOMING_NOISY broadcast handling.
268370 # Avoid usage of deprecated APIs in MusicPlaybackService.
268371 # Don't update notification twice on play start.
268377 # Fix some lint issues in MusicPlaybackService.
)
repopick -P packages/apps/Eleven ${changes[@]}&

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
268247 # backuptool: Remove backup blacklist/whitelist
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

# hardware/qcom-caf/sm8150/{audio,display,media}
repopick -t LA.UM.8.1.r1-13500-sm8150.0
repopick -t  qtc_mapper_allocator_3.0

repopick -t mi6150-drm

repopick -t fod-ten-pre-uprev
repopick 266130 # FODCircleView: Add Support for custom FP pressed icon

# build/make
repopick -P build/make -f 266145 # Sorry bro: 6 -> 3

# vendor/lineage
repopick -P vendor/lineage -f 262320 # aosp_audio: copy our own old AOSP alarm variants
