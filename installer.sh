#!/bin/sh
#
#wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/multistalker1/main/installer.sh  -O - | /bin/sh
####################
####################
VERSION=1.4
PLUGIN_PATH='/usr/lib/enigma2/python/Plugins/Extensions/MultiStalker'
MY_URL="https://raw.githubusercontent.com/emil237/multistalker1/main"
PYTHON_VERSION=$(python -c"import platform; print(platform.python_version())")
if [ -f /etc/apt/apt.conf ] ; then
STATUS='/var/lib/dpkg/status'
OS='DreamOS'
elif [ -f /etc/opkg/opkg.conf ] ; then
STATUS='/var/lib/opkg/status'
OS='Opensource'
fi
if [ -d $PLUGIN_PATH ]; then
rm -rf $PLUGIN_PATH
fi
if [ "$PYTHON_VERSION" == 3.9.9 -o "$PYTHON_VERSION" == 3.9.7 ]; then
echo ":You have $PYTHON_VERSION image ..."
PYTHON='PY3'
elif [ "$PYTHON_VERSION" == 3.10.4 ]; then
echo ":You have $PYTHON_VERSION image ..."
PYTHONLAST='PY3'
elif [ "$PYTHON_VERSION" == 3.11.0 ]; then
echo ":You have $PYTHON_VERSION image ..."
PYTHONLASTV='PY3'
elif [ "$PYTHON_VERSION" == 3.8.5 ]; then
echo ":You have $PYTHON_VERSION image ..."
PYTHONSPA='PY3'
else
echo ":You have $PYTHON_VERSION image ..."
PYTHON='PY2'
fi
CHECK='/tmp/check'
uname -m > $CHECK
sleep 1;
if grep -qs -i 'mips' cat $CHECK ; then
echo "[ Your device is MIPS ]"
if [ "$PYTHON" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-mips-3.9.tar.gz" -O /tmp/MultiStalker_$VERSION-mips-3.9.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-mips-3.9.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-mips-3.9.tar.gz
elif [ "$PYTHONLAST" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-mips-3.10.tar.gz" -O /tmp/MultiStalker_$VERSION-mips-3.10.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-mips-3.10.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-mips-3.10.tar.gz
elif [ "$PYTHONLASTV" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-mips-3.11.tar.gz" -O /tmp/MultiStalker_$VERSION-mips-3.11.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-mips-3.11.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-mips-3.11.tar.gz
elif [ "$PYTHONSPA" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-mips-3.8.5.tar.gz" -O /tmp/MultiStalker_$VERSION-mips-3.8.5.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-mips-3.8.5.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-mips-3.8.5.tar.gz
else
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-mips-2.7.tar.gz" -O /tmp/MultiStalker_$VERSION-mips-2.7.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-mips-2.7.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-mips-2.7.tar.gz
fi
elif grep -qs -i 'armv7l' cat $CHECK ; then
echo "[ Your device is armv7l ]"
if [ "$PYTHON" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-arm-3.9.tar.gz" -O /tmp/MultiStalker_$VERSION-arm-3.9.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-arm-3.9.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-arm-3.9.tar.gz
elif [ "$PYTHONLAST" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-arm-3.10.tar.gz" -O /tmp/MultiStalker_$VERSION-arm-3.10.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-arm-3.10.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-arm-3.10.tar.gz
elif [ "$PYTHONLASTV" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-arm-3.11.tar.gz" -O /tmp/MultiStalker_$VERSION-arm-3.11.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-arm-3.11.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-arm-3.11.tar.gz
elif [ "$PYTHONSPA" = "PY3" ]; then
wget -q  "--no-check-certificate"   "$MY_URL/MultiStalker_$VERSION-arm-3.8.5.tar.gz" -O /tmp/MultiStalker_$VERSION-arm-3.8.5.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-arm-3.8.5.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-arm-3.8.5.tar.gz
else
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-arm-2.7.tar.gz" -O /tmp/MultiStalker_$VERSION-arm-2.7.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-arm-2.7.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-arm-2.7.tar.gz
fi
elif grep -qs -i 'aarch64' cat $CHECK ; then
echo "[ Your device is aarch64 ]"
if [ "$PYTHON" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker$VERSION-py3-aarch64.tar.gz" -O /tmp/MultiStalker_$VERSION-py3-aarch64.tar.gz
tar -xzf /tmp/MultiStalker$VERSION-py3-aarch64.tar.gz -C /
rm -f /tmp/MultiStalker$VERSION-py3-aarch64.tar.g
elif [ "$PYTHONLAST" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-py-3.10.tar.gz" -O /tmp/MultiStalker_$VERSION-py-3.10.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-py-3.10.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-py-3.10.tar.gz
elif [ "$PYTHONLASTV" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-py-3.10.6.tar.gz" -O /tmp/MultiStalker_$VERSION-py-3.10.6.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-py-3.10.6.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-py-3.10.6.tar.gz
else
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-aarch64-2.7.tar.gz" -O /tmp/MultiStalker_$VERSION-aarch64-2.7.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-aarch64-2.7.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-aarch64-2.7.tar.gz
fi
elif grep -qs -i 'sh4' cat $CHECK ; then
echo "[ Your device is sh4 ]"
if [ "$PYTHON" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker$VERSION-py3-sh4.tar.gz" -O /tmp/MultiStalker_$VERSION-py3-sh4.tar.gz
tar -xzf /tmp/MultiStalker$VERSION-py3-sh4.tar.gz -C /
rm -f /tmp/MultiStalker$VERSION-py3-sh4.tar.gz
elif [ "$PYTHONLAST" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-py-3.10.tar.gz" -O /tmp/MultiStalker_$VERSION-py-3.10.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-py-3.10.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-py-3.10.tar.gz
elif [ "$PYTHONLASTV" = "PY3" ]; then
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker_$VERSION-py-3.10.6.tar.gz" -O /tmp/MultiStalker_$VERSION-py-3.10.tar.gz
tar -xzf /tmp/MultiStalker_$VERSION-py-3.10.6.tar.gz -C /
rm -f /tmp/MultiStalker_$VERSION-py-3.10.6.tar.gz
else
wget -q  "--no-check-certificate" "$MY_URL/MultiStalker$VERSION-py2-sh4.tar.gz" -O /tmp/MultiStalker_$VERSION-py2-sh4.tar.gz
tar -xzf /tmp/MultiStalker$VERSION-py2-sh4.tar.gz -C /
rm -f /tmp/MultiStalker$VERSION-py2-sh4.tar.gz
fi
fi
echo ""
echo "#########################################################"
echo "#     MultiStalker $VERSION INSTALLED SUCCESSFULLY            #"
echo "#                    BY ZIKO                            #"
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



