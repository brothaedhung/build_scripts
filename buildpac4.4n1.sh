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

./build-pac.sh -j3 n1 2>&1 | tee /home/edgar/logs/logn1.txt
wait

cd /home/edgar/pac4.4/out/target/product/n1/
filen1=$(echo pac_n1_*.zip)
cp $filen1 /media/sf_YAndroid/Dropbox/Public/PAC_Roms

cd /home/edgar/logs
filen1log=$(echo *n1*.txt)
cp $filen1log /media/sf_YAndroid/Dropbox/Public/PAC_Roms

echo ""
echo "File copy complete"
