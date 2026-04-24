#!/bin/bash
# ===============================================================================
# Custom Build Configuration
# ------------------------------------------------------------------------------
# Project   : ImmortalWrt for MT7981 (Philips HY3000)
# Repository: https://github.com/MomoFlora/immortalwrt-mt7981-philips-hy3000
# Maintainer: Zhao Wenwen
#
# Description:
#   Customized build pipeline based on P3TERX Actions-OpenWrt,
#   tailored for Philips HY3000 platform with MT7981 SoC.
# ===============================================================================

# 添加信息源
echo 'src-git qmodem https://github.com/FUjr/modem_feeds.git' >>feeds.conf.default
