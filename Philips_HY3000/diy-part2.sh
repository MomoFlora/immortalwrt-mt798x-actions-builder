#!/bin/bash

# 移除要替换的包
rm -rf feeds/packages/lang/golang
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/{luci-app-argon-config,luci-app-dae,luci-app-daed,luci-app-openclash,luci-app-openlist,luci-app-passwall,luci-app-homeproxy}
rm -rf feeds/packages/net/{dae,daed,xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,mosdns,naiveproxy,open-app-filter,openlist,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package/new
  cd .. && rm -rf $repodir
}

# Go 26
git clone --depth=1 -b 26.x https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang

# 添加额外插件
git clone --depth=1 -b v5 https://github.com/sbwml/luci-app-mosdns package/new/mosdns
git clone --depth=1 -b main https://github.com/sbwml/luci-app-openlist2 package/new/openlist
git clone --depth=1 -b main https://github.com/MomoFlora/luci-app-adguardhome package/new/adguardhome
git clone --depth=1 -b master https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter
git clone --depth=1 -b master https://github.com/muink/luci-app-netspeedtest package/new/luci-app-netspeedtest
git_sparse_clone main https://github.com/sbwml/openwrt_pkgs luci-app-socat luci-app-ota luci-app-wolplus otahelper bash-completion

# 科学上网插件
git clone --depth=1 https://github.com/ZeroWrt/openwrt_helloworld package/new/helloworld

# 主题
git clone --depth=1 -b openwrt-25.12 https://github.com/sbwml/luci-theme-argon package/new/luci-theme-argon
git clone --depth=1 -b master https://github.com/MomoFlora/luci-theme-design package/new/luci-theme-design
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

# bash
sed -i 's#ash#bash#g' package/base-files/files/etc/passwd
sed -i '\#export ENV=/etc/shinit#a export HISTCONTROL=ignoredups' package/base-files/files/etc/profile

# 设置版本号
sed -i 's/VERSION_DIST:=.*/VERSION_DIST:=$(if $(VERSION_DIST),$(VERSION_DIST),ZeroWrt)/' include/version.mk
sed -i 's/VERSION_MANUFACTURER:=.*/VERSION_MANUFACTURER:=$(if $(VERSION_MANUFACTURER),$(VERSION_MANUFACTURER),ZeroWrt)/' include/version.mk

# 设置作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='ZeroWrt-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By MomoFlora'/g" package/base-files/files/etc/openwrt_release
sed -i "s|^OPENWRT_RELEASE=\".*\"|OPENWRT_RELEASE=\"ZeroWrt 标准版 @R$(date +%Y%m%d) BY MomoFlora\"|" package/base-files/files/usr/lib/os-release
