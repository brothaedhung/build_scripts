#! /bin/bash
PATH=/home/edgar/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

cd /home/edgar/pac4.4
#/home/edgar/bin/repo sync -j2 -f
#wait

make clobber
wait

export USE_CCACHE=1
wait
export CCACHE_DIR=/home/edgar/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 100G
wait

./build-pac.sh -j3 flo 2>&1 | tee /home/edgar/logs/logflo.txt
wait

cd /home/edgar/pac4.4/out/target/product/flo/
fileflo=$(echo pac_flo_*.zip)
cp $fileflo /media/sf_YAndroid/Dropbox/Public/PAC_Roms

cd /home/edgar/logs
fileflolog=$(echo *flo*.txt)
cp $fileflolog /media/sf_YAndroid/Dropbox/Public/PAC_Roms

echo ""
echo "File copy complete"
