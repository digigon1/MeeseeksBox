# get directory where script is located
FULLDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# copy over share directory first, since it might be installed in the SD card or USB stick (USB untested)
cd "$FULLDIR/piratebox/share"
find -type f -print0 | sudo xargs -0 -n 1 -I {} mv '{}' '/opt/piratebox/share/{}'
cd ..
rm -r "share"
cd ..

# copy over all other files
cp -rlf "$FULLDIR/piratebox" /opt/ 

# fix droopy permissions (thank you /u/Voodooboy3000)
chmod 755 /opt/piratebox/bin/droopy

# create Videos, Images and Books directories
mkdir -p /opt/piratebox/share/Shared/Videos
mkdir -p /opt/piratebox/share/Shared/Images
mkdir -p /opt/piratebox/share/Shared/Books

# clean up
DIR="${PWD##*/}"
cd "$FULLDIR/.."
rm -r $DIR
