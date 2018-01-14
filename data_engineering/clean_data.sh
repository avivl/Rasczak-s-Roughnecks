#!/usr/bin/env bash
BASE_DIR="/Users/aviv.laufer/Git/avivl/Rasczak-s-Roughnecks/image_dowloader/dataset"
STRAT=`pwd`
cd $BASE_DIR
for d in $(find $BASE_DIR -mindepth 1 -maxdepth 1 -type d); do
    echo Entering $d
    cd  $d
    echo "converting gif,jpeg  & png to jpg"
    for i in *.png ; do convert "$i" "${i%.*}.jpg" ; done
    for i in *.gif ; do convert "$i" "${i%.*}.jpg" ; done
    for i in *.jpeg ; do convert "$i" "${i%.*}.jpg" ; done
    echo "deleting non jpg files"
    find . -type f -exec bash -c 'file  "$1" | grep -q "JPEG image data" || rm "$1"' none {} \;
    cd ..
done

cd $STRAT
echo "We are all done!"