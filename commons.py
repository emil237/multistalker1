from Tools.Directories import resolveFilename , SCOPE_PLUGINS , fileExists
from Components.config import config , ConfigInteger , ConfigSubsection , ConfigText ,ConfigSubList , ConfigSelection , ConfigYesNo
from enigma import getDesktop
from datetime import datetime
import os

NB_OF_PORTALS = 150

config.plugins.MultiStalker = ConfigSubsection()
config.plugins.MultiStalker.lastidx = ConfigInteger(default=0)
config.plugins.MultiStalker.ServiceType = ConfigSelection(default="1", choices=[
				("1", _("1 (Hardware)")),
				("4097", _("4097 (ServiceMp3)")),
				("5001", _("5001 (gstplayer)")),
				("5002", _("5002 (exteplayer3)")),
			])
config.plugins.MultiStalker.mainmenu = ConfigYesNo(default=False)
config.plugins.MultiStalker.portal = ConfigInteger(default = 0)
config.plugins.MultiStalker.portals = ConfigSubList()

for x in range(NB_OF_PORTALS):
	portals = ConfigSubsection()
	portals.portal = ConfigText(default = 'http://')
	config.plugins.MultiStalker.portals.append(portals)
 
conf = config.plugins.MultiStalker

def readFromFile(filename):
	_file = resolveFilename(SCOPE_PLUGINS, "Extensions/MultiStalker/{}".format(filename))
	with open(_file, 'r') as f:
		return f.read()

def log(data):
	now = datetime.now().strftime('%Y-%m-%d %H:%M')
	open('/tmp/MultiSTalker.log', 'a').write(now+' : '+str(data)+'\r\n')

def getDesktopSize():
	s = getDesktop(0).size()
	return (s.width(), s.height())

def isHD():
	desktopSize = getDesktopSize()
	return desktopSize[0] == 1280

def isDreamOS():
	if fileExists('/var/lib/dpkg/status'):
		return True
	else:
		return False

def getversioninfo():
    currversion = '1.0'
    version_file = resolveFilename(SCOPE_PLUGINS, "Extensions/MultiStalker/version")
    if os.path.exists(version_file):
        try:
            fp = open(version_file, 'r').readlines()
            for line in fp:
                if 'version' in line:
                    currversion = line.split('=')[1].strip()
        except:
            pass
    return (currversion)


Ver = getversioninfo()