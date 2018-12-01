@title AIO Fire Utility
@echo off
adb\adb.exe start-server

color 0e
echo  AIO Fire Utility 
echo ------------------------------------------------------------------------------------
echo Please type which generation of tablet are you using this script on and press enter.
echo 4 = 4
echo 5 = 5
echo 6 = 6
echo 7 = 7
echo Don't know? Settings - > Device Options -> Device Model     
echo Press a key to continue.
echo ------------------------------------------------------------------------------------
set Tablet=
set /p Tablet=""
cls


:OP0
cls
color 0e
echo.

echo  AIO Fire Utility 
echo ---------------------------------------------------------------------------------------------------------------
echo  To use this, Type the number of the option, and press the enter key. 
echo --------------------------------------------------------------------------------------------------------------
echo  1: Remove Amazon OTA from the user, and attempt to block updates.
echo  2: Remove Lockscreen ads.
echo  3: Remove Preloaded apps.
echo  4: Install Google Services, Enable sideloading apps.
echo  5: Reboot the Fire.
echo  6: Switch the Default Launcher.
echo  7: Install Fully Kiosk Browser.
echo  8: Install Extra Apps. (LANnouncer, Harmony, Spotify, Sonos, your choice)
echo  9: Keep device awake while charging.
echo  E: Do everything listed above.
echo  R: Reboot to Recovery.
echo  Q: Quit this program
echo --------------------------------------------------------------------------------------------------------------
set Choice=
set /p Choice=""

if '%Choice%'=='1' goto OP1
if '%Choice%'=='2' goto OP2
if '%Choice%'=='3' goto OP3
if '%Choice%'=='4' goto OP4
if '%Choice%'=='5' goto OP5
if '%Choice%'=='6' goto OP6
if '%Choice%'=='7' goto OP7
if '%Choice%'=='8' goto OP8
if '%Choice%'=='9' goto OP9
if '%Choice%'=='E' goto OPE
if '%Choice%'=='e' goto OPE
if '%Choice%'=='R' goto OPR
if '%Choice%'=='r' goto OPR
if '%Choice%'=='Q' exit
if '%Choice%'=='q' exit


:Download file, url
cd apps
if exist file echo File already exists!& cd %~dp0 & EXIT /B 0
powershell -Command "(New-Object Net.WebClient).DownloadFile('%~2', '%~1')"
if exist file echo %~1 Downloaded!
cd %~dp0
EXIT /B 0

:OPE
set Choice=E
cls
echo --------------------------------------------------------------------------------------------------------------
echo  1: Remove Amazon OTA from the user, and attempt to block updates.
echo        This is not confimrmed to work, but has had success on some devices.
echo  2: Remove Lockscreen ads.
echo        Once you factory reset - the ads will be back.
echo  3: Remove Preloaded apps.
echo        This will remove every Preloaded app exept for Camera, Settings, and Alexa (if on your OS version).
echo  4: Install Google Services.
echo  5: Reboot the Fire.
echo  6: Switch the Default Launcher to Nova.
echo  7: Install Fully Kiosk Browser.
echo  8: Install LANnouncer. (use the tablet as a wifi speaker)
echo  Please press any key to continue, or close the window to abort these changes.
echo --------------------------------------------------------------------------------------------------------------
pause >nul
goto OP1
	
	
	
:OP1

if '%Choice%'=='1' (
echo --------------------------------------------------------------------------------------------------------------
echo  This is not confimrmed to work. I reccomend trying this as it will try to block future updates.
echo  Please press any key to continue.
echo --------------------------------------------------------------------------------------------------------------
pause >nul
)
echo [*-*] Waiting for Device.
adb\adb.exe wait-for-device
echo attempting to block updates...
adb\adb.exe uninstall -k --user 0 com.amazon.settings.systemupdates
adb\adb.exe uninstall -k --user 0 com.amazon.device.software.ota
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.otter.oobe.forced.ota
adb\adb.exe shell pm clear --user 0 com.amazon.device.software.ota
adb\adb.exe shell pm clear --user 0 com.amazon.kindle.otter.oobe.forced.ota
adb\adb.exe shell pm clear --user 0 com.amazon.kindle.kso



if '%Choice%'=='E' goto OP2
echo %Choice%
echo if '%Choice%'=='E'
echo [*-*] Done! Press any key to continue.
pause >nul
goto OP0




:OP2
if '%Choice%'=='2' (
cls
echo --------------------------------------------------------------------------------------------------------------
echo Once you factory reset - the ads will be back. Press any key to continue.
echo --------------------------------------------------------------------------------------------------------------
pause >nul
)
echo [*-*] Waiting for Device.
adb\adb.exe wait-for-device
echo removing ads..
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.kso


if '%Choice%'=='E' goto OP3
echo Done! Press any key to continue.
pause >nul
goto OP0

:OP3
if '%Choice%'=='3' (
cls
echo --------------------------------------------------------------------------------------------------------------
echo This will remove every Preloaded app exept for Camera, Settings, and Alexa. I want you
echo to install the Google Services after this.
echo Press any key to continue
echo --------------------------------------------------------------------------------------------------------------
pause >nul
)

echo [*-*] Waiting for Device.
adb\adb.exe wait-for-device
echo removing preloaded apps...
echo You may see "Failure - not installed for 0" This is fine, and you can ignore it. It means the app is already uninstalled from the selected account.
adb\adb.exe uninstall -k --user 0 com.amazon.kindle
adb\adb.exe uninstall -k --user 0 com.audible.application.kindle
adb\adb.exe uninstall -k --user 0 com.amazon.tahoe
adb\adb.exe uninstall -k --user 0 com.amazon.platform
adb\adb.exe uninstall -k --user 0 com.amazon.client.metrics
adb\adb.exe uninstall -k --user 0 com.amazon.goodreads.kindle
adb\adb.exe uninstall -k --user 0 com.amazon.csapp
adb\adb.exe uninstall -k --user 0 com.amazon.cloud9
adb\adb.exe uninstall -k --user 0 com.amazon.avod
adb\adb.exe uninstall -k --user 0 com.amazon.weather
adb\adb.exe uninstall -k --user 0 com.amazon.h2settingsfortablet
adb\adb.exe uninstall -k --user 0 com.amazon.windowshop
adb\adb.exe uninstall -k --user 0 com.amazon.ags.app
adb\adb.exe uninstall -k --user 0 com.amazon.mp3
adb\adb.exe uninstall -k --user 0 com.amazon.photos.importer
adb\adb.exe uninstall -k --user 0 com.amazon.zico
adb\adb.exe uninstall -k --user 0 com.amazon.calculator
adb\adb.exe uninstall -k --user 0 com.android.email
adb\adb.exe uninstall -k --user 0 com.android.contacts
adb\adb.exe uninstall -k --user 0 com.amazon.dee.app
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.cms
adb\adb.exe uninstall -k --user 0 com.amazon.dp.fbcontacts
adb\adb.exe uninstall -k --user 0 com.android.calendar
adb\adb.exe uninstall -k --user 0 com.amazon.venezia
adb\adb.exe uninstall -k --user 0 com.amazon.photos
adb\adb.exe uninstall -k --user 0 com.android.deskclock
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.personal_video
adb\adb.exe uninstall -k --user 0 com.goodreads.kindle
adb\adb.exe uninstall -k --user 0 com.amazon.unifiedsharegoodreads
adb\adb.exe uninstall -k --user 0 com.android.downloads.iu
adb\adb.exe uninstall -k --user 0 com.android.music
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.unifiedSearch
adb\adb.exe uninstall -k --user 0 com.amazon.webapp
adb\adb.exe uninstall -k --user 0 org.mopria.printplugin
adb\adb.exe uninstall -k --user 0 com.amazon.geo.client.maps
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.kso
adb\adb.exe uninstall -k --user 0 com.amazon.geo.client.maps
adb\adb.exe uninstall -k --user 0 com.amazon.cloud9.kids
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.unifiedSearch
adb\adb.exe uninstall -k --user 0 com.amazon.ags.app
adb\adb.exe uninstall -k --user 0 com.amazon.camera
adb\adb.exe uninstall -k --user 0 jp.co.omronsoft.iwnnime.mlaz
adb\adb.exe uninstall -k --user 0 com.android.calendar
adb\adb.exe uninstall -k --user 0 com.android.contacts
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.otter.oobe.forced.ota
adb\adb.exe uninstall -k --user 0 com.amazon.kcp.tutorial
adb\adb.exe uninstall -k --user 0 jp.co.omronsoft.iwnnime.languagepack.zhcn_az
adb\adb.exe uninstall -k --user 0 com.amazon.kor.demo
adb\adb.exe uninstall -k --user 0 com.android.deskclock
adb\adb.exe uninstall -k --user 0 com.amazon.device.logmanager
adb\adb.exe uninstall -k --user 0 com.amazon.parentalcontrols
adb\adb.exe uninstall -k --user 0 com.amazon.socialplatform
adb\adb.exe uninstall -k --user 0 com.amazon.advertisingidsettings
adb\adb.exe uninstall -k --user 0 com.amazon.calculator
adb\adb.exe uninstall -k --user 0 com.amazon.client.metrics
adb\adb.exe uninstall -k --user 0 com.amazon.securitysyncclient
adb\adb.exe uninstall -k --user 0 com.amazon.device.crashmanager
adb\adb.exe uninstall -k --user 0 com.android.music
adb\adb.exe uninstall -k --user 0 com.android.wallpapercropper
adb\adb.exe uninstall -k --user 0 com.amazon.dp.contacts
adb\adb.exe uninstall -k --user 0 com.amazon.dp.fbcontacts
adb\adb.exe uninstall -k --user 0 com.amazon.webview
adb\adb.exe uninstall -k --user 0 com.amazon.client.metrics.api
adb\adb.exe uninstall -k --user 0 com.amazon.pm
adb\adb.exe uninstall -k --user 0 com.android.protips
adb\adb.exe uninstall -k --user 0 com.amazon.webview.metrics.service
adb\adb.exe uninstall -k --user 0 com.amazon.dp.logger
adb\adb.exe uninstall -k --user 0 com.amazon.unifiedsharegoodreads
adb\adb.exe uninstall -k --user 0 com.amazon.unifiedsharesinaweibo
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.personal_video
adb\adb.exe uninstall -k --user 0 com.amazon.unifiedsharetwitter
adb\adb.exe uninstall -k --user 0 com.amazon.unifiedsharefacebook
adb\adb.exe uninstall -k --user 0 com.amazon.tv.ottssocompanionapp
adb\adb.exe uninstall -k --user 0 com.amazon.photos
adb\adb.exe uninstall -k --user 0 com.amazon.precog
adb\adb.exe uninstall -k --user 0 com.amazon.ods.kindleconnect
adb\adb.exe uninstall -k --user 0 com.amazon.weather
adb\adb.exe uninstall -k --user 0 com.amazon.venezia
adb\adb.exe uninstall -k --user 0 com.amazon.csapp
adb\adb.exe uninstall -k --user 0 com.amazon.tahoe
adb\adb.exe uninstall -k --user 0 com.amazon.avod
adb\adb.exe uninstall -k --user 0 com.android.email
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.otter.oobe
adb\adb.exe uninstall -k --user 0 com.android.onetimeinitializer
adb\adb.exe uninstall -k --user 0 com.amazon.recess
adb\adb.exe uninstall -k --user 0 com.android.managedprovisioning
adb\adb.exe uninstall -k --user 0 com.amazon.mw
adb\adb.exe uninstall -k --user 0 com.amazon.mw.sdk
adb\adb.exe uninstall -k --user 0 com.amazon.communication.discovery
adb\adb.exe uninstall -k --user 0 com.amazon.connectivitydiag
adb\adb.exe uninstall -k --user 0 amazon.jackson19
adb\adb.exe uninstall -k --user 0 org.mopria.printplugin
adb\adb.exe uninstall -k --user 0 com.amazon.mp3
adb\adb.exe uninstall -k --user 0 com.amazon.photos.importer
adb\adb.exe uninstall -k --user 0 com.android.printspooler
adb\adb.exe uninstall -k --user 0 com.amazon.dcp
adb\adb.exe uninstall -k --user 0 com.amazon.platform.fdrw
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.otter.settings
adb\adb.exe uninstall -k --user 0 com.amazon.accessorynotifier
adb\adb.exe uninstall -k --user 0 com.amazon.frameworksettings
adb\adb.exe uninstall -k --user 0 com.android.backupconfirm
adb\adb.exe uninstall -k --user 0 com.android.sharedstoragebackup
adb\adb.exe uninstall -k --user 0 com.amazon.device.backup
adb\adb.exe uninstall -k --user 0 com.amazon.unifiedshare.actionchooser
adb\adb.exe uninstall -k --user 0 com.amazon.settings.systemupdates
adb\adb.exe uninstall -k --user 0 com.amazon.device.software.ota
adb\adb.exe uninstall -k --user 0 com.amazon.platformsettings
adb\adb.exe uninstall -k --user 0 com.kingsoft.office.amz
adb\adb.exe uninstall -k --user 0 com.amazon.application.compatibility.enforcer
adb\adb.exe uninstall -k --user 0 com.amazon.kindle.rdmdeviceadmin
adb\adb.exe uninstall -k --user 0 com.amazon.dynamicupdationservice
adb\adb.exe uninstall -k --user 0 com.amazon.application.compatibility.enforcer.sdk.library
adb\adb.exe uninstall -k --user 0 com.amazon.cloud9
adb\adb.exe shell pm disable "com.amazon.kindle.kso"
adb\adb.exe shell pm disable "com.amazon.geo.client.maps"
adb\adb.exe shell pm disable "com.amazon.cloud9.kids"
adb\adb.exe shell pm disable "com.amazon.kindle.unifiedSearch"
adb\adb.exe shell pm disable "com.amazon.ags.app"
adb\adb.exe shell pm disable "com.amazon.camera"
adb\adb.exe shell pm disable "jp.co.omronsoft.iwnnime.mlaz"
adb\adb.exe shell pm disable "com.android.calendar"
adb\adb.exe shell pm disable "com.android.contacts"
adb\adb.exe shell pm disable "com.amazon.kindle.otter.oobe.forced.ota"
adb\adb.exe shell pm disable "com.amazon.kcp.tutorial"
adb\adb.exe shell pm disable "jp.co.omronsoft.iwnnime.languagepack.zhcn_az"
adb\adb.exe shell pm disable "com.amazon.kor.demo"
adb\adb.exe shell pm disable "com.android.deskclock"
adb\adb.exe shell pm disable "com.amazon.device.logmanager"
adb\adb.exe shell pm disable "com.amazon.parentalcontrols"
adb\adb.exe shell pm disable "com.amazon.socialplatform"
adb\adb.exe shell pm disable "com.amazon.advertisingidsettings"
adb\adb.exe shell pm disable "com.amazon.calculator"
adb\adb.exe shell pm disable "com.amazon.client.metrics"
adb\adb.exe shell pm disable "com.amazon.securitysyncclient"
adb\adb.exe shell pm disable "com.amazon.device.crashmanager"
adb\adb.exe shell pm disable "com.android.music"
adb\adb.exe shell pm disable "com.android.wallpapercropper"
adb\adb.exe shell pm disable "com.amazon.dp.contacts"
adb\adb.exe shell pm disable "com.amazon.dp.fbcontacts"
adb\adb.exe shell pm disable "com.amazon.webview"
adb\adb.exe shell pm disable "com.amazon.client.metrics.api"
adb\adb.exe shell pm disable "com.amazon.pm"
adb\adb.exe shell pm disable "com.android.protips"
adb\adb.exe shell pm disable "com.amazon.webview.metrics.service"
adb\adb.exe shell pm disable "com.amazon.dp.logger"
adb\adb.exe shell pm disable "com.amazon.unifiedsharegoodreads"
adb\adb.exe shell pm disable "com.amazon.unifiedsharesinaweibo"
adb\adb.exe shell pm disable "com.amazon.kindle.personal_video"
adb\adb.exe shell pm disable "com.amazon.unifiedsharetwitter"
adb\adb.exe shell pm disable "com.amazon.unifiedsharefacebook"
adb\adb.exe shell pm disable "com.amazon.tv.ottssocompanionapp"
adb\adb.exe shell pm disable "com.amazon.photos"
adb\adb.exe shell pm disable "com.amazon.precog"
adb\adb.exe shell pm disable "com.amazon.ods.kindleconnect"
adb\adb.exe shell pm disable "com.amazon.weather"
adb\adb.exe shell pm disable "com.amazon.venezia"
adb\adb.exe shell pm disable "com.amazon.csapp"
adb\adb.exe shell pm disable "com.amazon.tahoe"
adb\adb.exe shell pm disable "com.amazon.avod"
adb\adb.exe shell pm disable "com.android.email"
adb\adb.exe shell pm disable "com.amazon.kindle.otter.oobe"
adb\adb.exe shell pm disable "com.android.onetimeinitializer"
adb\adb.exe shell pm disable "com.amazon.recess"
adb\adb.exe shell pm disable "com.android.managedprovisioning"
adb\adb.exe shell pm disable "com.amazon.mw"
adb\adb.exe shell pm disable "com.amazon.mw.sdk"
adb\adb.exe shell pm disable "com.amazon.communication.discovery"
adb\adb.exe shell pm disable "com.amazon.connectivitydiag"
adb\adb.exe shell pm disable "amazon.jackson19"
adb\adb.exe shell pm disable "org.mopria.printplugin"
adb\adb.exe shell pm disable "com.amazon.mp3"
adb\adb.exe shell pm disable "com.amazon.photos.importer"
adb\adb.exe shell pm disable "com.android.printspooler"
adb\adb.exe shell pm disable "com.amazon.dcp"
adb\adb.exe shell pm disable "com.amazon.platform.fdrw"
adb\adb.exe shell pm disable "com.amazon.kindle.otter.settings"
adb\adb.exe shell pm disable "com.amazon.accessorynotifier"
adb\adb.exe shell pm disable "com.amazon.frameworksettings"
adb\adb.exe shell pm disable "com.android.backupconfirm"
adb\adb.exe shell pm disable "com.android.sharedstoragebackup"
adb\adb.exe shell pm disable "com.amazon.device.backup"
adb\adb.exe shell pm disable "com.amazon.unifiedshare.actionchooser"
adb\adb.exe shell pm disable "com.amazon.settings.systemupdates"
adb\adb.exe shell pm disable "com.amazon.device.software.ota"
adb\adb.exe shell pm disable "com.amazon.platformsettings"
adb\adb.exe shell pm disable "com.kingsoft.office.amz"
adb\adb.exe shell pm disable "com.amazon.application.compatibility.enforcer"
adb\adb.exe shell pm disable "com.amazon.kindle.rdmdeviceadmin"
adb\adb.exe shell pm disable "com.amazon.dynamicupdationservice"
adb\adb.exe shell pm disable "com.amazon.application.compatibility.enforcer.sdk.library"
adb\adb.exe shell pm disable "com.amazon.cloud9"
echo You may see "Failure - not installed for 10" This is fine, and you can ignore it. It means the app is already uninstalled from the selected account.
adb\adb.exe uninstall -k --user 10 com.amazon.kindle
adb\adb.exe uninstall -k --user 10 com.audible.application.kindle
adb\adb.exe uninstall -k --user 10 com.amazon.tahoe
adb\adb.exe uninstall -k --user 10 com.amazon.platform
adb\adb.exe uninstall -k --user 10 com.amazon.client.metrics
adb\adb.exe uninstall -k --user 10 com.amazon.goodreads.kindle
adb\adb.exe uninstall -k --user 10 com.amazon.csapp
adb\adb.exe uninstall -k --user 10 com.amazon.cloud9
adb\adb.exe uninstall -k --user 10 com.amazon.avod
adb\adb.exe uninstall -k --user 10 com.amazon.weather
adb\adb.exe uninstall -k --user 10 com.amazon.h2settingsfortablet
adb\adb.exe uninstall -k --user 10 com.amazon.windowshop
adb\adb.exe uninstall -k --user 10 com.amazon.ags.app
adb\adb.exe uninstall -k --user 10 com.amazon.mp3
adb\adb.exe uninstall -k --user 10 com.amazon.photos.importer
adb\adb.exe uninstall -k --user 10 com.amazon.zico
adb\adb.exe uninstall -k --user 10 com.amazon.calculator
adb\adb.exe uninstall -k --user 10 com.android.email
adb\adb.exe uninstall -k --user 10 com.android.contacts
adb\adb.exe uninstall -k --user 10 com.amazon.dee.app
adb\adb.exe uninstall -k --user 10 com.amazon.kindle.cms
adb\adb.exe uninstall -k --user 10 com.amazon.dp.fbcontacts
adb\adb.exe uninstall -k --user 10 com.android.calendar
adb\adb.exe uninstall -k --user 10 com.amazon.venezia
adb\adb.exe uninstall -k --user 10 com.amazon.photos
adb\adb.exe uninstall -k --user 10 com.android.deskclock
adb\adb.exe uninstall -k --user 10 com.amazon.kindle.personal_video
adb\adb.exe uninstall -k --user 10 com.goodreads.kindle
adb\adb.exe uninstall -k --user 10 com.amazon.unifiedsharegoodreads
adb\adb.exe uninstall -k --user 10 com.android.downloads.iu
adb\adb.exe uninstall -k --user 10 com.android.music
adb\adb.exe uninstall -k --user 10 com.amazon.kindle.unifiedSearch
adb\adb.exe uninstall -k --user 10 com.amazon.webapp
adb\adb.exe uninstall -k --user 10 org.mopria.printplugin
adb\adb.exe uninstall -k --user 10 com.amazon.geo.client.maps
echo You may see "Failure - not installed for 10" This is fine, and you can ignore it. It means the app is already uninstalled from the selected account.


if '%Choice%'=='E' goto OP4
echo Done! Press any key to continue.
pause >nul
goto OP0

:OP4
if '%Choice%'=='4' (
echo.------------------------------------------------------------------------------------
echo This will install Google Play Store, Services, and Google Chrome. This will also
echo Install Google Photos and the Google App. You will need a Google account for this! 
echo DO NOT UNPLUG THE DEVICE. If it does get unplugged, restart this! 
echo Press any key to continue.
echo.------------------------------------------------------------------------------------
pause >nul
)

echo [*-*] Waiting for Device
adb\adb.exe wait-for-device
if '%Tablet%'=='4' goto GEN6
if '%Tablet%'=='5' goto GEN6
if '%Tablet%'=='6' goto GEN6
if '%Tablet%'=='7' goto GEN7


:GEN6

echo installing google services...
echo [*-*] Installing Google Account Manager 1 of 7
Call :Download GAM-6gen-1.apk "https://www.dropbox.com/s/75b9llm6s4bnsdd/GAM-6gen-1.apk?dl=1"
adb\adb.exe install apps/GAM-6gen-1.apk


echo [*-*] Installing Google Services Framework 2 of 7
Call :Download GSF-6gen-2.apk "https://www.dropbox.com/s/epka7mx5s38jrzk/GSF-6gen-2.apk?dl=1"
adb\adb.exe install apps/GSF-6gen-2.apk


echo [*-*] Installing Google Play Services 3 of 7
Call :Download GPServices-6gen-3.apk "https://www.dropbox.com/s/52s1agjcflusjki/GPServices-6gen-3.apk?dl=1"
adb\adb.exe install apps/GPServices-6gen-3.apk


echo [*-*] Installing Google Play Store 4 of 7
Call :Download GPStore-6gen-4.apk "https://www.dropbox.com/s/cjkbot4s2xnd83l/GPStore-6gen-4.apk?dl=1"
adb\adb.exe install apps/GPStore-6gen-4.apk


goto UNIVERSAL



:GEN6

echo installing google services...
echo [*-*] Installing Google Account Manager 1 of 7
Call :Download GAM-7gen-1.apk "https://www.dropbox.com/s/jsuf9dihhxvl18l/GAM-7gen-1.apk?dl=1"
adb\adb.exe install apps/GAM-7gen-1.apk


echo [*-*] Installing Google Services Framework 2 of 7
Call :Download GSF-7gen-2.apk "https://www.dropbox.com/s/h1f6hbutbixfmds/GSF-7gen-2.apk?dl=0"
adb\adb.exe install apps/GSF-7gen-2.apk


echo [*-*] Installing Google Play Services 3 of 7
Call :Download "https://www.dropbox.com/s/i1p0h9ys1iqx1p5/GPServices-7gen-3.apk?dl=1"
adb\adb.exe install apps/GPServices-7gen-3.apk


echo [*-*] Installing Google Play Store 4 of 7
Call :Download GPStore-7gen-4.apk "https://www.dropbox.com/s/w2u2rkbx3fsme3e/GPStore-7gen-4.apk?dl=1"
adb\adb.exe install apps/GPStore-7gen-4.apk


goto UNIVERSAL


:UNIVERSAL
echo [*-*] Installing Google Chrome 5 of 7
Call :Download FireChrome.apk "https://www.dropbox.com/s/qcp2vfen5b4o762/FireChrome.apk?dl=1"
adb\adb.exe install apps/FireChrome.apk


echo [*-*] Installing Google Photos 6 of 7
Call :Download GPhotos.apk "https://www.dropbox.com/s/ejebnf74sjpaixr/GPhotos.apk?dl=1"
adb\adb.exe install apps/GPhotos.apk


echo [*-*] Installing Google App 7 of 7
Call :Download GApp.apk "https://www.dropbox.com/s/hxunwxu4ci86gak/GApp.apk?dl=1"
adb\adb.exe install apps/GApp.apk



if '%Choice%'=='E' goto OP6
echo [*-*] Done! Press any key to continue.
pause >nul
goto OP0


:OP5
echo -------------------------------------------------------------------------------
echo rebooting....
echo -------------------------------------------------------------------------------
echo [*-*] Waiting for Devce.
adb\adb.exe wait-for-device
adb\adb.exe reboot
goto OP0

:OP6
if '%Choice%'=='6' (
echo -------------------------------------------------------------------------------
echo  I need to stress I take no credit whatsoever. 
echo  This will install a modded Launcher Hijack 3.0 and Nova Launcher.
echo  You will see a short flash of black before it launches Nova, this is normal, and unavoidable.
echo  TO RECOVER FROM THIS, YOU MUST RESET TO FACTORY SETTINGS
echo  Press any key to continue or close the window to abort.
echo -------------------------------------------------------------------------------
pause >nul
)
echo [*-*] Waiting for Device
adb\adb.exe wait-for-device
echo [*-*] Installing Launcher Hijack V3 1 of 4
Call :Download LauncherHijackV3.apk "https://www.dropbox.com/s/5l1mzn87a5q8ho6/LauncherHijackV3.apk?dl=1"
adb\adb.exe install apps/LauncherHijackV3.apk


echo [*-*] Installing Nova Launcher 2 of 4.
Call :Download Nova.apk "https://www.dropbox.com/s/0b5orsgtsbvuszw/Nova.apk?dl=1"
adb\adb.exe install apps/Nova.apk


echo [*-*] Install a "broken" Firelauncher 3 of 4.
Call :Download com.amazon.firelauncher.apk "https://www.dropbox.com/s/ooiva5s9f57rccf/com.amazon.firelauncher.apk?dl=1"
adb install -r -d apps/com.amazon.firelauncher.apk


echo [*-*] Enable use of widgets with Nova 4 of 4.
adb\adb.exe push appwidget.sh /storage/sdcard0/
adb\adb.exe shell appwidget grantbind --package com.teslacoilsw.launcher --user 0
echo [*-*] Accessibility Settings will now open, enable "To detect home button press" at the bottom of the list.
adb\adb.exe shell am start -a android.settings.ACCESSIBILITY_SETTINGS
echo Press any key when you have activated the setting, and setup..
pause>nul
echo LauncherHijackV3 will now open. Tap on Nova Launcher, and tap okay. Then press any key to continue.

adb\adb.exe shell monkey -p com.baronkiko.launcherhijack -c android.intent.category.LAUNCHER 1


pause>nul 



if '%Choice%'=='E' goto OP7
echo Done! Press any key to continue
pause >nul
goto OP0

:OP7
if '%Choice%'=='7' (
echo -------------------------------------------------------------------------------
echo  This will install Fully Kiosk Browser for Fire Tablets.
echo  Press any key to continue or close the window to abort.
echo -------------------------------------------------------------------------------
pause >nul
)
echo [*-*] Waiting for Device
adb\adb.exe wait-for-device
echo [*-*] Installing Fully Kiosk Browser 1 of 1.
Call :Download Fully-Kiosk-Browser-v1.28.1-fire.apk "https://www.dropbox.com/s/ivd1pfe2mt0mth0/Fully-Kiosk-Browser-v1.28.1-fire.apk?dl=1"
adb\adb.exe install apps/Fully-Kiosk-Browser-v1.28.1-fire.apk


if '%Choice%'=='E' goto OP8
echo Done! Press any key to continue
pause >nul
goto OP0

:OP8
if '%Choice%'=='8' (
echo.------------------------------------------------------------------------------------
echo Do you want to load any of these apps? Press y for each one you want. (lower case)
echo I do not claim to own any of these apps, and they are freely available. 
echo Sonos? (y/n)
set Sonos=
set /p Sonos=""
echo Harmony? (y/n)
set Harmony=
set /p Harmony=""
echo Spotify? (y/n)
set Spotify=
set /p Spotify=""
echo LANnouncer? (y/n)
set LANnouncer=
set /p LANnouncer=""

echo.------------------------------------------------------------------------------------
)
echo enabling sideloading apps...
adb\adb.exe shell settings put secure install_non_market_apps 1
pause >nul

if '%Choice%' =='E' (
set Sonos='y'
set Harmony='y'
set Spotify='y'
set LANnouncer='y'

)
echo [*-*] Waiting for Device
adb\adb.exe wait-for-device

if '%LANnouncer%' == 'y'( 
echo [*-*] Installing LANnouncer.
Call :Download LANnouncer.apk "https://www.dropbox.com/s/0xazouiy2cef2f2/LANnouncer.apk?dl=1"
adb\adb.exe install apps/LANnouncer.apk
)

if '%Spotify%' == 'y'( 

echo [*-*] Installing Spotify.
Call :Download spotify.apk "https://www.dropbox.com/s/1zf1tsyttidz6t4/spotify.apk?dl=1"
adb\adb.exe install apps/spotify.apk
)

if '%Harmony%' == 'y'( 

echo [*-*] Installing Harmony.
Call :Download harmony.apk "https://www.dropbox.com/s/mj8fhnfsk3evqur/harmony.apk?dl=1"
adb\adb.exe install apps/harmony.apk
)

if '%Sonos%' == 'y'( 

echo [*-*] Installing Sonos.
Call :Download  sonos.apk "https://www.dropbox.com/s/3slydgfuoqmzuce/sonos.apk?dl=1"
adb\adb.exe install apps/sonos.apk
)








if '%Choice%'=='E' goto OP9
echo Done! Press any key to continue
pause >nul
goto OP0


:OP9
if '%Choice%'=='9' (
echo -------------------------------------------------------------------------------
echo  This will Set the screen to stay on while power is plugged in.
echo  Press any key to continue or close the window to abort.
echo -------------------------------------------------------------------------------
pause >nul
)
echo [*-*] Waiting for Device
adb\adb.exe wait-for-device
echo [*-*] Setting screen to remain on while charging..
adb\adb.exe shell settings put global stay_on_while_plugged_in 1


if '%Choice%'=='E' goto OP5
echo Done! Press any key to continue
pause >nul
goto OP0



:OPR
echo -------------------------------------------------------------------------------
echo Reboot to recovery....
echo -------------------------------------------------------------------------------
echo [*-*] Waiting for Devce.
adb\adb.exe wait-for-device
adb\adb.exe reboot
goto OP0




