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
# Sync Lede package
git clone https://github.com/coolsnowwolf/lede.git lede
# Install ttyd
cp -r lede/package/lean/luci-app-ttyd openwrt/package/lean/luci-app-ttyd
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
