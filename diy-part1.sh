#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' openwrt/feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' openwrt/feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' openwrt/feeds.conf.default

# Update Luci
#sed -i 's/openwrt-luci.git;17.01/openwrt-luci.git;19.07/g' openwrt/feeds.conf.default
## Add Hello World
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' openwrt/feeds.conf.default
