#!/bin/bash

set -e
source build/envsetup.sh

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
266220 # Expose TimeService app cert to soong
)
repopick -P device/qcom/sepolicy ${changes[@]}&

# device/qcom/sepolicy-legacy-um
changes=(
266212 # Expose TimeService app cert to soong
)
repopick -P device/qcom/sepolicy-legacy-um ${changes[@]}&

# frameworks/base
changes=(
256447 # SystemUI: Add Profiles tile
258303 # power: Re-introduce custom charging sounds
258546 # Camera button support
258820 # SystemUI: Add visualizer feature
266280 # SystemUI: Dismiss keyguard on boot if disabled by current profile
266281 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
260002 # fw/b: Squash of app fw restriction commits
266052 # Revert "Apply front scrim to doze pulsing"
266112 # FODCircleView: rewrite and simplify implementation
266116 # KeyguardView: report transiting bouncer as shown
266282 # SystemUI: Bring back good ol' circle battery style
265508 # Phone ringtone setting for Multi SIM device
265511 # Don't change public API
265784 # core: Add camera intents for camera state [1/2]
)
repopick -P frameworks/base ${changes[@]}&

# frameworks/opt/telephony
changes=(
265322 # SimPhoneBook: Add ANR/EMAIL support for USIM phonebook.
266275 # IccPhoneBookInterfaceManager: Move class Request from private to public
265822 # Restore isEmergency method
265823 # Restore getSubIdFromNetworkRequest method
)
repopick -P frameworks/opt/telephony ${changes[@]}&

# hardware/libhardware
changes=(
266139 # libhardware: Add new display types.
)
repopick -P hardware/libhardware ${changes[@]}&

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
264593 # SensitivePhoneNumbers: Additionally check against the given sim operator
)
repopick -P lineage-sdk ${changes[@]}&

# packages/apps/Dialer
changes=(
265040 # Beautify call stats details category headers.
)
repopick -P packages/apps/Dialer ${changes[@]}&

# packages/apps/ExactCalculator
changes=(
263677 # ExactCalculator: prevent back gesture conflict
)
repopick -P packages/apps/ExactCalculator ${changes[@]}&

# packages/apps/LineageParts
changes=(
266140 # LineageParts: Reenable system profiles
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
259455 # Settings: per-app cellular data, vpn and wifi restrictions
265959 # Settings: Add a RemotePreference for device-specific doze settings
265509 # Phone ringtone setting for Multi SIM device
)
repopick -P packages/apps/Settings ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick -P packages/apps/SetupWizard ${changes[@]}&

# packages/apps/Trebuchet
changes=(
266208 # Replace 4x4 grid option with a 4x5 one
266209 # Trebuchet: implement hidden & protected apps
266210 # Switch to BiometricPrompt
266211 # Trebuchet: add toggle for desktop and drawer labels
)
repopick -P packages/apps/Trebuchet ${changes[@]}&

# packages/services/Telecomm
changes=(
265510 # Phone ringtone setting for Multi SIM device
)
repopick -P packages/services/Telecomm ${changes[@]}&

# packages/services/Telephony
#changes=(
#256795 # Don't start SIP service before decrypted
#)
#repopick -P packages/services/Telephony ${changes[@]}&

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
259310 # prebuilt: Add a script to simplify A-only recovery system mount
257000 # Remove apicheck.mk
259683 # lineage: Update installboot for Q
255667 # adb insecure by default
265937 # lineage: Deprecate AddonSU
266218 # extract_utils: Drop string after semicolon when parsing destination
)
repopick -P vendor/lineage ${changes[@]}&

wait

# build/make
repopick -P build/make -f 259858 # Sorry bro: 6 -> 3

# vendor/lineage
repopick -P vendor/lineage -f 262320 # aosp_audio: copy our own old AOSP alarm variants
