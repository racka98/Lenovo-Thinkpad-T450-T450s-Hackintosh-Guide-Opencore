# Lenovo Thinkpad T450 & T450s Hackintosh Guide for Mojave, Catalina & Big Sur with Opencore
This repo contains the installation guide and EFI files required to get a perfectly functional Big Sur Public Release, Catalina and Mojave hackintosh on your T450 or T450s since they share the same hardware. Everything is stable and functional as described in this Readme. 

## A few worthy mentions about this repo:

- **This guide is not for models with Haswell 4th gen CPU**
- **The EFI folder and the patched ACPI were first created by [EchoEspirit](https://github.com/EchoEsprit/Hackintosh-Catalina-OpenCore-Lenovo-T450s-efi) and futher optimized by [i3p9](https://github.com/i3p9/Hackintosh-Catalina-OpenCore-Lenovo-T450s-efi). I tweaked a couple of things and fixed some errors that were happening on T450 + added Intel WiFi drivers from [Openintelwireless](https://github.com/OpenIntelWireless)**
- **I will try my best to keep the repo updated with the latest kexts and Opencore version**
- **This EFI works with Big Sur Public Release (11.x), Catalina and Mojave**
- **This EFI is Configured with Big Sur in mind. If you are using it on Catalina or Mojave read the the whole guide to know where to make the necessary changes**
- **With every EFI update you retrieve from here please remember to transfer your Device details like Serial number, MLB, ROM, Sytem-UUID and all of them under Platforminfo -> Generic**

![img](https://img.shields.io/github/last-commit/racka98/Lenovo-Thinkpad-T450-T450s-Hackintosh-Guide-Opencore.svg?color=red&label=Last%20Update) ![img](https://img.shields.io/badge/macOS%20Support-Big%20Sur--11-blue) ![img](https://img.shields.io/badge/OpenCore%20Version-0.6.6-yellow)

![About Mac Big Sur](https://imgur.com/vYo3Jt4.png)

# Introduction

EFI folder and Guide for Thinkpad T450 and T450s Hackintosh Catalina.

- `Tested CPUs`: **i5-5200U/5300u & i7-5600u**
- `Integrated Graphics`: **HD Graphics 5500**
- `Sound Card`: **ALC292**
- `Wireless Cards Tested`: **DW1820A 00JT494/Broadcom BCM94360CSAX/Intel 7265/7260**

# Bios

- `Security -> Security Chip`: **Disabled**;
- `Memory Protection -> Execution Prevention`: **Enabled**;
- `Virtualization -> Intel Virtualization Technology`: **Enabled**;
- `Virtualization -> Vt-directed IO`: **Disabled**;
- `Internal Device Access -> Bottom Cover Tamper Detection`: must be **Disabled**;
- `Anti-Theft -> Current Setting`: **Disabled**;
- `Anti-Theft -> Computrace -> Current Setting`: **Disabled**;
- `Secure Boot -> Secure Boot`: **Disabled**;
- `UEFI/Legacy Boot`: **UEFI Only**;
- `Fingerprint Sensor`: **Disabled** `(Causes issues with wake from sleep)`;
- `CSM Support`: **Yes**.

**Note: If you can't see any boot entries with CMS support set to Yes, change it to NO. After this you will get a garbled screen, to fix this put the laptop to sleep by closing the lid till the light starts blinking and wake it up**


# What works

- Sleep / Wake
- Wifi and Bluetooth (Built-in Intel 7265 or 7260 cards with Airportitlwm.kext) **itlwm.kext is recommended for those on Catalina because Airportitlwm causes issues with Trackpad after wake from sleep {See on Post Install}**
- AirPort Extreme (Broadcom BCM94360CSAX & NGFF A/E Adapter) **Recommended Upgrade to get native WiFi & Bluetooth**
- Handoff, Continuity, AirDrop
- iMessage, FaceTime, App Store, iTunes Store (Change Config.plist -> PlatformInfo -> Generic -> MLB and SystemSerialNumber)
- Ethernet
- Onboard audio (Use alc_fix to fix unworking jack after replug )
- USB 2.0 / USB 3.0
- Dual Batteries
- Touchpad
- Trackpoint
- miniDP
- SD Card Reader (Enable Sinetek-rtsx.kext in Config.plist because it is unstable to be left on by default)
- Use [one-key-hidpi](https://github.com/xzhih/one-key-hidpi) to enable HiDPI
- If you are using a usb mouse with side buttons, you can spoof apple usb mouse by change the pid and vid in AnyAppleUSBMouse.kext/Info.plist and enable it in config.plist.

# What doesn't work

- VGA
- Sidecar (Wired Sidecar works but only in Macbook9,1 SMBIOS, which has bad battery life, you can choose what you want)
- With the IntelBluetoothFirmware.kext and Airportitlwm.kext or itlwm.kext enabled Bluetooth headphones only work when you are not connected to any wifi network or turn off wifi. This is a known issue with 7265 and 7260 cards. You can get 8x series cards to fix this or buy the recomended cards (DW1820A 00JT494 or Broadcom BCM94360CSAX)

## Note: If you need to edit config.plist, don't use OpenCore configurator or Clover configurator, use PlistEdit pro (Included in Utilities) or Xcode.

# Installation Guide

## macOS Big Sur

**For this release it is essential you use macOS to create the install USB. An install USB created in Linux or windows won't work. If you don't have a real mac or another hackintosh you can always use a VM (See Note no. 2)**

**This is a simple and quick summary of the install USB creation** 
1. Download gibMacOS: https://github.com/corpnewt/gibMacOS

2. Right click then choose open on gibMacOS.command (it will launch in terminal)

3. Choose a number from the list provided (Big Sur will probably be number 1 in the list as 11.0.1 Public release)

4. It will download Big Sur (12.19 GB) and it will place the contents in gibMacOS folder under `macOS Downloads/publicrelease/11.0.1 macOS Big Sur`

5. Open the InstallAssistant.pkg that will extract the installer to your Applications folder

6. Format your usb drive to Mac OS Extentended (Journaled) with GUID partition scheme

7. Now run: `sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`

> MyVolume will be replaced by the name you gave to your usb when formatting it. Or you could name the usb as MyVolume when you were formatting.
> This will create the bootable usb that works on a real mac.

8. Now you can proceed with "Setting up OpenCore's EFI environment" from [here](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/mac-install.html#setting-up-the-installer).

9. Copy the OC and BOOT files from my EFI and fireup the installer.

10. Select Install macOS Big Sur from the boot menu and not the recovery partition.

The [Dortania Installation Guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/) is more detailed and you easily refer to it for more details. I haven't gotten time to write a detailed guide.

## Note: 
## 1. If you are installing Catalina or Mojave it is important that you disable Airportitlwm.kext in Kernel/Add/20 of Config.plist and enable itlwm.kext instead. Read Post Install #4.
## 2. For those having a black screen or frozen installer when booting the install USB, create the USB using macOS and not Linux or Windows. Details on that [here](https://github.com/racka98/Lenovo-Thinkpad-T450-T450s-Hackintosh-Guide-Opencore/issues/2#issuecomment-732408469)

# Post Install
Once you have verifed that your machine boots properly without any issues as described in the "What Works section", proceed to do the following

### 1. Disable Verbose mode (the black screen with logs on boot up)
In config.plist, navigate to NVRAM -> Add -> 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> boot-args and delete only the '-v' argument

### 2. Disable AppleDebug and ApplePanic
In the config.plist, naviaget to Misc -> Debug and change both AppleDebug and ApplePanic to False (NO)

You can also disable the boot picker screen so that you boot straight to th Apple logo by setting ShowPicker under Misc -> Boot to False (NO)

### 3. Enable WiFi with the Intel card on Catalina and Mojave
If you are on Catalina or Mojave, you can enable WiFi on the Intel card by navigating (in config.plist) to Kernel -> Add -> 20 and set Enabled to False/NO (Disabling Airportitlwm.kext) and in 21 set Enabled to True/YES (Enabling itlwm.kext). After enabling these and rebooting install Heliport App (included in Utilities).

Or you can use Airportitlwm.kext for Catalina from Intel WiFi Kexts folder and get native wifi on Catalina in the expense of loosing trackpad after wake from sleep.

**For those on Big Sur you can comfortably use the Airportitlwm.kext included as the trackpad issues after sleep do not happen on Big Sur.**

**Note:**

  **1. Airportitlwm.kext gives you native WiFi menu and enables location services, but often causes issues with the trackpad & trackpoint after waking from sleep (it doesn't work) on Catalina and Mojave (not Big Sur). A quick fix is to put the laptop to sleep again by closing the lid until the red sleep light starts to blink then waking the laptop again. Also it only happens when you put the laptop to sleep for a very long time (more than 2 or 3 hours). So for those who don't put their laptop to sleep for a very long time and just turn it off after use, this kext is ok to use.**
  
  **2. The Airportitlwm.kext included in this EFI is only for Big Sur. For those in Catalina or Mojave you should download the corresponding Airportitlwm.kext from [Openintelwireless](https://github.com/OpenIntelWireless) or use the one in Intel WiFi Kexts Folder of this repo (Recommended) and replace the one in EFI -> Kexts.**
  
### 4. Add Device Properties for Serial number and other info
Follow this [guide](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html#generate-a-new-serial) to set up serial number and the accompanying info to get iServices

