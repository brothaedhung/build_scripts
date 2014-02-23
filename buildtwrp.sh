#! /bin/bash

cd ~/pac44
PATH=~/bin:$PATH
make clobber

export USE_CCACHE=1
wait
export CCACHE_DIR=/home/edgar/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 100G
wait
. build/envsetup.sh
wait

lunch pac_geeb-userdebug
wait

make -j3 recoveryimage
wait

cd ~/pac44/out/target/product/geeb/
dt=$( date +%Y%M%d )
cp recovery.img "twrp_geeb_${dt}.img"
file=$(echo twrp*.img)
cp $file /media/sf_YAndroid/Dropbox/Public/LGOG_Roms
wait
echo ""
echo "File copy complete"
