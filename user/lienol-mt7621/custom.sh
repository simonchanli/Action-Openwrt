#!/bin/bash

echo "Test custom.sh"

source ../version

sed -i '/lienol/d'                         package/default-settings/files/zzz-default-settings
sed -i '/shadow/d'                     package/default-settings/files/zzz-default-settings
sed -i "s/#sed/sed/g"                package/default-settings/files/zzz-default-settings
sed -i "s/openwrt.proxy.ustclug.org/op.hyird.xyz/g"  package/default-settings/files/zzz-default-settings
sed -i "s/https/$version/g"  package/default-settings/files/zzz-default-settings
sed -i  's/http/releases\\\/19.07\-SNAPSHOT/g'  package/default-settings/files/zzz-default-settings

git clone https://github.com/fw876/helloworld.git  package/ssr
git clone https://github.com/hyird/passwall.git    package/passwall
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2   package/redsocks2
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/tcpping     package/tcpping
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks  package/microsocks

rm -rf package/lean/mt
svn checkout https://github.com/project-openwrt/openwrt/trunk/package/lean/luci-app-mtwifi
svn checkout https://github.com/project-openwrt/openwrt/trunk/package/lean/mt-drivers


