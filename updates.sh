#!/bin/bash

set -e
source build/envsetup.sh

# art
repopick 256444 # Don't fail dual map if memfd isn't supported

# bionic
repopick 256168 # Add inaddr.h header file
repopick 256083 # linker: Add support for dynamic SHIM libraries
repopick 256147 # bionic: Sort and cache hosts file data for fast lookup
repopick 256148 # libc: Mark libstdc++ as vendor available
repopick 256149 # Implement per-process target SDK version override.
repopick 256150 # bionic: Use legacy pthread_mutex_init() behavior on pre-P API levels
repopick 256151 # Actually restore pre-P mutex behavior

# bootable/recovery
repopick 255824 # Revert "updater: Remove dead make_parents()."
repopick 255825 # Revert "otautil: Delete dirUnlinkHierarchy()."
repopick 255826 # Revert "kill package_extract_dir"
repopick 255827 # Revert "Remove the obsolete package_extract_dir() test"
repopick 255828 # Revert "updater: Remove some obsoleted functions for file-based OTA."
repopick 255829 # recovery: updater: Fix SymlinkFn args
repopick 255830 # Make adb use a custom prop for adb root
repopick 255831 # recovery: Get a proper shell environment in recovery
repopick 255979 # recovery: symlink /sbin for script compatibility
repopick 255846 # recovery: Allow custom bootloader msg offset in block misc
repopick 255847 # recovery: wipe bootloader message from index 0 when using custom offsets
repopick 255990 # recovery: Remove HOST_OS guard for f2fs tools
repopick 255991 # Revert "recovery: Fork a process for fuse when sideloading from SD card."
repopick 255832 # recovery: ui: Default to touch enabled
repopick 255833 # recovery: ui: Minor cleanup for touch code
repopick 255992 # recovery: ui: Support hardware virtual keys
repopick 256010 # recovery: Include vendor init trigger

# build/make
repopick 255663 # Add BOARD_CUSTOM_BOOTIMG_MK support
repopick 255925 # build: Add support for device tree in boot.img
repopick 256500 # Allow a device to generically define its own headers
repopick 256458 # core: Disable vendor restrictions
repopick 257099 # Make PRODUCT_BUILD_PROP_OVERRIDES bit more powerful
repopick 257156 # build: Conditionally include AudioPackage14.mk instead of AllAudio.mk
repopick 257157 # Revert "Add handheld_core_hardware.xml to telephony base"
repopick 257158 # Remove LatinIME as it is included per target in vendor/lineage
repopick 257159 # Fix inheritance of PRODUCT_PROPERTY_OVERRIDES for Lineage audio files
repopick 257160 # Disable dataroaming by default
repopick 257161 # Add missing languages
repopick 257162 # Don't enable ADB by default on userdebug builds
repopick 257163 # Enable dynamic linker warnings only on eng build
repopick 257243 # NFC: Disbale build for AOSP NFC
#repopick 257166 # build: recovery: Support adding device-specific items
#repopick 257167 # build: Separate commands in recovery foreach loops
#repopick 257168 # Allow setting the recovery density separately from the aapt config
#repopick 257169 # build: recovery: add vendor to exclusion list
#repopick 257170 # build: Never set persist.sys.usb.config=none in recovery
#repopick 257171 # build: ota: Support for install tools in /tmp/install
#repopick 257172 # releasetools: squash backuptool support
#repopick 257173 # Edify: Add abort message for bootloader asserts
#repopick 257174 # releasetools: support reading release keys out of some sort of command
#repopick 257175 # releasetools: Add script to sign zips
#repopick 257176 # releasetools: Store the build.prop file in the OTA zip
#repopick 257177 # releasetools: Use the first entry of a mount point when reading fstab
#repopick 257178 # build: allow forcing build of otatools
#repopick 257179 # releasetools: ota_from_target_files: add FullOTA_PostValidate
#repopick 257180 # edify: bring back SetPermissionsRecursive
#repopick 257181 # Revert "Remove the obsolete UnpackPackageDir() in edify generator"
#repopick 257182 # build: Support system-as-root A-only backuptool
#repopick 257183 # build: Allow mounting system properly for A-only system-as-root devices
repopick 257184 # build: Only set the default verity key as a fallback

# build/soong
repopick 256886 # soong: Add function to return camera parameters library name
repopick 256833 # Fix formatting

# development
repopick 257150 # make-key: Enforce PBEv1 password-protected signing keys

# device/lineage/sepolicy
repopick 257046 # sepolicy: Mark mkfs and sysinit as system_file_type
repopick 257047 # sepolicy: Drop fsck.f2fs label
repopick 257053 # sepolicy: Make recovery permissive
repopick 257100 # [DND] Kill su

# external/ant-wireless/ant_native
repopick 257193 # ant_native: use project pathmap
repopick 257194 # ANT: Don't build HIDL variant libantradio for OSS builds
repopick 257195 # Remove unused parameters in vfs code

# external/json-c
repopick 257196 # libjson: Remove dependency on kernel headers

# external/tinycompress
repopick 256308 # tinycompress: Enable extended compress format
repopick 256309 # tinycompress: Use generated kernel headers

# frameworks/av
repopick 256421 # audiopolicy: make audio policy extensible
repopick 256887 # nuplayer: Avoid crash when codec fails to load
repopick 256888 # camera: Don't segfault if we get a NULL parameter
repopick 256889 # cameraservice: Resolve message vs start/stop preview races
repopick 256890 # libstagefright: Support YVU420SemiPlanar camera format
repopick 256891 # stagefright: omx: Don't signal dataspace change on legacy QCOM
repopick 256892 # stagefright: ACodec: Resolve empty vendor parameters usage
repopick 256893 # libstagefright: Free buffers on observer died
repopick 256894 # libstagefright: use 64-bit usage for native_window_set_usage
repopick 256895 # camera: convert cameraserver back to mk
repopick 256896 # camera/media: Support legacy HALv1 camera in mediaserver
repopick 256897 # Camera: check metadata type before releasing frame
repopick 256898 # camera: include: Don't override possible overlayed header
repopick 256899 # camera: Allow devices to load custom CameraParameter code
repopick 256829 # Request to reset effect buffer in clearInputBuffer

# frameworks/base
repopick 255684 # storage: Set all sdcards to visible
repopick 256163 # Configurable 0, 90, 180 and 270 degree rotation
repopick 256164 # SystemUI: Fix toggling lockscreen rotation [1/3]
repopick 256185 # Enable Binder Proxy Tracking by Uid only on eng builds
repopick 256186 # SystemUI: Add support for persistent usb drive notification.
repopick 256187 # Disable notification channel warnings by default
repopick 256291 # Support enforcing a minimum delay between notification sounds of an app
repopick 256596 # frameworks/base: Support for third party NFC features and extensions
repopick 255646 # Revert "DO NOT MERGE Remove Privacy Indicators"
repopick 255648 # Revert "DO NOT MERGE Revert "Adding the privacy chip to the CarStatusBar""
repopick 255649 # PrivacyItemController: Enable permission hub by default
repopick 257008 # SystemUI: Apply system_icons_keyguard_padding_end to parent view
repopick 256167 # Support for device specific key handlers
repopick 256830 # audio: Don't play sound effects if stream is muted
repopick 256922 # Initial support for in-display fingerprint sensors
repopick 256345 # SystemUI: Enable NFC tile
repopick 256326 # SystemUI: Add caffeine qs tile
repopick 256327 # SystemUI: Add heads up tile
repopick 256328 # SystemUI: Add Sync tile
repopick 256329 # SystemUI: Add tile to show volume panel
repopick 256346 # SystemUI: Add ADB over network tile
repopick 256331 # SystemUI: Add AmbientDisplay tile
repopick 256332 # SystemUI: Add USB Tether tile
repopick 256445 # SystemUI: Add LiveDisplay tile
repopick 256334 # SystemUI: Add reading mode tile
repopick 256337 # SystemUI: Allow user to add/remove QS with one click
repopick 256446 # SystemUI: Enable and fix QS detail view, adapt layout to Pie
repopick 256447 # SystemUI: Add Profiles tile
repopick 256448 # SystemUI: Advanced location tile
repopick 256831 # KernelCpuUidTimeReader: Decrease log level on eng builds
repopick 257151 # Camera: allow camera to use power key as shutter
repopick 256016 # Revert "Disable custom clock faces in SystemUI"
repopick 256015 # Revert "Disable ClockOptionsProvider so clocks don't appear in picker app"
repopick 255650 # Revert "Drop final remnants of Type clock face"
repopick 255647 # Revert "Drop Type clock face."
repopick 255651 # TypeClockController: Make it compile with new plugin API
repopick 256192 # [DNM] IS_DEBUGGABLE -> IS_ENG

# frameworks/native
repopick 256923 # libui: Allow extension of valid gralloc 1.0 buffer usage bits

# frameworks/opt/telephony
repopick 256942 # telephony: Squashed support for simactivation feature

# hardware/libhardware
repopick 256911 # hardware/libhw: Add display_defs.h to declare custom enums/flags

# hardware/libhardware_legacy
repopick 256951 # Add wifi_add_or_remove_virtual_intf() to the legacy wifi hal

# hardware/lineage/interfaces
repopick 256902 # interfaces: Camera: Add support for IMapper 3.0
repopick 256420 # Initial audio amplifier HAL

# hardware/nxp/nfc
repopick 256955 # nfc: Restore pn548 support to 1.1 HAL

# hardware/qcom/audio
repopick 256353 # audio: Use project pathmap

# hardware/qcom/bootctrl
repopick 256354 # bootcontrol: Only compile when the A/B feature is enabled

# hardware/qcom/bt
repopick 256355 # bt: Add guard makefile

# hardware/qcom/camera
repopick 256356 # camera: Only build if specified

# hardware/qcom/data/ipacfg-mgr
repopick 256357 # ipacfg-mgr: Use project pathmap

# hardware/qcom/display
repopick 256358 # display: Use project pathmap

# hardware/qcom/gps
repopick 256359 # gps: Use project pathmap

# hardware/qcom/keymaster
repopick 256360 # keymaster: add TARGET_PROVIDES_KEYMASTER

# hardware/qcom/media
repopick 256361 # media: Use project pathmap

# hardware/qcom/wlan
repopick 256362 # wlan: Add guard makefile

# hardware/qcom-caf/bt
repopick 256302 # bt: Remove LOCAL_MODULE_TAGS := debug usage

# hardware/qcom-caf/fm
repopick 257274 # Use BOARD_HAVE_QCOM_FM flag
repopick 257275 # fm_hci/helium: Exclude from OSS builds

# hardware/qcom-caf/msm8998/audio
repopick 256181 # hal: Add libprocessgroup dependency to set_sched_policy users
repopick 256583 # hal: Add Mic Direction API
repopick 256584 # Revert "hal: add amplifier hooks for stream parameter manipulation"
repopick 256585 # Revert "hal: Support the audio amplifier hook"

# hardware/qcom-caf/msm8998/display
repopick 256224 # hwc2: Fix compile errors in switch statement.
repopick 257241 # gralloc: Implement newly added gralloc1 functions
repopick 256592 # Revert "display: Define soong namespace"

# hardware/qcom-caf/msm8998/media
repopick 256178 # media: venc: Fix compilation error
repopick 256179 # mm-video-v412: fix -Wimplicit-fallthrough compilation

# hardware/qcom-caf/thermal
repopick 257197 # thermal: Use project pathmap

# hardware/qcom-caf/vr
repopick 257198 # vr: Use project pathmap

# hardware/qcom-caf/wlan
repopick 257199 # wlan-caf: Add guard makefile
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

# hardware/qcom/vr
repopick 257198 # vr: Use project pathmap

# hardware/ril
repopick 256551 # libril: allow board to provide libril
repopick 257211 # libril: Bounds check s_commands
repopick 257212 # libril: Restore support for RIL v6, v8 and v9 stacks
repopick 257213 # libril: Fix manual network selection with old modem
repopick 257210 # FR51015: Tuning of Binder buffer for rild.
repopick 257214 # Make RIL command headers overlayable by devices.

# packages/apps/AudioFX
repopick 256920 # AudioFX: Migrate to androidx

# packages/apps/Bluetooth
repopick 256600 # Bluetooth: Remove unused string resources
repopick 256601 # Fix null pointer exception on AvrcpTargetService

# packages/apps/Calendar
repopick 256602 # Calendar: adaptive icon
repopick 256603 # Calendar: Fix translatables

# packages/apps/Camera2
repopick 256640 # Camera2: adaptive icon
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
repopick 256651 # Contacts: define app category
repopick 256652 # Contacts: adaptive icon
repopick 256653 # Contacts: update splash screen to match the new icon
repopick 256654 # Contacts: Enable support for device contact.
repopick 256655 # Place MyInfo shortcut on drawer
repopick 256656 # Place EmergencyInfo shortcut on drawer
repopick 256657 # Allow calling contacts via specific phone accounts.
repopick 256658 # Contacts: use white nav bar
repopick 256659 # Contacts: Remove unused boolean resource
repopick 257054 # Contacts: Up minimum SDK to 26

# packages/apps/DeskClock
repopick 257139 # DeskClock - Moved the android:targetSdkVersion to 25 to fix "Clock has stopped" message displayed when Alarm trigger.
repopick 257140 # AOSP/DeskClock - Fix improperly formatted resource strings in DeskClock.
repopick 256660 # Deskclock: define app category
repopick 256661 # DeskClock: adaptive icon
repopick 256662 # DeskClock: Add back flip and shake actions
repopick 256663 # Provide upgrade path for cm-14.1 -> lineage-16.0
repopick 256664 # Make new menu entry to link to cLock widget settings.
repopick 256665 # DeskClock: Add support of power off alarm feature
repopick 256666 # DeskClock: Use POWER_OFF_ALARM permission

# packages/apps/Dialer
repopick 257129 # Dialer: define app category
repopick 257130 # Dialer: adaptive icon
repopick 257131 # Dialer: handle database upgrade from cm-14.1
repopick 257132 # Dialer: disable anti-falsing for call answer screen
repopick 257113 # Revert "Remove dialer sounds and vibrations settings fragments and redirect to the system sound
repopick 257114 # Add back in-call vibration features
repopick 257115 # Allow using private framework API.
repopick 257133 # Re-add dialer lookup.
repopick 257118 # Generalize the in-call vibration settings category
repopick 257119 # Add setting to enable Do Not Disturb during calls
repopick 257134 # Re-add call recording.
repopick 257124 # Move dialer from /product to /system.
repopick 257121 # Allow per-call account selection.
repopick 257122 # Re-add call statistics.
repopick 257135 # Control dialer's incoming call proximity sensor check via an overlay
repopick 257136 # Dialer: AudioModeProvider: use wired route for usb headsets

# packages/apps/DocumentsUI
repopick 256669 # DocumentsUI: define appcategory
repopick 256670 # DocumentsUI: adaptive icon

# packages/apps/Eleven
repopick 256230 # Migrate to AndroidX

# packages/apps/Email
repopick 256674 # Email: adaptive icon
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
repopick 256694 # Email: Fix generating id in android namespace

# packages/apps/FlipFlap
repopick 255432 # FlipFlap: Migrate to androidx

# packages/apps/LineageParts
repopick 256598 # LineageParts: Inject Trust into privacy settings
repopick 256409 # LineageParts: Reenable DisplayRotation
repopick 257021 # Reenable KeyHandler

# packages/apps/Messaging
repopick 256696 # Messaging: define app category
repopick 256697 # Messaging: adaptive icon
repopick 256698 # Messaging: Implement option for swipe right to delete.
repopick 256699 # Messaging: change Avatar fontFamily to sans-serif-medium
repopick 256700 # MessageQueue: Process pending messages per subscription
repopick 256701 # Messaging: Toggable keyboard emoticons access
repopick 256702 # Fix menu item highlight color.
repopick 256703 # Messaging App is crashing when storage memory is full
repopick 256704 # Messaging: bring back accent color
repopick 256705 # Messaging: Implement saved video attachments in MMS
repopick 256706 # Play an audible notification on receiving a class zero message.
repopick 256707 # Added support for video and audio mms attachments
repopick 256708 # Fixed storage permission issue for attachments
repopick 256709 # Messaging app crashes after a few MMS
repopick 256710 # Use app settings for conversation settings if no custom set
repopick 256711 # Messaging: fix bad recycle on sending two mms in a row
repopick 256712 # MediaPicker: Check for NPE
repopick 256713 # Messaging: Don't crash on unsupported shared content type
repopick 256714 # Messaging: Fix crash of blocked participant list activity
repopick 256715 # Messaging: Add "Mark as read" quick action for message notifications
repopick 256716 # Allow intent shared subject or title to be mms subject
repopick 256717 # Messaging: Fix crash when trying to view a vcf file
repopick 256718 # Messaging: use white nav bar
repopick 256719 # Don't build with platform certificate
repopick 256720 # Messaging: Fix generating id in android namespace
repopick 257185 # Messaging: improve notification channels
repopick 257186 # Implement per conversation channels
repopick 257187 # Remove notification settings from database
repopick 257188 # When removing a conversation, also remove its notification channel
repopick 257189 # Messaging: And there shall be light (LED)
repopick 257190 # Messaging: Avoid duplicating code

# packages/apps/Nfc
repopick 257191 # NFC: Clean duplicated and unknown permissions
repopick 256595 # NFC: Adding new vendor specific interface to NFC Service
repopick 256814 # NFCService: Add sysprop to prevent FW download during boot with NFC off.

# packages/apps/PackageInstaller
repopick 255658 # Revert "Remove Permissions Hub."
repopick 255659 # PermissionController: Enable permission hub by default

# packages/apps/Settings
repopick 257192 # Settings: adaptive icon
repopick 257024 # Settings: gesture: Add LineageParts touchscreen gesture settings
repopick 257025 # Settings: Allow devices to provide remote gesture preferences
repopick 256290 # Settings: Add setup UI for minimum delay between an app's notification sounds
repopick 256162 # Settings: Add rotation settings

# packages/apps/SetupWizard
repopick 256915 # SetupWizard: Migrate to androidx
repopick 257058 # Update for Q setup library changes
repopick 257064 # Add new method from ICaptivePortal
repopick 257065 # [HAX] Temporarily fix build due to PhoneMonitor API change

# packages/apps/Stk
repopick 256724 # Stk: adaptive icon

# packages/apps/Terminal
repopick 256725 # Terminal: define app category
repopick 256726 # Term: adaptive icon
repopick 256242 # TerminalKeys: Disable debug
repopick 256243 # Allow terminal app to show in LeanBack (1/2)
repopick 256244 # Terminal: Fix keyboard Ctrl- and ALT-key input.
repopick 256245 # Add settings for fullscreen, orientation, font size, color
repopick 256246 # Allow access to external storage
repopick 256247 # Term: materialize
repopick 256248 # Terminal: volume keys as up/down

# packages/apps/ThemePicker
repopick 256017 # ThemePicker: Properly update clock face setting

# packages/apps/Trebuchet
repopick 256018 # Revert "[DO NOT MERGE] Disable swipe down to pull noti shade for Q"
repopick 256019 # Launcher3: Export GridOptionsProvider

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

# packages/inputmethods/LatinIME
repopick 256747 # Remove extend touchable region for AOSP keyboard
repopick 256748 # Fix send button not being centered for non-standard densities.
repopick 256749 # Don't crash when displaying the " key
repopick 256750 # LatinIME: support for incognito mode
repopick 256751 # LatinIME: Regenerate KeyboardTextsTable
repopick 256752 # LatinIME: disable sound on keypress on all devices by default
repopick 256753 # LainIME: add unicode 9.0 chars
repopick 256754 # LatinIME: sync and rebuild emojis
repopick 256755 # LatinIME: Add fallback loader for JNI lib
repopick 256756 # Don't interrupt active gesture input by modifier key presses.
repopick 256757 # LatinIME: Add shortcuts support
repopick 256758 # LatinIME: Add "more" keys to ALL the keys
repopick 256759 # LatinIME: Add new type for Bulgarian script
repopick 256760 # LatinIME: Set proper keyboard for Georgian script
repopick 256761 # LatinIME: Add Bulgarian, Georgian and Ukrainian wordlists
repopick 256762 # LatinIME: Enable spellchecker for additional languages
repopick 256763 # LatinIME: HU enable predictive dictionary and remove unused letters
repopick 256764 # LatinIME: Add Hungarian QWERTY, enable predictive dictionary
repopick 256765 # Add support for Bépo keyboard layout
repopick 256766 # LatinIME: Add support for Australian English
repopick 256767 # LatinIME: Add Luxembourgish keyboard & spellchecking dictionary

# packages/providers/BlockedNumberProvider
repopick 256768 # BlockedNumberProvider: adaptive icon

# packages/providers/BookmarkProvider
repopick 256769 # BookmarkProvider: adaptive icon

# packages/providers/CalendarProvider
repopick 256770 # CalendarProvider: adaptive icon

# packages/providers/CallLogProvider
repopick 256771 # CallLogBackup: adaptive icon

# packages/providers/ContactsProvider
repopick 256772 # ContactsProvider: adaptive icon
repopick 256773 # ContactsProvider: Prevent device contact being deleted.
repopick 256774 # CallLogDatabase: Try to re-run the version 5 upgrade path

# packages/providers/MediaProvider
repopick 256775 # MediaProvider: adaptive icon

# packages/providers/TelephonyProvider
repopick 256779 # TelephonyProvider: adaptive icon
repopick 256780 # TelephonyProvider: add upgrade support from cm-14.1

# packages/services/BuiltInPrintService
repopick 256781 # fix PWG-Raster duplex case
repopick 256782 # add print service recommendations under More Options
repopick 256783 # fix crash during PCLM duplex job with odd page count
repopick 256784 # Move new strings to lineage_strings

# packages/services/Mms
repopick 256785 # Add app label
repopick 256786 # Mms: adaptive icon

# packages/services/Telecomm
repopick 256788 # Telecomm: adaptive icon
repopick 256161 # Telecomm: Make sensitive phone numbers not to be shown in call log history.
repopick 256265 # CallLog: Take into account multiple SIMs for sensitive numbers
repopick 256938 # Telecomm: Squashed phone_type switch support

# packages/services/Telephony
repopick 256791 # Telephony: adaptive icon
repopick 256792 # Telephony: Add ERI configuration for U.S. Cellular
repopick 256793 # Telephony: Support muting by RIL command
repopick 256794 # Fix non-protected broadcasts sent from phone process.
repopick 256795 # Don't start SIP service before decrypted
repopick 256796 # Telephony: Mark enhanced_4g_lte_mode_title_variant as untranslatable
repopick 256797 # Allow to disable the new scan API for manual network search.

# packages/wallpapers/LivePicker
repopick 256790 # LivePicker: adaptive icon

# system/core
repopick 255664 # mkbootimg: add support for --dt
repopick 255932 # adb: Add wait-for-online command
repopick 256086 # init: Add vendor-specific initialization hooks.
repopick 256219 # utils: Threads: Handle empty thread names
repopick 256908 # healthd: Add DASH charger type
repopick 256823 # Camera: Add feature extensions

# system/netd
repopick 256959 # netd: Allow devices to force-add directly-connected routes

# system/update_engine
repopick 257104 # update_engine: run backuptool script before normal postinstall script
repopick 257105 # update_engine: Transition to backuptool domain

# vendor/lineage
repopick 257154 # lineage: Remove unused ro.build.selinux
repopick 257155 # lineage: Cleanup PRODUCT_PACKAGES
repopick 257145 # common: Copy APN list to $(TARGET_COPY_OUT_PRODUCT)/etc
repopick 255933 # lineage: env: fixup recovery fstab path
repopick 256271 # qcom: Move to new qcom HAL directory layout
repopick 256273 # qcom: Set a pathmap variable for qcom superproject
repopick 256217 # soong_config: Add new flag for vendor_init
repopick 256422 # lineage: soong: replace space with colon on TARGET_LD_SHIM_LIBS
repopick 256960 # soong_config: add TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE
repopick 256900 # lineage: allow Has_legacy_camera_hal1 to provide Shared_libs
repopick 257000 # Remove apicheck.mk
repopick 257259 # kernel: Fix specifying custom clang compiler version
repopick 255667 # adb insecure by default

# vendor/codeaurora/telephony
repopick 257215 # Revert "IMS-VT: Low battery handling for Video calls"

# vendor/nxp/opensource/commonsys/packages/apps/Nfc
repopick 257216 # NFC: Clean duplicated and unknown permissions
repopick 257217 # Prevent OOB write in phFriNfc_ExtnsTransceive
repopick 257218 # Prevent OOB write in Mfc_Transceive
repopick 257219 # Prevent OOB Read in Mfc_Transceive

# vendor/qcom/opensource/data-ipa-cfg-mgr
repopick 257220 # data-ipa-cfg-mgr: Use project pathmap
repopick 257221 # data-ipa-cfg-mgr: Use generated kernel headers
repopick 257222 # data-ipa-cfg-mgr: Don't build ipacm tests on debug builds
repopick 257223 # data-ipa-cfg-mgr: Remove verbose cflag
repopick 257224 # data-ipa-cfg-mgr: Disable DEBUG for userdebug builds
repopick 257225 # data-ipa-cfg-mgr: Disable all the debugging
repopick 257226 # data-ipa-cfg-mgr: Disable NAT_DUMP on non-debug builds

# vendor/qcom/opensource/dataservices
repopick 257227 # dataservices: Don't pollute the tree
repopick 257228 # librmnetctl: Use generated kernel headers

# vendor/qcom/opensource/interfaces
repopick 257235 # Generate blueprints

# vendor/qcom/opensource/thermal-engine
repopick 257229 # Remove Android.mk
