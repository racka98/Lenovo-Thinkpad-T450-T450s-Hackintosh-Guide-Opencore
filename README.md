# Lenovo Thinkpad T450 & T450s Hackintosh Guide for Catalina with Opencore
This repo contains the installation guide and EFI files required to get a perfectly functional Catalina 10.15.7 hackintosh on your T450 or T450s since they share the same hardware. Everything is stable and functional as described in this Readme. 

## A few worthy mentions about this repo**:

- **This guide is not for models with Haswell 4th gen CPU**
- **The EFI folder and the patched ACPI were first created by [EchoEspirit](https://github.com/EchoEsprit/Hackintosh-Catalina-OpenCore-Lenovo-T450s-efi) and futher optimized by [i3p9](https://github.com/i3p9/Hackintosh-Catalina-OpenCore-Lenovo-T450s-efi). I tweaked a couple of things and fixed some errors that were happening on T450 + added Intel WiFi drivers from [Openintelwireless](https://github.com/OpenIntelWireless)**
- **I will try my best to keep the repo updated with the latest kexts and Opencore version**
- **This EFI works with Big Sur Beta 9 but compatibility with future versions is not guaranteed until i update the kexts and Opencore version that will support the latest version of Big Sur**

![img](https://img.shields.io/github/last-commit/racka98/Lenovo-Thinkpad-T450-T450s-Hackintosh-Guide-Catalina-Opencore.svg?color=green&label=last-commit) ![img](https://img.shields.io/badge/macOS%20support-Catalina--10.15.7-blue) ![img](https://img.shields.io/badge/Opencore%20version-0.6.2-red)

![About Mac Big Sur](https://imgur.com/xAIkJh0.png)

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

# What works

- Sleep / Wake
- Wifi and Bluetooth (Built-in Intel 7265 or 7260 cards with Heliport + itlwm.kext) **Airportitlwm.kext is not recommended, it causes issues with Trackpad after wake from sleep**
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
- SD Card Reader (Thanks to @willmav5000)
- Use [one-key-hidpi](https://github.com/xzhih/one-key-hidpi) to enable HiDPI
- If you are using a usb mouse with side buttons, you can spoof apple usb mouse by change the pid and vid in AnyAppleUSBMouse.kext/Info.plist and enable it in config.plist.

# What doesn't work

- VGA
- Sidecar (Wired Sidecar works but only in Macbook9,1 SMBIOS, which has bad battery life, you can choose what you want)
- With the IntelBluetoothFirmware.kext and itlwm.kext enabled Bluetooth headphones only work when you are not connected to any wifi network or turn off wifi. This is a known issue with 7265 and 7260 cards. You can get 8x series cards to fix this or buy the recomended cards (DW1820A 00JT494 or Broadcom BCM94360CSAX)

## Note: If you need to edit config.plist, don't use OpenCore configurator or Clover configurator, use PlistEdit pro (Included in Utilities) or Xcode.

# Installation Guide

**COMING SOON**
