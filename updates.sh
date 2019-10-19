#!/bin/bash

set -e
source build/envsetup.sh

# art
changes=(
259265 # Revert "ART: Add version check for memfd_create()"
)
repopick ${changes[@]}&

# bionic
changes=(
256150 # bionic: Use legacy pthread_mutex_init() behavior on pre-P API levels
256151 # Actually restore pre-P mutex behavior
)
repopick ${changes[@]}&

# bootable/recovery
changes=(
255846 # recovery: Allow custom bootloader msg offset in block misc
255847 # recovery: wipe bootloader message from index 0 when using custom offsets
255990 # recovery: Remove HOST_OS guard for f2fs tools
255830 # Make adb use a custom prop for adb root
255831 # recovery: Get a proper shell environment in recovery
255832 # recovery: ui: Default to touch enabled
255833 # recovery: ui: Minor cleanup for touch code
255992 # recovery: ui: Support hardware virtual keys
259434 # recovery: Puke out an /etc/fstab so stuff like busybox/toybox is happy
256010 # recovery: Include vendor init trigger
259546 # recovery: Allow device-specific recovery modules
259547 # recovery: Blank screen during shutdown and reboot
259720 # recovery: sdcard is data/media/0
259629 # recovery: Provide caching for sideload files
259548 # recovery: Provide sideload cancellation
259823 # otautil: add support for unmounting entire volumes
259642 # recovery: Add wipe system partition option
259643 # recovery: Remove "Supported API" message
259644 # recovery: Enable the menu for User builds
259645 # recovery: init: mount pstore fs
259646 # recovery: Expose reboot to recovery option
259647 # recovery: Only show tests in eng builds
259648 # recovery: Also hide rescue mode from non eng builds
259649 # recovery: Blank screen on init
255979 # recovery: symlink /sbin for script compatibility
259738 # recovery: Allow bypassing signature verification on non-release builds
259748 # recovery: Add runtime checks for A/B vs traditional updates
)
repopick ${changes[@]}&

# build/blueprint
changes=(
259301 # Make off-the-shelf order funcs public.
)
repopick ${changes[@]}&

# build/make
changes=(
257172 # releasetools: squash backuptool support
257177 # releasetools: Use the first entry of a mount point when reading fstab
259308 # build: Force system-as-root layout for backuptool
259309 # releasetools: Implement system-mount script to support any recovery system mount
257166 # build: recovery: Support adding device-specific items
257167 # build: Separate commands in recovery foreach loops
257168 # Allow setting the recovery density separately from the aapt config
257170 # build: Never set persist.sys.usb.config=none in recovery
257173 # Edify: Add abort message for bootloader asserts
257174 # releasetools: support reading release keys out of some sort of command
257175 # releasetools: Add script to sign zips
257176 # releasetools: Store the build.prop file in the OTA zip
257178 # build: allow forcing build of otatools
257099 # Make PRODUCT_BUILD_PROP_OVERRIDES bit more powerful
260346 # build: Remove su inclusion
)
repopick ${changes[@]}&

# build/soong
changes=(
256886 # soong: Add function to return camera parameters library name
259286 # Add android_app_import.
259287 # uncompressedDex option for android_app_import.
259288 # Implement DPI variants in android_app_import.
259289 # androidmk conversion logic for android_app_import
259290 # Improve android_app_import.dpi_variants handling.
259291 # Add filename property to android_app_import
259292 # Add arch variant support to android_app_import.
259293 # Add default_dev_cert to android_app_import
259511 # New AndroidMk authoring system based on entry map.
259512 # Add data property to sh_test.
259513 # Add sh_test_host.
259514 # Add overrides property to prebuilt_apex
259515 # AndroidMkEntries minor refactoring.
259516 # Comment out broken android_app_imports tests
261076 # soong: Give priority to modules in exported namespaces for bootjars
)
repopick ${changes[@]}&

# device/lineage/sepolicy
changes=(
259727 # sepolicy: vendor: Migrate to power 1.2
257053 # sepolicy: Make recovery permissive
261929 # sepolicy: Allow Snap to execute bcc
257100 # [DND] Kill su
)
repopick ${changes[@]}&

# device/qcom/sepolicy/legacy-um
changes=(
259422 # sepolicy: Fix video4linux "name" node labeling
259423 # sepolicy: Allow mm-qcamerad to access v4L "name" node
259424 # common: Fix labelling of lcd-backlight
259425 # msm8996: Consider additional ssr nodes
259426 # sepolicy: Label persist partition for all SoCs
259427 # sepolicy: allow vold to read persist dirs
261035 # msm8998: Label usbpd sysfs
261036 # msm8998: Label LED sysfs
261037 # sepolicy: setting secontext to rtc node
261038 # sepolicy: label persist.vendor.bluetooth.a4wp
261039 # common: Label persist.vendor.camera.debug.logfile
#261784 # common: Correctly Label /sys/class/kgsl
#261785 # common: Fix sysfs_socinfo Label for sensors
)
repopick ${changes[@]}&

# external/mksh
changes=(
259638 # mksh: Mark mkshrc as recovery_available
)
repopick ${changes[@]}&

# external/tinyalsa
changes=(
260543 # Mark tinymix/tinyplay as vendor_available
)
repopick ${changes[@]}&

# external/tinycompress
changes=(
256308 # tinycompress: Enable extended compress format
)
repopick ${changes[@]}&

# frameworks/av
changes=(
256899 # camera: Allow devices to load custom CameraParameter code
258224 # Camera: Add extensions to CameraClient
258437 # Camera: Add support for preview frame fd
258439 # stagefright: add changes related to high-framerates in CameraSource
258812 # CameraService: Support hooks for motorized camera
259987 # audiopolicy: support extended feature in audiopolicymanager
260580 # Camera: CameraHardwareInterface changes to support Extended FD
260581 # Camera: Miscellaneous fixes in QDataCallback and binder death scenarios.
260582 # camera: Only link and use vendor.qti.hardware.camera.device if specified
)
repopick ${changes[@]}&

# frameworks/base
changes=(
#258530 # Use UnlockMethodCache#canSkipBouncer in user switcher
258159 # frameworks: base: Port password retention feature
258180 # Fix Build Credentials refactored to use byte[]
258160 # LockSettingsService: Support for separate clear key api
256163 # Configurable 0, 90, 180 and 270 degree rotation
256164 # SystemUI: Fix toggling lockscreen rotation [1/3]
256446 # SystemUI: Enable and fix QS detail view, adapt layout to Pie
256447 # SystemUI: Add Profiles tile
256448 # SystemUI: Advanced location tile
256831 # KernelCpuUidTimeReader: Decrease log level on eng builds
258225 # Camera: Add feature extensions
258303 # power: Re-introduce custom charging sounds
258546 # Camera button support
257246 # fingerprint: handle PerformanceStats NULL pointers
258754 # Keyguard: Allow disabling fingerprint wake-and-unlock
257247 # fingerprint: notify client when cancelling succeeded
258753 # FingerprintService: add overlay to prevent cleanup of unused fingerprints
#thank aviraxp for using web UI to pick commits and not putting them in chain...
#260295 # PackageManager: allow build-time disabling of components
258820 # SystemUI: Add visualizer feature
258826 # SystemUI: Dismiss keyguard on boot if disabled by current profile
258827 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
258853 # Add CHANNEL_MODE_DUAL_CHANNEL constant
258854 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
258855 # Allow SBC as HD audio codec in Bluetooth device configuration
259983 # Merge changes for launching wifidisplay from system settings
259984 # WiFiDisplayController: Defer the P2P Initialization from its constructor.
259985 # WifiDisplayController: handle preexisting p2p connection status
259458 # storage: Do not notify for volumes on non-removable disks
260002 # fw/b: Squash of app fw restriction commits
261314 # Allow override of DUN settings
255646 # Revert "DO NOT MERGE Remove Privacy Indicators"
255648 # Revert "DO NOT MERGE Revert "Adding the privacy chip to the CarStatusBar""
255649 # PrivacyItemController: Enable permission hub by default
256016 # Revert "Disable custom clock faces in SystemUI"
256015 # Revert "Disable ClockOptionsProvider so clocks don't appear in picker app"
255650 # Revert "Drop final remnants of Type clock face"
255647 # Revert "Drop Type clock face."
255651 # TypeClockController: Make it compile with new plugin API
256192 # [DNM] IS_DEBUGGABLE -> IS_ENG
)
repopick ${changes[@]}&

# frameworks/native
changes=(
258443 # sensorservice: Register orientation sensor if HAL doesn't provide it
258601 # sensorservice: customize sensor fusion mag filter via prop
259448 # libui: Allow invalid bits from callers conditionally
261898 # input: Adjust priority
)
repopick ${changes[@]}&

# frameworks/opt/net/wifi
changes=(
260004 # WiFi: Ignore connectivity scans during WFD session
261857 # wifi: Not reset country code for Dual SIM if any slot is active
)
repopick ${changes[@]}&

# hardware/broadcom/libbt
changes=(
261899 # correct WBS config VSC params
)
repopick ${changes[@]}&

# hardware/interfaces
changes=(
258181 # keymasterV4_0: Tags support for FBE wrapped key.
260578 # Camed HAL extension: Added support in HIDL for Extended FD.
260579 # camera: Only link and use vendor.qti.hardware.camera.device if specified
)
repopick ${changes[@]}&

# hardware/libhardware
changes=(
256912 # audio: Add audio amplifier HAL
)
repopick ${changes[@]}&

# hardware/lineage/interfaces
changes=(
258215 # Initial dummy cryptfshw implementation
260411 # cryptfshw: Introduce qti backend implementation
260069 # wifi: Disable softAP MAC randomization by default
)
repopick ${changes[@]}&

# hardware/qcom/data/ipacfg-mgr
changes=(
261831 # Kernel Header Changes
261832 # ipacfg-mgr: Use generated kernel headers
)
repopick ${changes[@]}&

# hardware/qcom/keymaster
changes=(
260415 # keymaster: Reverse wait for qsee flag
)
repopick ${changes[@]}&

# hardware/qcom-caf/msm8996/audio
changes=(
260609 # audio: Fix complilation errors under Clang
260610 # audio: Fix flac offload not working
260613 # audio: Extend platform parser to allow device name aliasing
260615 # hal: Add open source HAL for Elliptic Ultrasound
260616 # audio: Use libprocessgroup unconditionally
260617 # audio: Use normal tinycompress
261894 # Build audio.primary.* with BOARD_VNDK_VERSION
)
repopick ${changes[@]}&

# hardware/qcom-caf/msm8996/display
changes=(
261895 # hwc: Set ioprio for vsync thread
)
repopick ${changes[@]}&

# hardware/qcom-caf/msm8998/display
changes=(
261897 # hwc: Set ioprio for vsync thread
)
repopick ${changes[@]}&

# lineage-sdk
changes=(
258333 # lineage-sdk: Bump PREF_HAS_MIGRATED_LINEAGE_SETTINGS for 17.0
259996 # lineage-sdk: Update path to ChargingStarted.ogg
)
repopick ${changes[@]}&

# packages/apps/AudioFX
changes=(
261313 # AudioFX: Add support for usb headset devices
)
repopick ${changes[@]}&

# packages/apps/Bluetooth
changes=(
258859 # SBC Dual Channel (SBC HD Audio) support
258860 # Assume optional codecs are supported if were supported previously
)
repopick ${changes[@]}&

# packages/apps/Contacts
changes=(
256654 # Contacts: Enable support for device contact.
256655 # Place MyInfo shortcut on drawer
256656 # Place EmergencyInfo shortcut on drawer
256657 # Allow calling contacts via specific phone accounts.
#256658 # Contacts: use white nav bar
)
repopick ${changes[@]}&

# packages/apps/DeskClock
changes=(
256663 # Provide upgrade path for cm-14.1 -> lineage-16.0
256664 # Make new menu entry to link to cLock widget settings.
)
repopick ${changes[@]}&

# packages/apps/Dialer
changes=(
257131 # Dialer: handle database upgrade from cm-14.1
257132 # Dialer: disable anti-falsing for call answer screen
257113 # Revert "Remove dialer sounds and vibrations settings fragments and redirect to the system sound
257114 # Add back in-call vibration features
257115 # Allow using private framework API.
257133 # Re-add dialer lookup.
257118 # Generalize the in-call vibration settings category
257119 # Add setting to enable Do Not Disturb during calls
257134 # Re-add call recording.
257121 # Allow per-call account selection.
257122 # Re-add call statistics.
257135 # Control dialer's incoming call proximity sensor check via an overlay
257136 # Dialer: AudioModeProvider: use wired route for usb headsets
)
repopick ${changes[@]}&

# packages/apps/Email
changes=(
256675 # Email: handle databases from cm-14.1
256676 # Allow account deletion.
256677 # email: support for auto-sync multiple IMAP folders
256678 # email: Add an ActionBar to the mail app's PreferenceActivity
256679 # email: support per-folder notifications
256680 # Rewrite MailboxSettings loading logic.
256681 # email: fix eas autodiscover
256682 # Implement IMAP push using IMAP IDLE.
256683 # Request battery optimization exemption if IMAP IDLE is used.
256684 # Fix crash when attempting to view EML files.
256685 # Allow download of compressed attachments.
256686 # email: fix empty body update
256687 # Improve notification coalescence algorithm.
256688 # Email: Fix the ActivityNotFoundException when click "Update now"
256689 # Email: Clean duplicated WRITE_CONTACTS permission
256690 # email: return default folder name for subfolders
256691 # email: junk icon
256692 # Search in folder specified via URI parameter, if possible.
256693 # Remove max aspect ratio.
257358 # Fix Email tests on userdebug builds.
257359 # AOSP/Email -Added TEST_MAPPING file and "LOCAL_COMPATIBILITY_SUITE := ...
257360 # Remove build-time dep on opt-datetimepicker
257361 # Revert "Revert "AOSP/Email - Changes for code to work with UnifiedEmail's ...
257362 # Revert "Revert "AOSP/Email - Bump targetSdkVersion to 28.""
#257363 # AOSP/Email - Bump version number to 28 in the XML file.
#257364 # AOSP/Email - Bumped version number to 28. Disabled notifications, uifolders ...
#257365 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...
)
repopick ${changes[@]}&

# packages/apps/Exchange
changes=(
257297 # Exchange: Migrate to androidx
)
repopick ${changes[@]}&

# packages/apps/Gallery2
changes=(
260784 # Revert "fix toolbar is overlaid on ni-co-bar"
260785 # Fix ProGuard error.
260786 # Float.NaN != ... always evaluates to true, use Float.isNaN.
260787 # Fix misc-macro-parentheses warnings in Gallery2.
260788 # Add missing includes.
260789 # Revert "Fix compiling errors in P"
260790 # Stop using junit classes in production
260791 # Gallery2: Fix NaN comparisons
260792 # Gallery2: Fix CollectionIncompatibleType
260793 # Rename android.utils.Pools to com.android.photos.util.Pools
260794 # Fix build Gallery2
260795 # Use explicit support library prebuilts
260796 # Fix proguard failure when using javac
260797 # Fix makefile include for support-v4
260798 # Fix build with proguard
260799 # Use -Werror in packages/apps/Gallery2
260800 # Move Gallery2 over to AAPT2 and new v4 modules
260801 # Gallery2: Remove slideshow option if there are only videos
260802 # Gallery2: Support GIF animation
260803 # SnapdragonGallery: Fix FC when init() before setContentView
260804 # SnapdragonGallery: Fix dialog dismiss when home
260805 # SnapdragonGallery: Fix crash show dialog when activity finished
260806 # Don't show Camera Icon when no pictures found in Albums
260807 # SDGallery:Fix monkey FC when url from pick activity is null
260808 # Fix FC of parsing uri is null
260809 # Fix the issue of view don't reload when onPause
260810 # Add new rule about watermark
260811 # Rename app back to Gallery
260812 # FaceDetect: Catch linker errors during initialization
260813 # Gallery: TileImageView: fix NPE
260814 # Gallery2: Bump minsdk and targetsdk version
260815 # Gallery2: Try to open existing camera
260816 # Gallery2: Fix crash of gallery on showing details
260817 # Gallery2: Add record time to details view
260818 # Gallery2: Store DATE_TAKEN as milliseconds
260819 # Gallery2: Reduce logspam in video player
260821 # Gallery2: Make sure no NPE happens
260822 # Gallery2: Change all share intents to chooser style
260823 # Gallery2: Properly declare the own permissions
260824 # Gallery2: Update theme
260825 # Gallery2: Update menu
260826 # Gallery: define app category
260827 # Gallery: adaptive-icon
260828 # Gallery: use platform cert
260829 # Gallery2: Remove CAF translations
260830 # Gallery2: Modify AOSP EL translations
260831 # Gallery2: Move & improve CAF strings
260832 # Gallery2: Replace hamburger menu with bottom bar
260833 # Gallery2: Disable dummy starting window
260834 # Gallery2: Everyone or no one
260835 # Gallery2: Fix up audio effects dialog
260836 # Gallery2: Remove 3D overscroll effect
260837 # Gallery2: Enable frames in the editor
260838 # Gallery2: Support the newly added media file types in MTP mode
260839 # Gallery2: Increase the size of the tiles when decoding images
260840 # Gallery2: Fix views overlap
260841 # Gallery2: Fix potential crash
260842 # Gallery2: Fix various issues and glitches
260843 # Gallery: Kill media effect dialog on movies
260844 # Gallery2: Get rid of packages monitor
260845 # Fix can't enable speaker with bluetooth headset
260846 # Move Gallery2 to androidx.
260847 # Gallery2: Migrate remaining bits to AndroidX
261044 # Rename language+country resources to just language
261045 # Sync translations with AOSP
261046 # Move Gallery2 and its libs to /product
261047 # Add default code reviewers into OWNERS
)
repopick ${changes[@]}&

# packages/apps/LineageParts
changes=(
256409 # LineageParts: Reenable DisplayRotation
258825 # LineageParts: Reenable system profiles
260416 # Parts: Convert charging sound path to uri
260782 # LineageParts: Migrate to Android.bp
)
repopick ${changes[@]}&

# packages/apps/Messaging
changes=(
256720 # Messaging: Fix generating id in android namespace
257324 # AOSP/Messaging - Update the Messaging version to 24 until notification related logic changes are made. Fixes the error "Developer warning for package com.android. messaging failed to post notification on channel null".
257325 # AOSP/Messaging - Remove TEST_MAPPING because presubmit tests fail on build_target: aosp_cf_x86_phone-userdebug
257326 # AOSP/Messaging - Moved LOCAL_COMPATIBILITY_SUITE to tests/Android.mk. + Deleted the unnecessary blankId check. Updated the TODO comment for NUM_TEST_CONVERSATIONS+4. + Added AndroidTest.xml + Added "LOCAL_PROGUARD_ENABLED := disabled" for tests to pass on cf.
257327 # AOSP/Messaging - Fix many improperly formatted resource strings in Messaging.
257328 # Fix X-Mms-Transaction-ID of M-Acknowledge.ind
257329 # Fix SMS status handling
257330 # Use correct format info for SMS
257331 # Fix MMS Config issues in Debug menu
257332 # Fix assertion failures caused by different instance type
257333 # Fix wrong PreferenceCategory for SMS delivery report
257334 # Apply new duplication detection logic for M-Notification.ind
257335 # Replace no error code '0' for SMS with '-1'
257336 # Fix GetOrCreateConversationActionTest failure
257337 # Sort ParticipantsData in order of the slot id
257338 # Ignore unexpected ACTION_DOWN for SIM avatar icons
257339 # Fix FATAL EXCEPTION on SmsStorageLowWarningActivity
257340 # Move Messaging to /product
257341 # Move libgiftranscode.so to /product
256696 # Messaging: define app category
256697 # Messaging: adaptive icon
256698 # Messaging: Implement option for swipe right to delete.
256699 # Messaging: change Avatar fontFamily to sans-serif-medium
256700 # MessageQueue: Process pending messages per subscription
256701 # Messaging: Toggable keyboard emoticons access
256702 # Fix menu item highlight color.
256704 # Messaging: bring back accent color
256705 # Messaging: Implement saved video attachments in MMS
256706 # Play an audible notification on receiving a class zero message.
256707 # Added support for video and audio mms attachments
256708 # Fixed storage permission issue for attachments
256709 # Messaging app crashes after a few MMS
256711 # Messaging: fix bad recycle on sending two mms in a row
256712 # MediaPicker: Check for NPE
256713 # Messaging: Don't crash on unsupported shared content type
256714 # Messaging: Fix crash of blocked participant list activity
256715 # Messaging: Add "Mark as read" quick action for message notifications
256716 # Allow intent shared subject or title to be mms subject
256718 # Messaging: use white nav bar
257342 # Don't build with platform certificate
257343 # Messaging: Implement per conversation channels
)
repopick ${changes[@]}&

# packages/apps/Nfc
changes=(
256814 # NFCService: Add sysprop to prevent FW download during boot with NFC off.
260063 # NfcNci: make T3T/Nfc-F HCE optional
)
repopick ${changes[@]}&

# packages/apps/PackageInstaller
changes=(
255658 # Revert "Remove Permissions Hub."
255659 # PermissionController: Enable permission hub by default
)
repopick ${changes[@]}&

# packages/apps/Settings
changes=(
256162 # Settings: Add rotation settings
258304 # Settings: Add LineageParts charging sound settings preference
258819 # Settings: Add lockscreen visualizer toggle
258856 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
#259315 # One does not simply become a Developer
259459 # storage: Do not allow eject for volumes on non-removable disks
259455 # Settings: per-app cellular data, vpn and wifi restrictions
261351 # Settings: Fix QrCamera crash on devices without flash
261364 # Settings: Use landscape qrcode scanner layout for sw600dp
)
repopick ${changes[@]}&

# packages/apps/SetupWizard
changes=(
257065 # Account for PhoneMonitor API change
)
repopick ${changes[@]}&

# packages/apps/ThemePicker
changes=(
256017 # ThemePicker: Properly update clock face setting
)
repopick ${changes[@]}&

# packages/apps/Trebuchet
changes=(
256018 # Revert "[DO NOT MERGE] Disable swipe down to pull noti shade for Q"
256019 # Launcher3: Export GridOptionsProvider
259724 # Launcher3: Fix launcher preview rendering
260127 # Trebuchet: update build configs
260128 # Create LineageLauncher
260129 # Launcher3: Google Feed integration
260130 # Launcher3: exclude from recents
260131 # Launcher3: No Calendarwidget 4x4 widget displayed
260132 # Launcher3: Stability NullPointer issue
260133 # Workspace: Allow resizing any widget
260134 # PagedView: fix pointer index out of range
260135 # Launcher3: Can't search out local app by Chinese
260136 # DeviceProfile: fix divide by zero
260137 # Provider: Initialize createEmptyRowOnFirstScreen without QSB
260138 # config: enable LAUNCHER3_PROMISE_APPS_IN_ALL_APPS
260139 # proguard: Also keep FixedScaleDrawable
260145 # Change app name to Trebuchet
260141 # Trebuchet: adaptive icon
260142 # Trebuchet: Bump min SDK to 26 as required for adaptive icons
260143 # Trebuchet: prefer our wallpaper picker if possible
260144 # Trebuchet: Hide Notification Dots on low RAM devices
260319 # Trebuchet: Update default workspace
260320 # Change icon drawable padding
260321 # Disable QSB on first screen by default
260322 # QSB: request round search bar
)
repopick ${changes[@]}&

# packages/apps/UnifiedEmail
changes=(
256727 # unified email: prefer account display name to sender name
256728 # email: fix back button
256729 # unified-email: check notification support prior to create notification objects
256730 # unified-email: respect swipe user setting
256731 # email: linkify urls in plain text emails
256732 # email: do not close the input attachment buffer in Conversion#parseBodyFields
256733 # email: linkify phone numbers
256734 # Remove obsolete theme.
256735 # Don't assume that a string isn't empty
256736 # Add an ActionBar to the mail app's PreferenceActivity.
256737 # email: allow move/copy operations to more system folders
256738 # unifiedemail: junk icon
256739 # Remove mail signatures from notification text.
256740 # MimeUtility: ensure streams are always closed
256741 # Fix cut off notification sounds.
256742 # Pass selected folder to message search.
256743 # Properly close body InputStreams.
256744 # Make navigation drawer extend over status bar.
256745 # Disable animations for translucent activities.
256746 # Don't re-show search bar on query click.
257366 # Fix UnifiedEmail tests on userdebug builds.
257367 # AOSP/UnifiedEmail -  Fix improperly formatted resource strings in UnifiedEmail.
257368 # Remove build-time dep on opt-datetimepicker
257369 # Import translations. DO NOT MERGE]
257370 # Revert "Revert "AOSP/UnifiedEmail - Bumped the targetSdkVersion to 28 ...
#257371 # AOSP/Email and AOSP/UnfiedEmail - Added back call to uiaccounts. + Added ...
)
repopick ${changes[@]}&

# packages/providers/ContactsProvider
changes=(
256773 # ContactsProvider: Prevent device contact being deleted.
256774 # CallLogDatabase: Try to re-run the version 5 upgrade path
)
repopick ${changes[@]}&

# packages/providers/TelephonyProvider
changes=(
256780 # TelephonyProvider: add upgrade support from cm-14.1
)
repopick ${changes[@]}&

# packages/services/Telecomm
changes=(
256161 # Telecomm: Make sensitive phone numbers not to be shown in call log history.
256265 # CallLog: Take into account multiple SIMs for sensitive numbers
)
repopick ${changes[@]}&

# packages/services/Telephony
changes=(
256792 # Telephony: Add ERI configuration for U.S. Cellular
256793 # Telephony: Support muting by RIL command
256794 # Fix non-protected broadcasts sent from phone process.
256795 # Don't start SIP service before decrypted
256797 # Allow to disable the new scan API for manual network search.
)
repopick ${changes[@]}&

# platform_testing
changes=(
257354 # Remove LauncherRotationStressTest; Launcher2 was removed
257355 # Revert "Test: Manually tested."
257356 # Revert "Test: Manually tested."
257357 # Revert "Add PlatformScenarioTests to test artifacts."
)
repopick ${changes[@]}&

# system/bt
changes=(
258857 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
258858 # Explicit SBC Dual Channel (SBC HD) support
)
repopick ${changes[@]}&

# system/core
changes=(
258166 # Add wrapped key support
256219 # utils: Threads: Handle empty thread names
256823 # Camera: Add feature extensions
261945 # fs_mgr: Fix EnsurePathMounted with a given mount_point.
259414 # reboot: mark as recovery_available
260334 # fs_mgr: mount: don't set the block device as ro for recovery
261075 # Revert "Format formattable partitions if mount fails"
259650 # Make adb use a custom prop for adb root
)
repopick ${changes[@]}&

# system/netd
changes=(
256959 # netd: Allow devices to force-add directly-connected routes
260003 # system/netd: Squash of app fw restriction commits
)
repopick ${changes[@]}&

# system/update_engine
changes=(
259363 # Move performance mode to top app
)
repopick ${changes[@]}&

# system/vold
changes=(
258131 # vold: Add Hardware FDE feature
258132 # system: vold: Remove crypto block device creation
258133 # vold: Wrapped key support for FBE
258134 # vold: Use separate flag for wrappedkey
258135 # Remove no longer relevant header file
258136 # vold: add support for clear key
258137 # Fix for CTS test CtsAppSecurityHostTestCases
258138 # vold: fix build error
258139 # vold: change to upgrade key if export fails
258141 # system: vold: fix block disk encryption to work with metadata encryption
258145 # Updates for migrated code upstream
258147 # system: vold: Close crypto block device if it was created
258148 # system: vold: pass proper extra params to load crypto device
258140 # system: vold: Use wrapped key for metadata encryption
258149 # [automerger] vold: resolve crypto device creation failure with dm-crypt skipped: 4b5c1b2db2
258150 # system: vold: Use ICE for UFS card
258151 # vold: Move QCOM HW FDE inclusion under Lineage namespace
258169 # vold: add support for more filesystems for public storage
258170 # vold: Fix fsck on public volumes
258171 # vold: Support internal storage partitions
258172 # vold: Honor mount options for ext4/f2fs partitions
258173 # vold: Mount ext4/f2fs portable storage with sdcard_posix
258174 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
258175 # Fix the group permissions of the sdcard root.
258176 # vold: skip first disk change when converting MBR to GPT
258177 # vold: Allow reset after shutdown
258178 # vold: Accept Linux GPT partitions on external SD cards
258179 # Add "changepw" command to vdc.
)
repopick ${changes[@]}&

# vendor/lineage
changes=(
259981 # Revert "soong_config: Add flag for legacy HW FDE"
260414 # soong_config: Reverse wait for qsee flag
256960 # soong_config: add TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE
259449 # config: Mark more gralloc bits as valid
259310 # prebuilt: Add a script to simplify A-only recovery system mount
257000 # Remove apicheck.mk
259699 # extract_files: Support system/ prefixes
259701 # extract_files: Add extract2() function
260081 # extract_files: Match non-treble path prefixes
258774 # extract_files: Add initial blueprint creation
258775 # extract_files: Implement blueprint file generation
260417 # extract_utils: Added Suffix uses COMMON_SUFFIX
255667 # adb insecure by default
260603 # Kill sysinit
260562 # common: Add nano to PRODUCT_PACKAGES'
261043 # privapp-permissions: Allow Gallery2 to use android.permission.MODIFY_AUDIO_ROUTING
261292 # vendor/lineage: Fix dopush
261642 # vendor: make dopush recognize /vendor files
258204 # build: set build fingerprint for all devices
)
repopick ${changes[@]}&

# vendor/codeaurora/telephony
changes=(
257215 # Revert "IMS-VT: Low battery handling for Video calls"
)
repopick ${changes[@]}&

# vendor/qcom/opensource/fm-commonsys
changes=(
260194 # Revert "FM: Use btconfigstore interface to fetch vendor features"
260195 # Revert "Fm: Use btconfigstore interface to fetch vendor features"
260422 # jni: fix calibration data path for legacy fm_qsoc_patches
260423 # jni: Skip loading FM firmware if requested
260429 # jni: Remove unused variables
260431 # jni: Resolve FM_DEVICE_PATH R/O open flag
260432 # jni: Ignore unused parameters from APIs
260434 # jni: Resolve equality comparisons with extraneous parentheses
260435 # jni: Resolve V4L2_CID_AUDIO_MUTE redefinitions
260436 # jni: Resolve -Wwritable-strings warnings in helium FW library variables
260437 # Allow library to be used by apps directly
260438 # FM: Break bootclasspath dependency
260439 # FM: Re-vamp UI
260440 # FM: Restore seek arrows
260441 # FM: Make default country an overlay
260442 # FM: Re-add RDS fields to UI
260443 # FM: Scanned frequencies are saved in ascending ordering
260444 # FM: Call unregister in onPause
260445 # FM: Switch file extension to aac
260446 # FM: Add property to force use internal antenna
260447 # FM: Cleanup resources
260448 # FM: add Indonesia
260449 # FM: materialize
260450 # FM: retune last frequency when resume after call
260451 # FM: Store tag num/value in sequence
260452 # FM: reenable radio text visibility after station info updated
260453 # FM: Launch station list automatically after scan
260454 # FM: Fix status text to reflect when FM is enabled.
260455 # FM: The collect channel disappear when quit FM
260456 # FM: Ensure scan state is kept in sync
260457 # FM: Keep track of scanned frequencies in service
260458 # FM: Select band based on country
260459 # FM: improved band selection
260460 # FM: Localization of band types
260461 # FM: Fix settings UI bugs
260462 # FM: Fix headphone icon
260463 # FM: Update India bands
260464 # FM: Convert regional band arrays to string references
260465 # FM: Fix KHz->kHz
260487 # FM: Revamp notifications
260488 # FM: adaptive icon
260489 # fm: Drop unnecessary dependencies
260490 # FM: Remove unnecessary TARGET_BOARD_PLATFORM guard
)
repopick ${changes[@]}&

# vendor/qcom/opensource/power
changes=(
260196 # power: Remove powerhintparser
260197 # power: Fix power hal compiler warnings
260198 # power: Fix a few compiler warnings
260199 # power: Use log/log.h instead of utils/Log.h
260200 # power: Add support for tap-to-wake feature control
260092 # power: Refactor TARGET_TAP_TO_WAKE_NODE
260091 # power: Allow device specific hooks for set_interactive
260201 # power: Allow devices to write their own platform specific bits
260202 # power: override encode hint for 8909
260203 # power: Change the Hi-Speed freq to 800Mhz for camcorder case
260204 # power: Changed the minfreq to 400Mhz for display off scenario.
260205 # power: Fix to handle min freq changes when CPU cores hotplugged.
260206 # power: modify return value for display off hint in 8994
260207 # power: introduce 8992-specific handling
260208 # power: Enable 4+0 core config for display off cases
260209 # power: Remove unused arg from power_hint_override/set_interactive_override
260210 # power: Remove mutex to hints
260211 # power: Add -qti suffix to module name
260212 # power: clang-format
260213 # power: Remove leftover support for msm-dcvs governor
260214 # power: Remove leftover support for ondemand governor
260215 # power: Introduce is_schedutil_governor
260216 # power: Use is_interactive_governor/is_schedutil_governor
260217 # power: Avoid interaction build errors
260218 # power: Remove unused list utils
260219 # power: Simplify soc_id checks
260220 # power: Simplify display_hint_sent
260221 # power: Add back display_boost checks
260222 # power: Cache SOC ID checks for future queries
260223 # power: Drop default POWER_HINT_INTERACTION routine
260224 # power: Use ARRAY_SIZE macro where possible
260225 # power: add back check for ro.vendor.extension_library
260226 # power: msm8996: Remove dead code
260227 # power: fix sysfs_read/sysfs_write usage
260228 # power: msm8916: Code clean up
260229 # power: Compile with -Wall -Wextra -Werror
260230 # power: Remove unused camera_hint_ref_count
260231 # Reduce hwbinder buffer size for power HAL
260245 # power: Rename power-8952.c to power-8937.c
260249 # power: msm8952: Remove HBTP support
261751 # power: Find online CPU core and get scaling governor
260232 # power: Clean up and fix video encode/decode hint handling
260233 # power: Clean up and fix set_interactive_override
260234 # power: msm8996: Support VR + Sustained performance mode
260235 # power: Add known perf hint IDs
261752 # power: Use declared enums where possible
260236 # power: perform_hint_action: return an error code
260237 # power: Use monotonic time for interaction boost
260238 # power: Handle launch and interaction hints for perf HAL platforms
260239 # power: Handle launch and interaction hints for legacy platforms
261753 # power: msm8916: Drop MIN_FREQ tweak for 8939
260240 # power: Prepare for power profile support
260241 # power: msm8998: Support power profiles
260242 # power: sdm660: Support power profiles
260243 # power: msm8996: Support power profiles
260244 # power: msm8953: Support power profiles
260246 # power: msm8937: Support power profiles
260247 # power: Support power profiles on legacy platforms
)
repopick ${changes[@]}&

wait

# LA.UM.8.1.r1-09500-sm8150.0
changes=(
261904 261905 261910 261911 261912 261913 261914 261916 261917 261918 261923 261924 261925 261926 261927
)
repopick ${changes[@]}&

# LA.UM.8.3.r1-06100-sdm845.0
changes=(
261908 261909 261915
)
repopick ${changes[@]}&

# LA.UM.8.4.r1-04500-8x98.0
changes=(
261906 261907
)
repopick ${changes[@]}&

wait

# build/make
repopick -f 259858 # Sorry bro: 6 -> 3
