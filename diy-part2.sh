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
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# 一、云编译自定义默认主题：修改[diy-part2.sh]文件
# 删除原主题：
# rm -rf package/lean/luci-theme-argon

# 添加新的主题：
# # git clone https://github.com/sypopo/luci-theme-atmaterial.git package/lean/luci-theme-atmaterial

# 取消bootstrap为默认主题：
# sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改bootstrap主题为atmaterial主题：
# sed -i 's/更改前的主题名/更改后的主题名/g' ./feeds/luci/collections/luci/Makefile
# sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial/g' ./feeds/luci/collections/luci/Makefile

# 修改某一文件格式：
# sed -i 's/更改前的信息/更改后的信息/g' ./要修改的文件的目录（可以用本地查看）

# 修改主机名字，把OpenWrt-CE修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-R4s'' package/lean/default-settings/files/zzz-default-settings

# 修改 Edge 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-edge/g' feeds/luci/collections/luci/Makefile 