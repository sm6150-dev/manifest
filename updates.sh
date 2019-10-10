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
repopick 260346 # build: Remove su inclusion
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
repopick 260022 # sepolicy: vendor: Label Cryptfshw HIDL HALs
repopick 259727 # sepolicy: vendor: Migrate to power 1.2
repopick 257053 # sepolicy: Make recovery permissive
repopick 257100 # [DND] Kill su

# device/qcom/sepolicy/legacy-um
repopick 259422 # sepolicy: Fix video4linux "name" node labeling
repopick 259423 # sepolicy: Allow mm-qcamerad to access v4L "name" node
repopick 259424 # common: Fix labelling of lcd-backlight
repopick 259425 # msm8996: Consider additional ssr nodes
repopick 259426 # sepolicy: Label persist partition for all SoCs
repopick 259427 # sepolicy: allow vold to read persist dirs

# external/bash
repopick 260053 # Resolve LOCAL_MODULE_TAGS errors
repopick 260598 # Fix copy rule correctness (requirement for Android 10).

# external/libncurses
repopick 260054 # Resolve LOCAL_MODULE_TAGS error

# external/mksh
repopick 259638 # mksh: Mark mkshrc as recovery_available

# external/nano
repopick 260055 # Resolve LOCAL_MODULE_TAGS error
repopick 260558 # Fix copy rule correctness (requirement for Android 10).

# external/openssh
repopick 260038 # modify SSHDIR as that's not part of upstream code
repopick 260039 # Move away from GLOBAL_CFLAGS for ssh configuration
repopick 260040 # Revert "openssh: Silence build warnings"
repopick 260041 # Revert "openssh: don't spam warnings as errors"
repopick 260042 # Allow SSH to function with more strict android network stack.
repopick 260043 # Use sshd mods with gce_x86_64 as well
repopick 260044 # Add missing header for new sshd.c setns code
repopick 260045 # Use -Werror and -Wno-error in external/openssh
repopick 260046 # Enable namespace switching on the legacy branches
repopick 260047 # Provide work-around for missing setns on K
repopick 260048 # Remove assumption that _PATH_BSHELL is a compile-time constant.
repopick 260049 # Fix build breakage
repopick 260050 # Add libc.bootstrap only for Q and beyond
repopick 260051 # Add default code reviewers into OWNERS
repopick 260052 # Fix compilation with Q boringssl

# external/p7zip
repopick 260056 # p7zip: Silence even more warnings

# external/rsync
repopick 260057 # Resolve LOCAL_MODULE_TAGS error

# external/tinyalsa
repopick 260543 # Mark tinymix/tinyplay as vendor_available

# external/tinycompress
repopick 256308 # tinycompress: Enable extended compress format

# external/unrar
repopick 260058 # unrar: Silence even more warnings

# external/vim
repopick 260059 # Resolve LOCAL_MODULE_TAGS errors
repopick 260559 # Fix copy rule correctness (requirement for Android 10).

# frameworks/av
repopick 256899 # camera: Allow devices to load custom CameraParameter code
repopick 258224 # Camera: Add extensions to CameraClient
repopick 258437 # Camera: Add support for preview frame fd
repopick 258439 # stagefright: add changes related to high-framerates in CameraSource
repopick 258812 # CameraService: Support hooks for motorized camera
repopick 259987 # audiopolicy: support extended feature in audiopolicymanager
repopick 260580 # Camera: CameraHardwareInterface changes to support Extended FD
repopick 260581 # Camera: Miscellaneous fixes in QDataCallback and binder death scenarios.
repopick 260582 # camera: Only link and use vendor.qti.hardware.camera.device if specified

# frameworks/base
#repopick 258530 # Use UnlockMethodCache#canSkipBouncer in user switcher
repopick 258159 # frameworks: base: Port password retention feature
repopick 258180 # Fix Build Credentials refactored to use byte[]
repopick 258160 # LockSettingsService: Support for separate clear key api
repopick 256163 # Configurable 0, 90, 180 and 270 degree rotation
repopick 256164 # SystemUI: Fix toggling lockscreen rotation [1/3]
repopick 257008 # SystemUI: Apply system_icons_keyguard_padding_end to parent view
repopick 256446 # SystemUI: Enable and fix QS detail view, adapt layout to Pie
repopick 256447 # SystemUI: Add Profiles tile
repopick 256448 # SystemUI: Advanced location tile
repopick 256831 # KernelCpuUidTimeReader: Decrease log level on eng builds
repopick 258225 # Camera: Add feature extensions
repopick 258303 # power: Re-introduce custom charging sounds
repopick 258546 # Camera button support
repopick 257246 # fingerprint: handle PerformanceStats NULL pointers
repopick 258754 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 257247 # fingerprint: notify client when cancelling succeeded
repopick 258753 # FingerprintService: add overlay to prevent cleanup of unused fingerprints
repopick 258820 # SystemUI: Add visualizer feature
repopick 258826 # SystemUI: Dismiss keyguard on boot if disabled by current profile
repopick 258827 # SystemUI: Don't dismiss keyguard if user key isn't unlocked
repopick 258853 # Add CHANNEL_MODE_DUAL_CHANNEL constant
repopick 258854 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
repopick 258855 # Allow SBC as HD audio codec in Bluetooth device configuration
repopick 259505 # SystemUI: Avoid adding useless empty quick settings page
repopick 259983 # Merge changes for launching wifidisplay from system settings
repopick 259984 # WiFiDisplayController: Defer the P2P Initialization from its constructor.
repopick 259985 # WifiDisplayController: handle preexisting p2p connection status
repopick 259458 # storage: Do not notify for volumes on non-removable disks
repopick 260002 # fw/b: Squash of app fw restriction commits
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

# frameworks/opt/net/wifi
repopick 260004 # WiFi: Ignore connectivity scans during WFD session

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
repopick 260578 # Camed HAL extension: Added support in HIDL for Extended FD.
repopick 260579 # camera: Only link and use vendor.qti.hardware.camera.device if specified

# hardware/libhardware
repopick 256912 # audio: Add audio amplifier HAL

# hardware/lineage/interfaces
repopick 258215 # Initial dummy cryptfshw implementation
#repopick 258828 # cryptfshw: Setup boilerplate items before actual implementation
#repopick 258849 # cryptfshw: Split implementations into dlsym and ioctl
#repopick 258850 # cryptfshw: ioctl: Wire up the implementation
#repopick 258851 # cryptfshw: dlsym: Wire up the implementation
repopick 260411 # cryptfshw: Introduce qti backend implementation
repopick 256420 # Initial audio amplifier HAL
repopick 260069 # wifi: Disable softAP MAC randomization by default

# hardware/qcom/keymaster
repopick 260415 # keymaster: Reverse wait for qsee flag

# hardware/qcom-caf/msm8974/display
repopick 256287 # display: inform compilers of deliberate switch fallthrough

# hardware/qcom-caf/msm8998/audio
repopick 260703 # audio: Extend platform parser to allow device name aliasing
repopick 260704 # hal: Add missing compress voip PCM device ID
repopick 260366 # hal: Support the audio amplifier hook

# lineage-sdk
repopick 258333 # lineage-sdk: Bump PREF_HAS_MIGRATED_LINEAGE_SETTINGS for 17.0
repopick 259996 # lineage-sdk: Update path to ChargingStarted.ogg

# packages/apps/Bluetooth
repopick 258859 # SBC Dual Channel (SBC HD Audio) support
repopick 258860 # Assume optional codecs are supported if were supported previously

# packages/apps/Contacts
repopick 256654 # Contacts: Enable support for device contact.
repopick 256655 # Place MyInfo shortcut on drawer
repopick 256656 # Place EmergencyInfo shortcut on drawer
repopick 256657 # Allow calling contacts via specific phone accounts.
#repopick 256658 # Contacts: use white nav bar

# packages/apps/DeskClock
repopick 256663 # Provide upgrade path for cm-14.1 -> lineage-16.0
repopick 256664 # Make new menu entry to link to cLock widget settings.

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
repopick 260416 # Parts: Convert charging sound path to uri

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
repopick 260063 # NfcNci: make T3T/Nfc-F HCE optional

# packages/apps/PackageInstaller
repopick 255658 # Revert "Remove Permissions Hub."
repopick 255659 # PermissionController: Enable permission hub by default

# packages/apps/Settings
repopick 256162 # Settings: Add rotation settings
repopick 258304 # Settings: Add LineageParts charging sound settings preference
repopick 258819 # Settings: Add lockscreen visualizer toggle
repopick 258856 # Add Dual Channel into Bluetooth Audio Channel Mode developer options menu
#repopick 259315 # One does not simply become a Developer
repopick 259459 # storage: Do not allow eject for volumes on non-removable disks
repopick 260584 # Enable dismissal feature on legacy suggestions.
repopick 260853 # Make sure close button has proper color
repopick 259455 # Settings: per-app cellular data, vpn and wifi restrictions

# packages/apps/SetupWizard
repopick 257065 # Account for PhoneMonitor API change

# packages/apps/ThemePicker
repopick 256017 # ThemePicker: Properly update clock face setting

# packages/apps/Trebuchet
repopick 256018 # Revert "[DO NOT MERGE] Disable swipe down to pull noti shade for Q"
repopick 256019 # Launcher3: Export GridOptionsProvider
repopick 259724 # Launcher3: Fix launcher preview rendering
repopick 260127 # Trebuchet: update build configs
repopick 260128 # Create LineageLauncher
repopick 260129 # Launcher3: Google Feed integration
repopick 260130 # Launcher3: exclude from recents
repopick 260131 # Launcher3: No Calendarwidget 4x4 widget displayed
repopick 260132 # Launcher3: Stability NullPointer issue
repopick 260133 # Workspace: Allow resizing any widget
repopick 260134 # PagedView: fix pointer index out of range
repopick 260135 # Launcher3: Can't search out local app by Chinese
repopick 260136 # DeviceProfile: fix divide by zero
repopick 260137 # Provider: Initialize createEmptyRowOnFirstScreen without QSB
repopick 260138 # config: enable LAUNCHER3_PROMISE_APPS_IN_ALL_APPS
repopick 260139 # proguard: Also keep FixedScaleDrawable
repopick 260145 # Change app name to Trebuchet
repopick 260141 # Trebuchet: adaptive icon
repopick 260142 # Trebuchet: Bump min SDK to 26 as required for adaptive icons
repopick 260143 # Trebuchet: prefer our wallpaper picker if possible
repopick 260144 # Trebuchet: Hide Notification Dots on low RAM devices
repopick 260319 # Trebuchet: Update default workspace
repopick 260320 # Change icon drawable padding
repopick 260321 # Disable QSB on first screen by default
repopick 260322 # QSB: request round search bar

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
repopick 256161 # Telecomm: Make sensitive phone numbers not to be shown in call log history.
repopick 256265 # CallLog: Take into account multiple SIMs for sensitive numbers

# packages/services/Telephony
repopick 256792 # Telephony: Add ERI configuration for U.S. Cellular
repopick 256793 # Telephony: Support muting by RIL command
repopick 256794 # Fix non-protected broadcasts sent from phone process.
repopick 256795 # Don't start SIP service before decrypted
repopick 256797 # Allow to disable the new scan API for manual network search.

# platform_testing
repopick 257354 # Remove LauncherRotationStressTest; Launcher2 was removed
repopick 257355 # Revert "Test: Manually tested."
repopick 257356 # Revert "Test: Manually tested."
repopick 257357 # Revert "Add PlatformScenarioTests to test artifacts."

# system/bt
repopick 258857 # Increase maximum Bluetooth SBC codec bitrate for SBC HD
repopick 258858 # Explicit SBC Dual Channel (SBC HD) support

# system/core
repopick 258166 # Add wrapped key support
repopick 255932 # adb: Add wait-for-online command
repopick 256219 # utils: Threads: Handle empty thread names
repopick 256823 # Camera: Add feature extensions
repopick 259414 # reboot: mark as recovery_available
repopick 260334 # fs_mgr: mount: don't set the block device as ro for recovery
repopick 259650 # Make adb use a custom prop for adb root

# system/netd
repopick 256959 # netd: Allow devices to force-add directly-connected routes
repopick 260003 # system/netd: Squash of app fw restriction commits

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
repopick 260414 # soong_config: Reverse wait for qsee flag
repopick 256960 # soong_config: add TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE
repopick 259449 # config: Mark more gralloc bits as valid
repopick 259310 # prebuilt: Add a script to simplify A-only recovery system mount
repopick 257000 # Remove apicheck.mk
repopick 259699 # extract_files: Support system/ prefixes
repopick 259701 # extract_files: Add extract2() function
repopick 260081 # extract_files: Match non-treble path prefixes
repopick 258774 # extract_files: Add initial blueprint creation
repopick 258775 # extract_files: Implement blueprint file generation
repopick 260417 # extract_utils: Added Suffix uses COMMON_SUFFIX
repopick 255667 # adb insecure by default
repopick 260603 # Kill sysinit
repopick 260562 # common: Add nano to PRODUCT_PACKAGES

# vendor/codeaurora/telephony
repopick 257215 # Revert "IMS-VT: Low battery handling for Video calls"

# vendor/qcom/opensource/fm-commonsys
repopick 260194 # Revert "FM: Use btconfigstore interface to fetch vendor features"
repopick 260195 # Revert "Fm: Use btconfigstore interface to fetch vendor features"
repopick 260422 # jni: fix calibration data path for legacy fm_qsoc_patches
repopick 260423 # jni: Skip loading FM firmware if requested
repopick 260429 # jni: Remove unused variables
repopick 260431 # jni: Resolve FM_DEVICE_PATH R/O open flag
repopick 260432 # jni: Ignore unused parameters from APIs
repopick 260434 # jni: Resolve equality comparisons with extraneous parentheses
repopick 260435 # jni: Resolve V4L2_CID_AUDIO_MUTE redefinitions
repopick 260436 # jni: Resolve -Wwritable-strings warnings in helium FW library variables
repopick 260437 # Allow library to be used by apps directly
repopick 260438 # FM: Break bootclasspath dependency
repopick 260439 # FM: Re-vamp UI
repopick 260440 # FM: Restore seek arrows
repopick 260441 # FM: Make default country an overlay
repopick 260442 # FM: Re-add RDS fields to UI
repopick 260443 # FM: Scanned frequencies are saved in ascending ordering
repopick 260444 # FM: Call unregister in onPause
repopick 260445 # FM: Switch file extension to aac
repopick 260446 # FM: Add property to force use internal antenna
repopick 260447 # FM: Cleanup resources
repopick 260448 # FM: add Indonesia
repopick 260449 # FM: materialize
repopick 260450 # FM: retune last frequency when resume after call
repopick 260451 # FM: Store tag num/value in sequence
repopick 260452 # FM: reenable radio text visibility after station info updated
repopick 260453 # FM: Launch station list automatically after scan
repopick 260454 # FM: Fix status text to reflect when FM is enabled.
repopick 260455 # FM: The collect channel disappear when quit FM
repopick 260456 # FM: Ensure scan state is kept in sync
repopick 260457 # FM: Keep track of scanned frequencies in service
repopick 260458 # FM: Select band based on country
repopick 260459 # FM: improved band selection
repopick 260460 # FM: Localization of band types
repopick 260461 # FM: Fix settings UI bugs
repopick 260462 # FM: Fix headphone icon
repopick 260463 # FM: Update India bands
repopick 260464 # FM: Convert regional band arrays to string references
repopick 260465 # FM: Fix KHz->kHz
repopick 260487 # FM: Revamp notifications
repopick 260488 # FM: adaptive icon
repopick 260489 # fm: Drop unnecessary dependencies
repopick 260490 # FM: Remove unnecessary TARGET_BOARD_PLATFORM guard

# vendor/qcom/opensource/power
repopick 260196 # power: Remove powerhintparser
repopick 260197 # power: Fix power hal compiler warnings
repopick 260198 # power: Fix a few compiler warnings
repopick 260199 # power: Use log/log.h instead of utils/Log.h
repopick 260200 # power: Add support for tap-to-wake feature control
repopick 260092 # power: Refactor TARGET_TAP_TO_WAKE_NODE
repopick 260091 # power: Allow device specific hooks for set_interactive
repopick 260201 # power: Allow devices to write their own platform specific bits
repopick 260202 # power: override encode hint for 8909
repopick 260203 # power: Change the Hi-Speed freq to 800Mhz for camcorder case
repopick 260204 # power: Changed the minfreq to 400Mhz for display off scenario.
repopick 260205 # power: Fix to handle min freq changes when CPU cores hotplugged.
repopick 260206 # power: modify return value for display off hint in 8994
repopick 260207 # power: introduce 8992-specific handling
repopick 260208 # power: Enable 4+0 core config for display off cases
repopick 260209 # power: Remove unused arg from power_hint_override/set_interactive_override
repopick 260210 # power: Remove mutex to hints
repopick 260211 # power: Add -qti suffix to module name
repopick 260212 # power: clang-format
repopick 260213 # power: Remove leftover support for msm-dcvs governor
repopick 260214 # power: Remove leftover support for ondemand governor
repopick 260215 # power: Introduce is_schedutil_governor
repopick 260216 # power: Use is_interactive_governor/is_schedutil_governor
repopick 260217 # power: Avoid interaction build errors
repopick 260218 # power: Remove unused list utils
repopick 260219 # power: Simplify soc_id checks
repopick 260220 # power: Simplify display_hint_sent
repopick 260221 # power: Add back display_boost checks
repopick 260222 # power: Cache SOC ID checks for future queries
repopick 260223 # power: Drop default POWER_HINT_INTERACTION routine
repopick 260224 # power: Use ARRAY_SIZE macro where possible
repopick 260225 # power: add back check for ro.vendor.extension_library
repopick 260226 # power: msm8996: Remove dead code
repopick 260227 # power: fix sysfs_read/sysfs_write usage
repopick 260228 # power: msm8916: Code clean up
repopick 260229 # power: Compile with -Wall -Wextra -Werror
repopick 260230 # power: Remove unused camera_hint_ref_count
repopick 260231 # Reduce hwbinder buffer size for power HAL
repopick 260232 # power: Clean up and fix video encode/decode hint handling
repopick 260233 # power: Clean up and fix set_interactive_override
repopick 260234 # power: msm8996: Support VR + Sustained performance mode
repopick 260235 # power: Add known perf hint IDs
repopick 260236 # power: perform_hint_action: return an error code
repopick 260237 # power: Use monotonic time for interaction boost
repopick 260238 # power: Handle launch and interaction hints for perf HAL platforms
repopick 260239 # power: Handle launch and interaction hints for legacy platforms
repopick 260240 # power: Prepare for power profile support
repopick 260241 # power: msm8998: Support power profiles
repopick 260242 # power: sdm660: Support power profiles
repopick 260243 # power: msm8996: Support power profiles
repopick 260244 # power: msm8953: Support power profiles
repopick 260245 # power: Rename power-8952.c to power-8937.c
repopick 260246 # power: msm8937: Support power profiles
repopick 260247 # power: Support power profiles on legacy platforms
repopick 260248 # power: msm8952: Remove launch and interaction hints
repopick 260249 # power: msm8952: Remove HBTP support
repopick 260250 # power: msm8952: Support power profiles
repopick 260251 # power: msm8952: Readd video encode/decode hint handling
repopick 260252 # power: msm8960: Implement performance profiles
repopick 260253 # power: msm8960: Readd video encode/decode hint handling
repopick 260254 # power: msm8960: Readd set_interactive_override
