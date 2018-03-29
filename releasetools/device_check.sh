#!/sbin/sh
#
# Copyright (C) 2016 CyanogenMod Project
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

RAW_ID=`cat /sys/devices/soc0/raw_id`

if [ $RAW_ID == 1974 ] || [ $RAW_ID == 1973 ] || [ $RAW_ID == 1972 ]; then
    # Remove NFC
    rm -rf /system/app/NfcNci
    rm -rf /system/lib/*nfc*
    rm -rf /system/etc/*nfc*
    rm -rf /system/priv-app/Tag
    rm -rf /system/vendor/etc/*nfc*
    rm -rf /system/vendor/etc/permissions/*nfc*
    rm -rf /system/vendor/firmware/*bcm*
    rm -rf /system/vendor/lib/hw/android.hardware.nfc@*
    rm -rf /system/vendor/lib/hw/nfc_nci.bcm2079x.default.so
    rm -rf /system/vendor/bin/hw/android.hardware.nfc@*
    rm -rf /system/vendor/etc/init/android.hardware.nfc@*
    rm -rf /system/vendor/manifest_mi3.xml
    # Use Mi4 audio configs
    rm -rf /system/vendor/etc/acdbdata/MTP/MTP_Speaker_cal.acdb
    mv /system/vendor/etc/acdbdata/MTP/MTP_Speaker_cal_4.acdb /system/vendor/etc/acdbdata/MTP/MTP_Speaker_cal.acdb
    rm -rf /system/vendor/etc/mixer_paths.xml
    mv /system/vendor/etc/mixer_paths_4.xml /system/vendor/etc/mixer_paths.xml
    # Mi4 libdirac config
    rm -rf /system/vendor/etc/diracmobile.config
    mv /system/vendor/etc/diracmobile_4.config /system/vendor/etc/diracmobile.config
else
    # Replace manifests
    rm -rf /system/vendor/manifest.xml
    mv -f /system/vendor/manifest_mi3.xml /system/vendor/manifest.xml
    # Remove Mi4 consumerir support
    rm -rf /system/vendor/etc/permissions/android.hardware.consumerir.xml
    rm -rf /system/vendor/lib/hw/consumerir.msm8974.so
    rm -rf /system/vendor/lib/hw/android.hardware.ir@*.so
    rm -rf /system/vendor/bin/hw/android.hardware.ir@*.so
    # Remove Mi4 audio configs
    rm -rf /system/vendor/etc/acdbdata/MTP/MTP_Speaker_cal_4.acdb
    rm -rf /system/vendor/etc/mixer_paths_4.xml
    # Remove Mi4 libdirac config
    rm -rf /system/vendor/etc/diracmobile_4.config
fi
