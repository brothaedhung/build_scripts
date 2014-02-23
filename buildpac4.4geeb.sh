#! /bin/bash
PATH=/home/edgar/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

cd /home/edgar/pac4.4
#/home/edgar/bin/repo sync -j2 -f
#wait

mv /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7 /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7-aosp

mv /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8-sm /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7

make clobber
wait

export USE_CCACHE=1
wait
export CCACHE_DIR=/home/edgar/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 100G
wait

./build-pac.sh -j3 geeb 2>&1 | tee /home/edgar/logs/loggeeb.txt
wait

cd ~/pac4.4/out/target/product/geeb/
filegeeb=$(echo pac_geeb_*.zip)
cp $filegeeb /media/sf_YAndroid/Dropbox/Public/PAC_Roms
wait

cd /home/edgar/logs
filegeeblog=$(echo *geeb*.txt)
cp $filegeeblog /media/sf_YAndroid/Dropbox/Public/PAC_Roms
wait

mv /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7 /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8-sm

mv /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7-aosp /home/edgar/pac4.4/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7


echo ""
echo "File copy complete"
