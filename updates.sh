#!/bin/bash

set -e
source build/envsetup.sh

# art
repopick 256444 # Don't fail dual map if memfd isn't supported

# bionic
repopick 256150 # bionic: Use legacy pthread_mutex_init() behavior on pre-P API levels
repopick 256151 # Actually restore pre-P mutex behavior

# bootable/recovery
repopick 255846 # recovery: Allow custom bootloader msg offset in block misc
repopick 255847 # recovery: wipe bootloader message from index 0 when using custom offsets
repopick 255990 # recovery: Remove HOST_OS guard for f2fs tools
repopick 255830 # Make adb use a custom prop for adb root
repopick 255831 # recovery: Get a proper shell environment in recovery
repopick 255832 # recovery: ui: Default to touch enabled
repopick 255833 # recovery: ui: Minor cleanup for touch code
repopick 255992 # recovery: ui: Support hardware virtual keys
repopick 259434 # recovery: Puke out an /etc/fstab so stuff like busybox/toybox is happy
repopick 256010 # recovery: Include vendor init trigger
repopick 259546 # recovery: Allow device-specific recovery modules
repopick 259547 # recovery: Blank screen during shutdown and reboot
repopick 259720 # recovery: sdcard is data/media/0
repopick 259629 # recovery: Provide caching for sideload files
repopick 259548 # recovery: Provide sideload cancellation
repopick 259642 # recovery: Add wipe system partition option
repopick 259643 # recovery: Remove "Supported API" message
repopick 259644 # recovery: Enable the menu for User builds
repopick 259645 # recovery: init: mount pstore fs
repopick 259646 # recovery: Expose reboot to recovery option
repopick 259647 # recovery: Only show tests in eng builds
repopick 259648 # recovery: Also hide rescue mode from non eng builds
repopick 259649 # recovery: Blank screen on init
repopick 255979 # recovery: symlink /sbin for script compatibility
repopick 259738 # recovery: Allow bypassing signature verification on non-release builds
repopick 259748 # recovery: Add runtime checks for A/B vs traditional updates

# build/blueprint
repopick 259301 # Make off-the-shelf order funcs public.

# build/make
repopick 257172 # releasetools: squash backuptool support
repopick 257177 # releasetools: Use the first entry of a mount point when reading fstab
repopick 259308 # build: Force system-as-root layout for backuptool
repopick 259309 # releasetools: Implement system-mount script to support any recovery system mount
repopick 257166 # build: recovery: Support adding device-specific items
repopick 257167 # build: Separate commands in recovery foreach loops
repopick 257168 # Allow setting the recovery density separately from the aapt config
repopick 257170 # build: Never set persist.sys.usb.config=none in recovery
repopick 257173 # Edify: Add abort message for bootloader asserts
repopick 257174 # releasetools: support reading release keys out of some sort of command
repopick 257175 # releasetools: Add script to sign zips
repopick 257176 # releasetools: Store the build.prop file in the OTA zip
repopick 257178 # build: allow forcing build of otatools
repopick 257099 # Make PRODUCT_BUILD_PROP_OVERRIDES bit more powerful
repopick -f 259858 # Sorry bro: 6 -> 3

# build/soong
repopick 256886 # soong: Add function to return camera parameters library name
repopick 259286 # Add android_app_import.
repopick 259287 # uncompressedDex option for android_app_import.
repopick 259288 # Implement DPI variants in android_app_import.
repopick 259289 # androidmk conversion logic for android_app_import
repopick 259290 # Improve android_app_import.dpi_variants handling.
repopick 259291 # Add filename property to android_app_import
repopick 259292 # Add arch variant support to android_app_import.
repopick 259293 # Add default_dev_cert to android_app_import
repopick 259511 # New AndroidMk authoring system based on entry map.
repopick 259512 # Add data property to sh_test.
repopick 259513 # Add sh_test_host.
repopick 259514 # Add overrides property to prebuilt_apex
repopick 259515 # AndroidMkEntries minor refactoring.
repopick 259516 # Comment out broken android_app_imports tests

# device/lineage/sepolicy
repopick 257053 # sepolicy: Make recovery permissive
repopick 257100 # [DND] Kill su

# device/qcom/sepolicy/legacy-um
repopick 259422 # sepolicy: Fix video4linux "name" node labeling
repopick 259423 # sepolicy: Allow mm-qcamerad to access v4L "name" node
repopick 259424 # common: Fix labelling of lcd-backlight
repopick 259425 # msm8996: Consider additional ssr nodes
repopick 259426 # sepolicy: Label persist partition for all SoCs
repopick 259427 # sepolicy: allow vold to read persist dirs

# external/mksh
repopick 259638 # mksh: Mark mkshrc as recovery_available

# external/tinycompress
repopick 256308 # tinycompress: Enable extended compress format

# frameworks/av
repopick 256899 # camera: Allow devices to load custom CameraParameter code
repopick 258224 # Camera: Add extensions to CameraClient
repopick 258437 # Camera: Add support for preview frame fd
repopick 258439 # stagefright: add changes related to high-framerates in CameraSource
repopick 258812 # CameraService: Support hooks for motorized camera

# frameworks/base
#repopick 258530 # Use UnlockMethodCache#canSkipBouncer in user switcher
repopick 258159 # frameworks: base: Port password retention feature
repopick 258180 # Fix Build Credentials refactored to use byte[]
repopick 258160 # LockSettingsService: Support for separate clear key api
repopick 256163 # Configurable 0, 90, 180 and 270 degree rotation
repopick 256164 # SystemUI: Fix toggling lockscreen rotation [1/3]
repopick 256186 # SystemUI: Add support for persistent usb drive notification.
repopick 256291 # Support enforcing a minimum delay between notification sounds of an app
repopick 257008 # SystemUI: Apply system_icons_keyguard_padding_end to parent view
repopick 256446 # SystemUI: Enable and fix QS detail view, adapt layout to Pie
repopick 256447 # SystemUI: Add Profiles tile
repopick 256448 # SystemUI: Advanced location tile
repopick 256831 # KernelCpuUidTimeReader: Decrease log level on eng builds
repopick 258225 # Camera: Add feature extensions
repopick 258303 # power: Re-introduce custom charging sounds
repopick 258301 # Forward port CM Screen Security settings (1/2)
repopick 258504 # frameworks: Add unlinked ringtone and notification volumes
repopick 258235 # Allow adjusting screen density to smaller sizes.
repopick 257151 # Camera: allow camera to use power key as shutter
repopick 258546 # Camera button support
repopick 257246 # fingerprint: handle PerformanceStats NULL pointers
#repopick 257247 # fingerprint: notify client when cancelling succeeded
repopick 258516 # fw/b: Add capability to allow tethering to use VPN upstreams
repopick 258517 # fw/b: Prevent trying to enable hw offload for tethering via VPN upstreams
repopick 258754 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 258803 # base: add Trust usb restrictor
repopick 258820 # SystemUI: Add visualizer feature
repopick 258826 # SystemUI: Dismiss keyguard on boot if disabled by current profile
repopick 258827 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
repopick 258853 # Add CHANNEL_MODE_DUAL_CHANNEL constant
repopick 258854 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
repopick 258855 # Allow SBC as HD audio codec in Bluetooth device configuration
repopick 259505 # SystemUI: Avoid adding useless empty quick settings page
repopick 259862 # SystemUI: runtime configurable audio panel location
repopick 255646 # Revert "DO NOT MERGE Remove Privacy Indicators"
repopick 255648 # Revert "DO NOT MERGE Revert "Adding the privacy chip to the CarStatusBar""
repopick 255649 # PrivacyItemController: Enable permission hub by default
repopick 256016 # Revert "Disable custom clock faces in SystemUI"
repopick 256015 # Revert "Disable ClockOptionsProvider so clocks don't appear in picker app"
repopick 255650 # Revert "Drop final remnants of Type clock face"
repopick 255647 # Revert "Drop Type clock face."
repopick 255651 # TypeClockController: Make it compile with new plugin API
repopick 256192 # [DNM] IS_DEBUGGABLE -> IS_ENG

# frameworks/native
repopick 258443 # sensorservice: Register orientation sensor if HAL doesn't provide it
repopick 258601 # sensorservice: customize sensor fusion mag filter via prop
repopick 259448 # libui: Allow invalid bits from callers conditionally

# hardware/broadcom/libbt
repopick 256552 # libbt: Add prepatch support
repopick 256553 # libbt: Only allow upio_start_stop_timer on 32bit arm
repopick 256554 # libbt: Add btlock support
repopick 256555 # libbt: Add support for using two stop bits
repopick 256556 # libbt-vendor: add support for samsung bluetooth
repopick 256559 # libbt: configure audio codec right after firmware

# hardware/broadcom/nfc
repopick 256312 # nfc: inform compilers of deliberate fallthrough
repopick 256313 # nfc: Deprecate register keyword

# hardware/interfaces
repopick 258181 # keymasterV4_0: Tags support for FBE wrapped key.

# hardware/lineage/interfaces
repopick 258215 # Initial dummy cryptfshw implementation
repopick 258828 # cryptfshw: Setup boilerplate items before actual implementation
repopick 258849 # cryptfshw: Split implementations into dlsym and ioctl
repopick 258850 # cryptfshw: ioctl: Wire up the implementation
repopick 258851 # cryptfshw: dlsym: Wire up the implementation
repopick 256420 # Initial audio amplifier HAL

# hardware/qcom/bootctrl
repopick 258221 # Build bootctrl.sdm710 with Android.bp.
repopick 258222 # Revert^2 "Build bootctrl.msm8998 with Android.bp.""
repopick 258243 # Build bootctrl.msm8996 with Android.bp.
repopick 258244 # Remove Android.mk rules for building bootctrl.

# hardware/qcom-caf/msm8974/display
repopick 256287 # display: inform compilers of deliberate switch fallthrough

# hardware/qcom-caf/msm8994/display
repopick 256209 # hwcomposer: Work around overzealous fortify checks
repopick 256881 # display: inform compilers of deliberate switch fallthrough
repopick 256882 # libhwcomposer: Indicate fall-through in toggleDynamicDebug()

# hardware/qcom-caf/msm8994/media
repopick 256875 # media: Fix compilation error for switch case

# hardware/qcom-caf/msm8998/audio
repopick 259810 # audio: Skip libhdmipassthru on OSS builds
repopick 259811 # ssr: Fix building with OSS materials
repopick 259812 # audio_extn/gef.c: Include pthread.h
repopick 259820 # hal: Add open source HAL for Elliptic Ultrasound

# hardware/qcom-caf/msm8998/display
repopick 259818 # Don't build lights module if vendor supplies it

# hardware/qcom-caf/msm8998/media
repopick 259814 # venc: Fix VQZip issue
repopick 259815 # media: Add extrapolated gpustats header for PQ
repopick 259819 # media: Don't link libgpustats

# hardware/qcom-caf/wlan
repopick 257200 # wcnss-service: Additional format support
repopick 257201 # wcnss: Build and dlopen wcnss_qmi_client as a shared library
repopick 257202 # wcnss_service: Deal with mdm-detect too
repopick 257203 # wifi-hal: Only try LOWI once
repopick 257204 # wifi-hal: stop the UMAC logspam
repopick 257205 # Wifi: Quiet some excessive debug output
repopick 257206 # Make wcnss_service build with the VNDK.
repopick 257207 # wifi-hal: Use generated kernel headers
repopick 257208 # Reading the serialno property is forbidden
repopick 257209 # wcnss-service: Opt-in to disable copying WCNSS_qcom_cfg.ini to userdata

# lineage-sdk
repopick 258333 # lineage-sdk: Bump PREF_HAS_MIGRATED_LINEAGE_SETTINGS for 17.0

# packages/apps/Bluetooth
repopick 258859 # SBC Dual Channel (SBC HD Audio) support
repopick 258860 # Assume optional codecs are supported if were supported previously

# packages/apps/Camera2
repopick 256641 # Don't attempt to convert degree to orientation enum twice
repopick 256642 # Camera2: Only autofocus before a snap if we are actually in "auto" mode.
repopick 256643 # Camera2: Remove settings preferences only once
repopick 256646 # Camera: Powerkey shutter (2/2)
repopick 256647 # Camera2: Add option to set max screen brightness
repopick 256648 # Camera2: Remove google help preference
repopick 256649 # Camera2: Fix Undo button behaviour
repopick 256650 # Fix crash if Exif-Tag buffer-length and component-count are both 0
repopick 256816 # BasicCameraFactory: check if continuous picture af is available before requesting it.
repopick 256817 # Request WRITE_EXTERNAL_STORAGE as well
repopick 256818 # Rework permissions request flow
repopick 256645 # Camera2: Request for ACCESS_FINE_LOCATION permission

# packages/apps/Contacts
repopick 256654 # Contacts: Enable support for device contact.
repopick 256655 # Place MyInfo shortcut on drawer
repopick 256656 # Place EmergencyInfo shortcut on drawer
repopick 256657 # Allow calling contacts via specific phone accounts.
#repopick 256658 # Contacts: use white nav bar

# packages/apps/DeskClock
repopick 256662 # DeskClock: Add back flip and shake actions
repopick 256663 # Provide upgrade path for cm-14.1 -> lineage-16.0
repopick 256664 # Make new menu entry to link to cLock widget settings.
repopick 256665 # DeskClock: Add support of power off alarm feature
repopick 256666 # DeskClock: Use POWER_OFF_ALARM permission

# packages/apps/Dialer
repopick 257131 # Dialer: handle database upgrade from cm-14.1
repopick 257132 # Dialer: disable anti-falsing for call answer screen
repopick 257113 # Revert "Remove dialer sounds and vibrations settings fragments and redirect to the system sound
repopick 257114 # Add back in-call vibration features
repopick 257115 # Allow using private framework API.
repopick 257133 # Re-add dialer lookup.
repopick 257118 # Generalize the in-call vibration settings category
repopick 257119 # Add setting to enable Do Not Disturb during calls
repopick 257134 # Re-add call recording.
repopick 257121 # Allow per-call account selection.
repopick 257122 # Re-add call statistics.
repopick 257135 # Control dialer's incoming call proximity sensor check via an overlay
repopick 257136 # Dialer: AudioModeProvider: use wired route for usb headsets

# packages/apps/Email
repopick 256675 # Email: handle databases from cm-14.1
repopick 256676 # Allow account deletion.
repopick 256677 # email: support for auto-sync multiple IMAP folders
repopick 256678 # email: Add an ActionBar to the mail app's PreferenceActivity
repopick 256679 # email: support per-folder notifications
repopick 256680 # Rewrite MailboxSettings loading logic.
repopick 256681 # email: fix eas autodiscover
repopick 256682 # Implement IMAP push using IMAP IDLE.
repopick 256683 # Request battery optimization exemption if IMAP IDLE is used.
repopick 256684 # Fix crash when attempting to view EML files.
repopick 256685 # Allow download of compressed attachments.
repopick 256686 # email: fix empty body update
repopick 256687 # Improve notification coalescence algorithm.
repopick 256688 # Email: Fix the ActivityNotFoundException when click "Update now"
repopick 256689 # Email: Clean duplicated WRITE_CONTACTS permission
repopick 256690 # email: return default folder name for subfolders
repopick 256691 # email: junk icon
repopick 256692 # Search in folder specified via URI parameter, if possible.
repopick 256693 # Remove max aspect ratio.
repopick 257358 # Fix Email tests on userdebug builds.
repopick 257359 # AOSP/Email -Added TEST_MAPPING file and "LOCAL_COMPATIBILITY_SUITE := ...
repopick 257360 # Remove build-time dep on opt-datetimepicker
repopick 257361 # Revert "Revert "AOSP/Email - Changes for code to work with UnifiedEmail's ...
repopick 257362 # Revert "Revert "AOSP/Email - Bump targetSdkVersion to 28.""
#repopick 257363 # AOSP/Email - Bump version number to 28 in the XML file.
#repopick 257364 # AOSP/Email - Bumped version number to 28. Disabled notifications, uifolders ...
#repopick 257365 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...

# packages/apps/Exchange
repopick 257297 # Exchange: Migrate to androidx

# packages/apps/LineageParts
repopick 256409 # LineageParts: Reenable DisplayRotation
repopick 258825 # LineageParts: Reenable system profiles

# packages/apps/Messaging
repopick 256720 # Messaging: Fix generating id in android namespace
repopick 257324 # AOSP/Messaging - Update the Messaging version to 24 until notification related logic changes are made. Fixes the error "Developer warning for package com.android. messaging failed to post notification on channel null".
repopick 257325 # AOSP/Messaging - Remove TEST_MAPPING because presubmit tests fail on build_target: aosp_cf_x86_phone-userdebug
repopick 257326 # AOSP/Messaging - Moved LOCAL_COMPATIBILITY_SUITE to tests/Android.mk. + Deleted the unnecessary blankId check. Updated the TODO comment for NUM_TEST_CONVERSATIONS+4. + Added AndroidTest.xml + Added "LOCAL_PROGUARD_ENABLED := disabled" for tests to pass on cf.
repopick 257327 # AOSP/Messaging - Fix many improperly formatted resource strings in Messaging.
repopick 257328 # Fix X-Mms-Transaction-ID of M-Acknowledge.ind
repopick 257329 # Fix SMS status handling
repopick 257330 # Use correct format info for SMS
repopick 257331 # Fix MMS Config issues in Debug menu
repopick 257332 # Fix assertion failures caused by different instance type
repopick 257333 # Fix wrong PreferenceCategory for SMS delivery report
repopick 257334 # Apply new duplication detection logic for M-Notification.ind
repopick 257335 # Replace no error code '0' for SMS with '-1'
repopick 257336 # Fix GetOrCreateConversationActionTest failure
repopick 257337 # Sort ParticipantsData in order of the slot id
repopick 257338 # Ignore unexpected ACTION_DOWN for SIM avatar icons
repopick 257339 # Fix FATAL EXCEPTION on SmsStorageLowWarningActivity
repopick 257340 # Move Messaging to /product
repopick 257341 # Move libgiftranscode.so to /product
repopick 256696 # Messaging: define app category
repopick 256697 # Messaging: adaptive icon
repopick 256698 # Messaging: Implement option for swipe right to delete.
repopick 256699 # Messaging: change Avatar fontFamily to sans-serif-medium
repopick 256700 # MessageQueue: Process pending messages per subscription
repopick 256701 # Messaging: Toggable keyboard emoticons access
repopick 256702 # Fix menu item highlight color.
repopick 256704 # Messaging: bring back accent color
repopick 256705 # Messaging: Implement saved video attachments in MMS
repopick 256706 # Play an audible notification on receiving a class zero message.
repopick 256707 # Added support for video and audio mms attachments
repopick 256708 # Fixed storage permission issue for attachments
repopick 256709 # Messaging app crashes after a few MMS
repopick 256711 # Messaging: fix bad recycle on sending two mms in a row
repopick 256712 # MediaPicker: Check for NPE
repopick 256713 # Messaging: Don't crash on unsupported shared content type
repopick 256714 # Messaging: Fix crash of blocked participant list activity
repopick 256715 # Messaging: Add "Mark as read" quick action for message notifications
repopick 256716 # Allow intent shared subject or title to be mms subject
repopick 256718 # Messaging: use white nav bar
repopick 257342 # Don't build with platform certificate
repopick 257343 # Messaging: Implement per conversation channels

# packages/apps/Nfc
repopick 256814 # NFCService: Add sysprop to prevent FW download during boot with NFC off.
repopick 257348 # NFC: Restore legacy NXP stack
repopick 257349 # nxp: jni: Forward-port the stack sources
repopick 257350 # nxp: NativeNfcManager: Implement missing inherited abstract methods
repopick 257351 # nxp: jni: use proper nativehelper headers
repopick 257352 # nxp: jni: Remove unused variables and functions
repopick 257353 # nxp: jni: Implement AOSP P abstract methods
repopick 258124 # nxp: Q api updates

# packages/apps/PackageInstaller
repopick 255658 # Revert "Remove Permissions Hub."
repopick 255659 # PermissionController: Enable permission hub by default

# packages/apps/Settings
repopick 258518 # Settings: Add hotspot setting to allow VPN upstreams
repopick 256290 # Settings: Add setup UI for minimum delay between an app's notification sounds
repopick 258501 # Settings: Add switch for linked ring and media notification volumes
repopick 258502 # Settings: Use correct icon for ring volume
repopick 258500 # Settings: Add back increasing ring feature (2/2).
repopick 258299 # Settings: forward port lock pattern grid size (2/2)
repopick 258300 # Settings: Forward port pattern visibility settings (2/2)
repopick 256162 # Settings: Add rotation settings
repopick 258304 # Settings: Add LineageParts charging sound settings preference
repopick 258819 # Settings: Add lockscreen visualizer toggle
repopick 258856 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
#repopick 259315 # One does not simply become a Developer
repopick 259319 # Allow sorting Applications by size
repopick 259361 # Settings: fix apn_editor carrier_enabled summaryOff string
repopick 259362 # Settings: Fix the failing strings

# packages/apps/SetupWizard
repopick 257058 # Update for Q setup library changes
repopick 257064 # Add new method from ICaptivePortal
repopick 257065 # Account for PhoneMonitor API change

# packages/apps/ThemePicker
repopick 256017 # ThemePicker: Properly update clock face setting

# packages/apps/Trebuchet
repopick 256018 # Revert "[DO NOT MERGE] Disable swipe down to pull noti shade for Q"
repopick 256019 # Launcher3: Export GridOptionsProvider
repopick 259724 # Launcher3: Fix launcher preview rendering

# packages/apps/UnifiedEmail
repopick 256727 # unified email: prefer account display name to sender name
repopick 256728 # email: fix back button
repopick 256729 # unified-email: check notification support prior to create notification objects
repopick 256730 # unified-email: respect swipe user setting
repopick 256731 # email: linkify urls in plain text emails
repopick 256732 # email: do not close the input attachment buffer in Conversion#parseBodyFields
repopick 256733 # email: linkify phone numbers
repopick 256734 # Remove obsolete theme.
repopick 256735 # Don't assume that a string isn't empty
repopick 256736 # Add an ActionBar to the mail app's PreferenceActivity.
repopick 256737 # email: allow move/copy operations to more system folders
repopick 256738 # unifiedemail: junk icon
repopick 256739 # Remove mail signatures from notification text.
repopick 256740 # MimeUtility: ensure streams are always closed
repopick 256741 # Fix cut off notification sounds.
repopick 256742 # Pass selected folder to message search.
repopick 256743 # Properly close body InputStreams.
repopick 256744 # Make navigation drawer extend over status bar.
repopick 256745 # Disable animations for translucent activities.
repopick 256746 # Don't re-show search bar on query click.
repopick 257366 # Fix UnifiedEmail tests on userdebug builds.
repopick 257367 # AOSP/UnifiedEmail -  Fix improperly formatted resource strings in UnifiedEmail.
repopick 257368 # Remove build-time dep on opt-datetimepicker
repopick 257369 # Import translations. DO NOT MERGE]
repopick 257370 # Revert "Revert "AOSP/UnifiedEmail - Bumped the targetSdkVersion to 28 ...
#repopick 257371 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...

# packages/providers/ContactsProvider
repopick 256773 # ContactsProvider: Prevent device contact being deleted.
repopick 256774 # CallLogDatabase: Try to re-run the version 5 upgrade path

# packages/providers/TelephonyProvider
repopick 256780 # TelephonyProvider: add upgrade support from cm-14.1

# packages/services/Telecomm
repopick 258503 # Add back increasing ring feature (1/2).
repopick 256161 # Telecomm: Make sensitive phone numbers not to be shown in call log history.
repopick 256265 # CallLog: Take into account multiple SIMs for sensitive numbers

# packages/services/Telephony
repopick 256792 # Telephony: Add ERI configuration for U.S. Cellular
repopick 256793 # Telephony: Support muting by RIL command
repopick 256794 # Fix non-protected broadcasts sent from phone process.
repopick 256795 # Don't start SIP service before decrypted
repopick 256797 # Allow to disable the new scan API for manual network search.

# system/bt
repopick 258857 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
repopick 258858 # Explicit SBC Dual Channel (SBC HD) support

# system/core
repopick 258166 # Add wrapped key support
repopick 255932 # adb: Add wait-for-online command
repopick 256219 # utils: Threads: Handle empty thread names
repopick 256823 # Camera: Add feature extensions
repopick 259414 # reboot: mark as recovery_available
repopick 259650 # Make adb use a custom prop for adb root

# system/netd
repopick 256959 # netd: Allow devices to force-add directly-connected routes

# system/update_engine
repopick 259363 # Move performance mode to top app

# system/vold
repopick 258131 # vold: Add Hardware FDE feature
repopick 258132 # system: vold: Remove crypto block device creation
repopick 258133 # vold: Wrapped key support for FBE
repopick 258134 # vold: Use separate flag for wrappedkey
repopick 258135 # Remove no longer relevant header file
repopick 258136 # vold: add support for clear key
repopick 258137 # Fix for CTS test CtsAppSecurityHostTestCases
repopick 258138 # vold: fix build error
repopick 258139 # vold: change to upgrade key if export fails
repopick 258141 # system: vold: fix block disk encryption to work with metadata encryption
repopick 258145 # Updates for migrated code upstream
repopick 258147 # system: vold: Close crypto block device if it was created
repopick 258148 # system: vold: pass proper extra params to load crypto device
repopick 258140 # system: vold: Use wrapped key for metadata encryption
repopick 258149 # [automerger] vold: resolve crypto device creation failure with dm-crypt skipped: 4b5c1b2db2
repopick 258150 # system: vold: Use ICE for UFS card
repopick 258151 # vold: Move QCOM HW FDE inclusion under Lineage namespace
repopick 258169 # vold: add support for more filesystems for public storage
repopick 258170 # vold: Fix fsck on public volumes
repopick 258171 # vold: Support internal storage partitions
repopick 258172 # vold: Honor mount options for ext4/f2fs partitions
repopick 258173 # vold: Mount ext4/f2fs portable storage with sdcard_posix
repopick 258174 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
repopick 258175 # Fix the group permissions of the sdcard root.
repopick 258176 # vold: skip first disk change when converting MBR to GPT
repopick 258177 # vold: Allow reset after shutdown
repopick 258178 # vold: Accept Linux GPT partitions on external SD cards
repopick 258179 # Add "changepw" command to vdc.

# vendor/lineage
repopick 259981 # Revert "soong_config: Add flag for legacy HW FDE"
repopick 256960 # soong_config: add TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE
repopick 259310 # prebuilt: Add a script to simplify A-only recovery system mount
repopick 257000 # Remove apicheck.mk
repopick 258774 # extract_files: Add initial blueprint creation
repopick 258775 # extract_files: Implement blueprint file generation
repopick 255667 # adb insecure by default

# vendor/codeaurora/telephony
repopick 257215 # Revert "IMS-VT: Low battery handling for Video calls"

# vendor/qcom/opensource/interfaces
#repopick 259980 # interfaces: Introduce qcom bluetooth_audio and btconfigstore HALs
