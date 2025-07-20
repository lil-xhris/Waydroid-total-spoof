#!/bin/bash

Waydroid Spoofing Script with 25 Devices, ADB Hiding, and Performance Props

Updates /var/lib/waydroid/waydroid.cfg and regenerates waydroid_base.prop

WAYDROID_CFG="/var/lib/waydroid/waydroid.cfg" BACKUP_CFG="${WAYDROID_CFG}.bak"

Backup original config

cp "$WAYDROID_CFG" "$BACKUP_CFG"

Device profiles

PROFILES=( "Pixel 5" "Samsung Galaxy S24" "Samsung Galaxy S24 Ultra" "RedMagic 8 Pro+" "RedMagic 7S Pro" "RedMagic 6 Pro" "OnePlus 9 Pro" "OnePlus 11" "OnePlus 12" "POCO X5 Pro" "POCO F5" "POCO F5 Pro" "Infinix Zero 30" "Infinix GT 10 Pro" "Infinix Zero Ultra" "Samsung Galaxy A54" "Samsung Galaxy A74" "Xiaomi 13" "Xiaomi 13T" "Xiaomi 12T Pro" "Tecno Camon 20 Premier" "Realme GT 3" "Vivo V27 Pro" "Nothing Phone 2" "ROG Phone 7 Ultimate" )

Choose profile

echo "Choose a device to spoof (1-${#PROFILES[@]}):" for i in "${!PROFILES[@]}"; do echo "$((i+1)). ${PROFILES[$i]}"; done read -rp "> " CHOICE CHOICE=$((CHOICE-1)) DEVICE="${PROFILES[$CHOICE]}"

Device-specific values (partial list for example)

case "$DEVICE" in "Pixel 5") BRAND="google" MANUFACTURER="Google" MODEL="Pixel 5" DEVICE_NAME="redfin" BUILD_FINGERPRINT="google/redfin/redfin:11/RQ3A.211001.001/eng.electr.20230318.111310:user/release-keys" ;; "Samsung Galaxy S24") BRAND="samsung" MANUFACTURER="Samsung" MODEL="SM-S921B" DEVICE_NAME="dm1q" BUILD_FINGERPRINT="samsung/dm1qxx/dm1q:14/UP1A.231005.007/S921BXXU1AWM9:user/release-keys" ;; "RedMagic 8 Pro+") BRAND="nubia" MANUFACTURER="nubia" MODEL="NX729J" DEVICE_NAME="nubia" BUILD_FINGERPRINT="nubia/NX729J/NX729J:13/SKQ1.220201.001/20230822.123456:user/release-keys" ;;

Add other cases here as needed

*) echo "Unknown device. Exiting." exit 1 ;; esac

Clean previous props

sed -i '/^/,$d' "$WAYDROID_CFG"

Append new properties

cat >> "$WAYDROID_CFG" <<EOF [properties] ro.product.brand=$BRAND ro.product.manufacturer=$MANUFACTURER ro.system.build.product=$DEVICE_NAME ro.product.name=$DEVICE_NAME ro.product.device=$DEVICE_NAME ro.product.model=$MODEL ro.system.build.flavor=${DEVICE_NAME}-user ro.build.fingerprint=$BUILD_FINGERPRINT ro.system.build.description=${DEVICE_NAME}-user 11 RQ3A.211001.001 eng.electr.20230318.111310 release-keys ro.bootimage.build.fingerprint=$BUILD_FINGERPRINT ro.build.display.id=$BUILD_FINGERPRINT ro.build.tags=release-keys ro.build.description=${DEVICE_NAME}-user 11 RQ3A.211001.001 eng.electr.20230318.111310 release-keys ro.vendor.build.fingerprint=$BUILD_FINGERPRINT ro.vendor.build.id=RQ3A.211001.001 ro.vendor.build.tags=release-keys ro.vendor.build.type=user ro.odm.build.tags=release-keys

Verified Boot + Root/ADB Hiding

ro.boot.verifiedbootstate=green ro.boot.flash.locked=1 ro.secure=1 ro.debuggable=0 ro.adb.secure=1 persist.sys.usb.config=none ro.build.type=user ro.build.selinux=1 ro.kernel.qemu=0 ro.secureboot.enable=1 ro.boot.selinux=enforcing

Gaming & Performance Props

debug.hwui.renderer=skiagl debug.egl.hw=1 debug.composition.type=gpu persist.sys.ui.hw=1 hwui.render_dirty_regions=false persist.sys.gpu.force=1 ro.opengles.version=196610 ro.hardware.egl=emulation persist.sys.use_16bpp_alpha=1 ro.surface_flinger.max_frame_buffer_acquired_buffers=3 persist.graphics.vulkan.disable=false persist.vulkan.enabled=1 persist.sys.sf.color_saturation=1.1 EOF

Apply changes

echo "Applying changes with 'waydroid upgrade --offline'..." waydroid upgrade --offline

echo "Spoofed as $DEVICE. Done."

