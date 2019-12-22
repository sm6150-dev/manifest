#!/bin/bash

set -e
source build/envsetup.sh

# bootable/recovery
changes=(
259720 # recovery: sdcard is data/media/0
)
repopick ${changes[@]}&

# build/make
changes=(
257172 # releasetools: squash backuptool support
257177 # releasetools: Use the first entry of a mount point when reading fstab
259308 # build: Force system-as-root layout for backuptool
259309 # releasetools: Implement system-mount script to support any recovery system mount
257170 # build: Never set persist.sys.usb.config=none in recovery
257174 # releasetools: support reading release keys out of some sort of command
257175 # releasetools: Add script to sign zips
257176 # releasetools: Store the build.prop file in the OTA zip
257178 # build: allow forcing build of otatools
)
repopick -P build/make ${changes[@]}&

# frameworks/base
changes=(
256447 # SystemUI: Add Profiles tile
258303 # power: Re-introduce custom charging sounds
258546 # Camera button support
258820 # SystemUI: Add visualizer feature
258826 # SystemUI: Dismiss keyguard on boot if disabled by current profile
258827 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
259458 # storage: Do not notify for volumes on non-removable disks
260002 # fw/b: Squash of app fw restriction commits
263116 # SystemUI: Revive navbar layout tuning via sysui_nav_bar tunable
264994 # SystemUI: Bring back good ol' circle battery style
)
repopick -P frameworks/base ${changes[@]}&

# hardware/lineage/interfaces
changes=(
260411 # cryptfshw: Introduce QSEECom backend implementation
263896 # cryptfshw: Introduce kernel backend implementation
)
repopick -P hardware/lineage/interfaces ${changes[@]}&

# hardware/qcom-caf/msm8996/audio
changes=(
265315 # hal: Support the audio amplifier hook
261894 # Build audio.primary.* with BOARD_VNDK_VERSION
265499 # hal: fix misc audio hal errors
265500 # hal: Use log/log.h instead of cutils/log.h
260613 # audio: Extend platform parser to allow device name aliasing
260610 # audio: Fix flac offload not working
)
repopick -P hardware/qcom-caf/msm8996/audio ${changes[@]}&

# lineage-sdk
changes=(
259996 # lineage-sdk: Update path to ChargingStarted.ogg
)
repopick -P lineage-sdk ${changes[@]}&

# packages/apps/ExactCalculator
changes=(
263677 # ExactCalculator: prevent back gesture conflict
)
repopick -P packages/apps/ExactCalculator ${changes[@]}&

# packages/apps/LineageParts
changes=(
258825 # LineageParts: Reenable system profiles
260416 # Parts: Convert charging sound path to uri
)
repopick -P packages/apps/LineageParts ${changes[@]}&

# packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
259315 # One does not simply become a Developer
259459 # storage: Do not allow eject for volumes on non-removable disks
259455 # Settings: per-app cellular data, vpn and wifi restrictions
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick -P packages/apps/SetupWizard ${changes[@]}&

# packages/apps/Trebuchet
changes=(
262575 # Apply icon size modifications from old Trebuchet
262576 # Add a 5x4 workspace and switch to it
)
repopick -P packages/apps/Trebuchet ${changes[@]}&

# packages/services/Telephony
changes=(
256795 # Don't start SIP service before decrypted
)
repopick -P packages/services/Telephony ${changes[@]}&

# system/netd
changes=(
260003 # system/netd: Squash of app fw restriction commits
)
repopick -P system/netd ${changes[@]}&

# system/vold
changes=(
258176 # vold: skip first disk change when converting MBR to GPT
258178 # vold: Accept Linux GPT partitions on external SD cards
)
repopick -P system/vold ${changes[@]}&

# vendor/lineage
changes=(
259310 # prebuilt: Add a script to simplify A-only recovery system mount
255667 # adb insecure by default
)
repopick -P vendor/lineage ${changes[@]}&

wait

# build/make
repopick -P build/make -f 259858 # Sorry bro: 6 -> 3