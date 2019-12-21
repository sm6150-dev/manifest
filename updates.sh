#!/bin/bash

set -e
source build/envsetup.sh

# art
changes=(
265485 # Trigger GC when 90% heap is utilized
)
repopick ${changes[@]}&

# bootable/recovery
#changes=(
#259720 # recovery: sdcard is data/media/0
#)
#repopick ${changes[@]}&

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

# device/qcom/sepolicy
changes=(
264669 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-11600-sm8150.0'
)
repopick -P device/qcom/sepolicy ${changes[@]}&

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
263007 # SystemUI: get rid of build text in qs
263116 # SystemUI: Revive navbar layout tuning via sysui_nav_bar tunable
265531 # core: Add camera intents for camera state [1/2]
265653 # FODCircleView: Add partial wakelock on aod
260783 # FODCircleView: Add MIUI FP icon
265487 # Allow tuning of heaptargetutilization
)
repopick -P frameworks/base ${changes[@]}&

# hardware/interfaces	
changes=(	
258181 # keymasterV4_0: Tags support for FBE wrapped key.	
)	
repopick -P hardware/interfaces ${changes[@]}&	

# hardware/lineage/interfaces
changes=(
260411 # cryptfshw: Introduce QSEECom backend implementation
263896 # cryptfshw: Introduce kernel backend implementation
)
repopick -P hardware/lineage/interfaces ${changes[@]}&

# hardware/qcom-caf/msm8996/audio
changes=(
260610 # audio: Fix flac offload not working
260613 # audio: Extend platform parser to allow device name aliasing
261894 # Build audio.primary.* with BOARD_VNDK_VERSION
)
repopick -P hardware/qcom-caf/msm8996/audio ${changes[@]}&

# hardware/qcom-caf/sm8150/audio
changes=(
265341 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-12200-sm8150.0'
262311 # audio: Add missing includes
)
repopick ${changes[@]}&

# hardware/qcom-caf/sm8150/display
changes=(
264576/3 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-12200-sm8150.0'
264201 # gralloc: Upgrade mapper and allocator to 3.0
)
repopick ${changes[@]}&

# hardware/qcom-caf/sm8150/media
changes=(
264578 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-12200-sm8150.0'
)
repopick ${changes[@]}&

# lineage-sdk
changes=(
259996 # lineage-sdk: Update path to ChargingStarted.ogg
265380 # lineage-sdk: Add camera intents for camera state [2/2]
265585 # lineage-sdk: Introduce LimitSizeList
)
repopick -P lineage-sdk ${changes[@]}&

# packages/apps/DeskClock
#changes=(
#256664 # Make new menu entry to link to cLock widget settings.
#)
#repopick -P packages/apps/DeskClock ${changes[@]}&

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

# packages/apps/Nfc
changes=(
256814 # NFCService: Add sysprop to prevent FW download during boot with NFC off.
)
repopick -P packages/apps/Nfc ${changes[@]}&

# packages/apps/Settings
changes=(
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
259315 # One does not simply become a Developer
#259459 # storage: Do not allow eject for volumes on non-removable disks
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
#263001 # Trebuchet: implement hidden & protected apps
#263070 # Switch to BiometricPrompt
#263005 # Trebuchet: add toggle for desktop and drawer labels
)
repopick -P packages/apps/Trebuchet ${changes[@]}&

# packages/services/Telephony
changes=(
256792 # Telephony: Add ERI configuration for U.S. Cellular
#256793 # Telephony: Support muting by RIL command
#256795 # Don't start SIP service before decrypted
)
repopick -P packages/services/Telephony ${changes[@]}&

# system/core
changes=(
258166 # Add wrapped key support
)
repopick -P system/core ${changes[@]}&

# system/netd
changes=(
260003 # system/netd: Squash of app fw restriction commits
)
repopick -P system/netd ${changes[@]}&

# system/vold
changes=(
#258169 # vold: add support for more filesystems for public storage
#258170 # vold: Fix fsck on public volumes
#258171 # vold: Support internal storage partitions
#258172 # vold: Honor mount options for ext4/f2fs partitions
#258173 # vold: Mount ext4/f2fs portable storage with sdcard_posix
#258174 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
#258175 # Fix the group permissions of the sdcard root.
258133 # vold: Wrapped key support for FBE
258134 # vold: Use separate flag for wrappedkey
258135 # Remove no longer relevant header file
258136 # vold: add support for clear key
258139 # vold: change to upgrade key if export fails
258145 # Updates for migrated code upstream
258140 # system: vold: Use wrapped key for metadata encryption
258176 # vold: skip first disk change when converting MBR to GPT
#258177 # vold: Allow reset after shutdown
258178 # vold: Accept Linux GPT partitions on external SD cards
)
repopick -P system/vold ${changes[@]}&

# vendor/lineage
changes=(
259310 # prebuilt: Add a script to simplify A-only recovery system mount
257000 # Remove apicheck.mk
261292 # vendor/lineage: Fix dopush
261642 # vendor: make dopush recognize /vendor files
258204 # build: set build fingerprint for all devices
#259683 # lineage: don't mount system during install{boot,recovery}
#262320 # aosp_audio: copy our own old AOSP alarm variants
255667 # adb insecure by default
)
repopick -P vendor/lineage ${changes[@]}&

# vendor/nxp/opensource/commonsys/external/libnfc-nci
changes=(
264670 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-11600-sm8150.0'
)
repopick -P vendor/nxp/opensource/commonsys/external/libnfc-nci ${changes[@]}&

# vendor/nxp/opensource/commonsys/packages/apps/Nfc
changes=(
264668 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-11600-sm8150.0'
)
repopick -P vendor/nxp/opensource/commonsys/packages/apps/Nfc ${changes[@]}&

# vendor/nxp/opensource/sn100x/halimpl
changes=(
264667 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-11600-sm8150.0'
)
repopick -P vendor/nxp/opensource/sn100x/halimpl ${changes[@]}&

# vendor/qcom/opensource/interfaces
changes=(
264665 # [DNM][SQUASH] Merge tag 'LA.UM.8.1.r1-11600-sm8150.0'
264666 # interfaces: Regenerate blueprints
)
repopick -P vendor/qcom/opensource/interfaces ${changes[@]}&

wait

# build/make
repopick -P build/make -f 259858 # Sorry bro: 6 -> 3
