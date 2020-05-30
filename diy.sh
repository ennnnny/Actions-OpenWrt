#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.18.1/g' openwrt/package/base-files/files/bin/config_generate
# Install ServerChan
git clone https://github.com/tty228/luci-app-serverchan.git openwrt/package/lean/luci-app-serverchan
# Install passwall
cp -r lienol/luci-app-passwall openwrt/package/lean/luci-app-passwall
# Install luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git openwrt/package/lean/luci-theme-argon
# Sync Lede package
git clone https://github.com/coolsnowwolf/lede.git lede
# Install cifs-mount
cp -r lede/package/lean/luci-app-cifs-mount openwrt/package/lean/luci-app-cifs-mount
# Install ttyd
cp -r lede/package/lean/luci-app-ttyd openwrt/package/lean/luci-app-ttyd
# Install OpenClash
git clone -b master https://github.com/vernesong/OpenClash.git OpenClash
cp -r OpenClash/luci-app-openclash openwrt/package/lean/luci-app-openclash
