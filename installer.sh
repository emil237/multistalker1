#!/bin/sh

#wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/installer.sh  -O - | /bin/sh
VERSION=1.4
TMPDIR='/tmp'
PLUGINPATH='/usr/lib/enigma2/python/Plugins/Extensions/MultiStalker'
SETTINGS='/etc/enigma2/settings'
URL='https://raw.githubusercontent.com/emil237/multistalker1/main'
PYTHON_VERSION=$(python -c"import platform; print(platform.python_version())")

if [ -f /etc/apt/apt.conf ] ; then
    STATUS='/var/lib/dpkg/status'
    OS='DreamOS'
elif [ -f /etc/opkg/opkg.conf ] ; then
   STATUS='/var/lib/opkg/status'
   OS='Opensource'
fi

# remove old version

if [ -d $PLUGIN_PATH ]; then

   rm -rf $PLUGIN_PATH
  
fi

if [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PYTHON='PY3'
    IMAGING='python3-imaging'
    PYSIX='python3-six'
elif [ "$PYTHON_VERSION" == 3.10.4 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PYTHONLAST='PY3'
    IMAGING='python3-imaging'
    PYSIX='python3-six'
elif [ "$PYTHON_VERSION" == 3.11.0 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PYTHONLASTV='PY3'
    IMAGING='python3-imaging'
    PYSIX='python3-six'
elif [ "$PYTHON_VERSION" == 3.8.5 ]; then
    echo ":You have $PYTHON_VERSION image ..."
    PYTHONSPA='PY3'
    IMAGING='python3-imaging'
    PYSIX='python3-six'            
else
    echo ":You have $PYTHON_VERSION image ..."
    PYTHON='PY2'
    IMAGING='python-imaging'
    PYSIX='python-six'
fi

if grep -q $IMAGING $STATUS; then
    imaging='Installed'
fi

if grep -q $PYSIX $STATUS; then
    six='Installed'
fi

if [ "$imaging" = "Installed" -a "$six" = "Installed" ]; then
     echo "All dependecies are installed"
else

    if [ $OS = "Opensource" ]; then
        echo "=========================================================================="
        echo "Some Depends Need to Be downloaded From Feeds ...."
        echo "=========================================================================="
        echo "Opkg Update ..."
        echo "========================================================================"
        opkg update
        echo "========================================================================"
        echo " Downloading $IMAGING , $PYSIX ......"
        opkg install $IMAGING
        echo "========================================================================"
        opkg install $PYSIX
        echo "========================================================================"
    else
        echo "=========================================================================="
        echo "Some Depends Need to Be downloaded From Feeds ...."
        echo "=========================================================================="
        echo "apt Update ..."
        echo "========================================================================"
        apt-get update
        echo "========================================================================"
        echo " Downloading $IMAGING , $PYSIX ......"
        apt-get install $IMAGING -y
        echo "========================================================================"
        apt-get install $PYSIX -y
        echo "========================================================================"
    fi


fi

if grep -q $IMAGING $STATUS; then
    echo ""
else
    echo "#########################################################"
    echo "#       $IMAGING Not found in feed                      #"
    echo "#########################################################"
fi

if grep -q $PYSIX $STATUS; then
    echo ""
else
    echo "#########################################################"
    echo "#       $PYSIX Not found in feed                        #"
    echo "#########################################################"
    exit 1
fi

CHECK='/tmp/check'
uname -m > $CHECK
sleep 1;
if grep -qs -i 'mips' cat $CHECK ; then
    echo "[ Your device is MIPS ]"
    if [ "$PYTHON" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-mips-3.9.tar.gz -O /tmp/MultiStalker_$VERSION-mips-3.9.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-mips-3.9.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-mips-3.9.tar.gz

    elif [ "$PYTHONLAST" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-mips-3.10.tar.gz -O /tmp/MultiStalker_$VERSION-mips-3.10.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-mips-3.10.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-mips-3.10.tar.gz

    elif [ "$PYTHONLASTV" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-mips-3.11.tar.gz -O /tmp/MultiStalker_$VERSION-mips-3.11.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-mips-3.11.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-mips-3.11.tar.gz

    elif [ "$PYTHONSPA" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-mips-3.8.5.tar.gz -O /tmp/MultiStalker_$VERSION-mips-3.8.5.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-mips-3.8.5.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-mips-3.8.5.tar.gz       
    else
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-mips-2.7.tar.gz -O /tmp/MultiStalker_$VERSION-mips-2.7.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-mips-2.7.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-mips-2.7.tar.gz

    fi
elif grep -qs -i 'armv7l' cat $CHECK ; then
    echo "[ Your device is armv7l ]"
    if [ "$PYTHON" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-arm-3.9.tar.gz -O /tmp/MultiStalker_$VERSION-arm-3.9.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-arm-3.9.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-arm-3.9.tar.gz
        
    elif [ "$PYTHONLAST" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-arm-3.10.tar.gz -O /tmp/MultiStalker_$VERSION-arm-3.10.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-arm-3.10.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-arm-3.10.tar.gz
        
    elif [ "$PYTHONLASTV" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-arm-3.11.tar.gz -O /tmp/MultiStalker_$VERSION-arm-3.11.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-arm-3.11.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-arm-3.11.tar.gz
    elif [ "$PYTHONSPA" = "PY3" ]; then
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-arm-3.8.5.tar.gz -O /tmp/MultiStalker_$VERSION-arm-3.8.5.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-arm-3.8.5.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-arm-3.8.5.tar.gz          
    else
        wget -q  "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/MultiStalker_$VERSION-arm-2.7.tar.gz -O /tmp/MultiStalker_$VERSION-arm-2.7.tar.gz
        tar -xzf /tmp/MultiStalker_$VERSION-arm-2.7.tar.gz -C /
        rm -f /tmp/MultiStalker_$VERSION-arm-2.7.tar.gz
    
   fi
echo ""
echo "#########################################################"
echo "#     multistalker $VERSION INSTALLED SUCCESSFULLY          #"
echo "#                    BY Linuxsat                        #"
echo "#########################################################"
echo "#                Restart Enigma2 GUI                    #"
echo "#########################################################"
sleep 2
if [ $OS = 'DreamOS' ]; then
    systemctl restart enigma2
else
    killall -9 enigma2
fi
exit 0

