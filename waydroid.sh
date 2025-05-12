#!/bin/bash

echo "[+] Waydroid Device Spoofer"

# Device Profiles (16 real devices with 4 x86 devices marked as x86)
declare -A profiles
profiles["1"]="google|Google|redfin|Pixel 5|google/redfin/redfin:11/RQ3A.211001.001|release-keys|unknown|redfin|MIUI 12.5|bootloader:1234|baseband:12345|enforcing"
profiles["2"]="samsung|Samsung|SM-G970F|Galaxy S10e|samsung/bonito/bonito:11/RQ3A.210801.001|release-keys|exynos|exynos|MIUI 12.1|bootloader:5678|baseband:67890|permissive"
profiles["3"]="xiaomi|Xiaomi|beryllium|Mi 8|xiaomi/beryllium/beryllium:12/SP1A.210812.016|release-keys|snapdragon|sd845|MIUI 12.5|bootloader:91011|baseband:11223|enforcing"
profiles["4"]="samsung|Samsung|SM-G973F|Galaxy S10|samsung/herolte/hero:12/SP1A.210812.016|release-keys|exynos|exynos|MIUI 12.0|bootloader:14151|baseband:16171|permissive"
profiles["5"]="google|Google|blueline|Pixel 3|google/blueline/blueline:12/SP1A.210812.016|release-keys|unknown|unknown|MIUI 12.5|bootloader:18191|baseband:20212|enforcing"
profiles["6"]="huawei|Huawei|POT-LX1|Huawei P30|huawei/POT-LX1/POT-LX1:12/HUAWEI/POT-LX1:SP1A.210812.016|release-keys|kirin|kirin980|MIUI 11.0|bootloader:22323|baseband:24343|permissive"
profiles["7"]="sony|Sony|j8160|Xperia XZ3|sony/j8160/j8160:12/SP1A.210812.016|release-keys|snapdragon|sd845|MIUI 12.3|bootloader:25645|baseband:26789|enforcing"
profiles["8"]="oppo|OPPO|CPH2089|OPPO F11 Pro|oppo/cph2089/cph2089:11/RKQ1.200828.002|release-keys|mediatek|helio|MIUI 11.4|bootloader:27890|baseband:28901|permissive"
profiles["9"]="motorola|Motorola|edge|Motorola Edge|motorola/edge/edge:11/SP1A.210812.016|release-keys|snapdragon|sd765|MIUI 11.5|bootloader:30123|baseband:31234|enforcing"
profiles["10"]="realme|Realme|RMX1971|Realme 5 Pro|realme/RMX1971/RMX1971:11/SP1A.210812.016|release-keys|snapdragon|sd712|MIUI 12.0|bootloader:32345|baseband:33456|permissive"
profiles["11"]="oneplus|OnePlus|OnePlus7|OnePlus 7|oneplus/enchilada/enchilada:12/SP1A.210812.016|release-keys|snapdragon|sd855|MIUI 12.6|bootloader:34567|baseband:35678|enforcing"
profiles["12"]="xiaomi|Xiaomi|miatoll|Redmi Note 5|xiaomi/miatoll/miatoll:12/SP1A.210812.016|release-keys|snapdragon|sd636|MIUI 12.2|bootloader:37890|baseband:38901|permissive"
profiles["13"]="asus|Asus|ZS620KL|Asus Zenfone 5Z|asus/ZS620KL/ZS620KL:11/SP1A.210812.016|release-keys|snapdragon|sd845|MIUI 11.0|bootloader:40123|baseband:41234|enforcing"
profiles["14"]="nokia|Nokia|TA-1054|Nokia 6.1|nokia/plate/Nokia:11/RKQ1.200828.002|release-keys|snapdragon|sd630|MIUI 12.3|bootloader:42345|baseband:43456|permissive"
profiles["15"]="vivo|Vivo|V1932A|Vivo V15 Pro|vivo/v1932a/v1932a:12/SP1A.210812.016|release-keys|snapdragon|sd675|MIUI 12.1|bootloader:45678|baseband:46789|enforcing"
profiles["16"]="htc|HTC|htc_sailfish|HTC U11|htc/sailfish/sailfish:12/SP1A.210812.016|release-keys|snapdragon|sd835|MIUI 12.4|bootloader:47890|baseband:48901|permissive"

# x86 Device Profiles (with "(x86)" added to labels)
profiles["17"]="intel|Intel|x86_emulator|Android_x86_A|generic_x86/sdk_x86:11/RSR1.210722.001|test-keys|x86|x86|MIUI 12.0|bootloader:50012|baseband:51123|enforcing"
profiles["18"]="intel|Intel|x86_pc|Android_x86_B|generic_x86/sdk_x86:12/SP1A.210812.016|release-keys|x86|x86|MIUI 12.5|bootloader:52234|baseband:53345|permissive"
profiles["19"]="asus|Asus|x86_asus|Asus Zenfone 5X|asus/x86_asus/x86_asus:12/SP1A.210812.016|release-keys|x86|x86|MIUI 12.0|bootloader:54456|baseband:55567|enforcing"
profiles["20"]="microsoft|Microsoft|surface|Surface Duo|microsoft/surface/surface:11/SP1A.210812.016|release-keys|x86|x86|MIUI 12.5|bootloader:56678|baseband:57789|permissive"

echo "[+] Select device profile:"
# Print devices 1 to 10 on the left
for i in {1..10}; do
    model=$(echo "${profiles[$i]}" | cut -d'|' -f4)
    echo "  $i) $model"
done

# Print devices 11 to 20 on the right
echo -e "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
for i in {11..20}; do
    model=$(echo "${profiles[$i]}" | cut -d'|' -f4)
    echo -e "\t$i) $model"
done

read -p "Enter choice (1-20): " choice

if [ -z "${profiles[$choice]}" ]; then
    echo "[!] Invalid selection. Exiting."
    exit 1
fi

# Parse selected profile
IFS='|' read brand manufacturer device model fingerprint tags board hardware miui bootloader baseband selinux <<< "${profiles[$choice]}"

# Generate random IDs
android_id=$(openssl rand -hex 8)
gsf_id=$(( (RANDOM << 16) + RANDOM ))

# Display selected device information
echo "[+] Selected Device: $custom_name"
echo "  - CPU: $custom_cpu"
echo "  - CU: $custom_cu"
echo "  - Brand: $brand"
echo "  - Manufacturer: $manufacturer"
echo "  - Device: $device"
echo "  - Model: $model"
echo "  - Fingerprint: $fingerprint/$tags"
echo "  - MIUI Version: $miui"
echo "  - Bootloader: $bootloader"
echo "  - Baseband: $baseband"
echo "  - SELinux: $selinux"
echo "  - Android ID: $android_id"
echo "  - GSF ID: $gsf_id"
echo "  - Board: $board"
echo "  - Hardware: $hardware"

# Now apply the spoofing to Waydroid's base.prop
echo "[+] Applying spoofing..."
sudo tee -a /var/lib/waydroid/waydroid_base.prop > /dev/null <<EOF
ro.product.brand=$brand
ro.product.manufacturer=$manufacturer
ro.product.device=$device
ro.product.model=$model
ro.product.name=$device
ro.system.build.fingerprint=$fingerprint/$tags
ro.build.fingerprint=$fingerprint/$tags
ro.vendor.build.fingerprint=$fingerprint/$tags
ro.kernel.qemu=0
ro.boot.qemu=0
ro.secure=1
ro.debuggable=0
persist.sys.usb.config=none
persist.service.adb.enable=0
settings_secure_android_id=$android_id
settings_secure_gsf_id=$gsf_id
cpu.custom=$custom_cpu
cu.custom=$custom_cu
EOF

echo "[+] Spoofing complete!"
echo "[!] Now run: 'waydroid session stop && waydroid session start' to apply changes."
echo "Verify using com.ytheekshana.deviceinfo"
# Restart Waydroid
echo "[+] Restarting Waydroid and applying changes..."
echo "[✓] Spoofing complete and Waydroid restarting!"
waydroid session stop
sleep 2
waydroid show-full-ui
