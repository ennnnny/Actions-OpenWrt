#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.18.1/g' openwrt/package/base-files/files/bin/config_generate
# Install ServerChan
git clone https://github.com/tty228/luci-app-serverchan.git openwrt/package/lean/luci-app-serverchan
# Add Other Theme
rm -rf openwrt/package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git openwrt/package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git openwrt/package/lean/luci-theme-edge
## Install passwall
#cp -r lienol/luci-app-passwall openwrt/package/lean/luci-app-passwall
## Sync Lede package
#git clone https://github.com/coolsnowwolf/lede.git lede
## Install ttyd
#cp -r lede/package/lean/luci-app-ttyd openwrt/package/lean/luci-app-ttyd
# Install OpenClash
git clone -b master https://github.com/vernesong/OpenClash.git OpenClash
cp -r OpenClash/luci-app-openclash openwrt/package/lean/luci-app-openclash
## integration clash core 实现编译更新后直接可用，不用手动下载clash内核
curl -sL -m 30 --retry 2 https://github.com/vernesong/OpenClash/releases/download/Clash/clash-linux-amd64.tar.gz -o /tmp/clash.tar.gz
tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
chmod +x /tmp/clash >/dev/null 2>&1
mkdir -p openwrt/package/lean/luci-app-openclash/files/etc/openclash/core
mv /tmp/clash openwrt/package/lean/luci-app-openclash/files/etc/openclash/core/clash >/dev/null 2>&1
rm -rf /tmp/clash.tar.gz >/dev/null 2>&1
#Backup OpenClash cofig
echo '/etc/openclash/' >> openwrt/package/base-files/files/etc/sysupgrade.conf

# Install JD-dailybonus
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git openwrt/package/lean/luci-app-jd-dailybonus

# Install smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git -b lede openwrt/package/luci-app-smartdns
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns openwrt/package/smartdns

# Sync Lienol package
git clone https://github.com/Lienol/openwrt.git Lienol
# Install adguardhome
cp -r Lienol/package/diy/luci-app-adguardhome openwrt/package/lean/luci-app-adguardhome

#强制关机插件
git clone https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
#自动关机插件
git clone https://github.com/sirpdboy/luci-app-autopoweroff package/luci-app-autopoweroff
