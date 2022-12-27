#!/bin/bash
# ###########################################
# SCRIPT : DOWNLOAD AND INSTALL Multistalker
# ###########################################
#
# Command: wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/installer.sh -O - | /bin/sh
#
# ###########################################
versions="1.4"
###########################################
# Configure where we can find things here #
TMPDIR='/tmp'
PLUGINPATH='/usr/lib/enigma2/python/Plugins/Extensions/MultiStalker'
SETTINGS='/etc/enigma2/settings'
URL='https://raw.githubusercontent.com/emil237/multistalker1/main'
#PYTHON_VERSION=$(python -c"import sys; print(sys.hexversion)")
PYTHON_VERSION=$(python -c"import platform; print(platform.python_version())")
# FILE=/usr/lib/enigma2/python/Components/
# PY=Input.pyc
# SPA=/usr/bin/OpenSPA.info
#########################
if [ -f /etc/opkg/opkg.conf ]; then
    STATUS='/var/lib/opkg/status'
    OSTYPE='Opensource'
    OPKG='opkg update'
    OPKGINSTAL='opkg install'
elif [ -f /etc/apt/apt.conf ]; then
    STATUS='/var/lib/dpkg/status'
    OSTYPE='DreamOS'
    OPKG='apt-get update'
    OPKGINSTAL='apt-get install'
fi

#########################
if [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PLUGINPY3='enigma2-plugin-extensions-multistalker_py3_v1.4.tar.gz'
    rm -rf ${TMPDIR}/"${PLUGINPY3:?}"
elif [ "$PYTHON_VERSION" == 3.8.5 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PLUGINPY385='enigma2-plugin-extensions-multistalker_py3.8.5_v1.4.tar.gz'
    rm -rf ${TMPDIR}/"${PLUGINPY385:?}"    
elif [ "$PYTHON_VERSION" == 3.10.4 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PLUGINPY310='enigma2-plugin-extensions-multistalker_py3.10_v1.4.tar.gz'
    rm -rf ${TMPDIR}/"${PLUGINPY310:?}"
elif [ "$PYTHON_VERSION" == 3.11.0 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PLUGINPY311='enigma2-plugin-extensions-multistalker_p3.11_v1.4.tar.gz'
    rm -rf ${TMPDIR}/"${PLUGINPY311:?}"    
else
    echo ":You have $PYTHON_VERSION image ..."
    PLUGINPY2='enigma2-plugin-extensions-multistalker_p2.7_v1.4.tar.gz'
    rm -rf ${TMPDIR}/"${PLUGINPY2:?}"
fi

#########################
case $(uname -m) in
armv7l*) plarform="armv7" ;;
mips*) plarform="mipsel" ;;
aarch64*) plarform="ARCH64" ;;
sh4*) plarform="sh4" ;;
esac

#########################
rm -rf ${PLUGINPATH}
rm -rf /home/stalker.conf
#########################
install() {
    if grep -qs "Package: $1" $STATUS; then
        echo
    else
        $OPKG >/dev/null 2>&1
        echo "   >>>>   Need to install $1   <<<<"
        echo
        if [ $OSTYPE = "Opensource" ]; then
            $OPKGINSTAL "$1"
            sleep 1
            clear
        elif [ $OSTYPE = "DreamOS" ]; then
            $OPKGINSTAL "$1" -y
            sleep 1
            clear
        fi
    fi
}

#########################
if [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 -o "$PYTHON_VERSION" == 3.8.5 ] || [ "$PYTHON_VERSION" == 3.10.4 ] || [ "$PYTHON_VERSION" == 3.11.0 ]; then
    for i in enigma2-plugin-systemplugins-serviceapp ffmpeg gstplayer duktape wget python3-sqlite3; do
        install $i
    done
else
    for i in enigma2-plugin-systemplugins-serviceapp ffmpeg gstplayer duktape hlsdl wget python-sqlite3; do
        install $i
    done
fi

#########################
clear

if [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 ]; then
    echo "Downloading And Insalling Multistalker plugin Please Wait ......"
    echo
    wget --show-progress $URL/$PLUGINPY3 -qP $TMPDIR
    tar -xzf $TMPDIR/$PLUGINPY3 -C /
elif [ "$PYTHON_VERSION" == 3.8.5 ]; then
    echo "Downloading And Insalling Multistalker plugin Please Wait ......"
    echo
    wget --show-progress $URL/$PLUGINPY385 -qP $TMPDIR
    tar -xzf $TMPDIR/$PLUGINPY385 -C /    
elif [ "$PYTHON_VERSION" == 3.10.4 ]; then
    echo "Downloading And Insalling Multistalker plugin Please Wait ......"
    echo
    wget --show-progress $URL/$PLUGINPY310 -qP $TMPDIR
    tar -xzf $TMPDIR/$PLUGINPY310 -C /
elif [ "$PYTHON_VERSION" == 3.11.0 ]; then
    echo "Downloading And Insalling Multistalker plugin Please Wait ......"
    echo
    wget --show-progress $URL/$PLUGINPY311 -qP $TMPDIR
    tar -xzf $TMPDIR/$PLUGINPY311 -C /    
else
    echo "Downloading And Insalling Multistalker plugin Please Wait ......"
    echo
    wget --show-progress $URL/$PLUGINPY2 -qP $TMPDIR
    tar -xzf $TMPDIR/$PLUGINPY2 -C /
fi
#########################
if [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 ]; then
    rm -rf ${TMPDIR}/"${PLUGINPY3:?}"
elif [ "$PYTHON_VERSION" == 3.8.5 ]; then
    rm -rf ${TMPDIR}/"${PLUGINPY385:?}"    
elif [ "$PYTHON_VERSION" == 3.10.4 ]; then
    rm -rf ${TMPDIR}/"${PLUGINPY310:?}"
elif [ "$PYTHON_VERSION" == 3.11.0 ]; then
    rm -rf ${TMPDIR}/"${PLUGINPY311:?}"    
else
    rm -rf ${TMPDIR}/"${PLUGINPY2:?}"
fi
sync
echo ""
echo "***********************************************************************"
echo "**                                                                    *"
echo "**                       Multistalker  : $VERSION                      *"
echo "**                       Uploaded by: LINUXSAT                        *"
echo "**                                                                    *"
echo "***********************************************************************"
echo ""
if [ $OSTYPE = "DreamOS" ]; then
    sleep 2
    systemctl restart enigma2
else
    init 3
fi
exit 0















